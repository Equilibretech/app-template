#!/usr/bin/env bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Function to generate slug from service name
generate_slug() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-\|-$//g'
}

# Function to check if cookiecutter is available
check_cookiecutter() {
  if command -v cookiecutter >/dev/null 2>&1; then
    return 0
  else 
    return 1
  fi
}

# Function to cleanup unused files based on language choice
cleanup_files() {
  local lang=$1
  
  log_info "Cleaning up unused files for language: $lang"
  
  # Remove unused package files
  case $lang in
    "node")
      rm -f pyproject.toml requirements.txt go.mod
      rm -f Dockerfile.python Dockerfile.go
      rm -f .github/workflows/ci-python.yml .github/workflows/ci-go.yml
      ;;
    "python")
      rm -f package.json go.mod
      rm -f Dockerfile.node Dockerfile.go  
      rm -f .github/workflows/ci-node.yml .github/workflows/ci-go.yml
      ;;
    "go")
      rm -f package.json pyproject.toml requirements.txt
      rm -f Dockerfile.node Dockerfile.python
      rm -f .github/workflows/ci-node.yml .github/workflows/ci-python.yml
      ;;
  esac
  
  # Rename the correct Dockerfile
  if [[ -f "Dockerfile.$lang" ]]; then
    mv "Dockerfile.$lang" Dockerfile
    log_success "Renamed Dockerfile.$lang to Dockerfile"
  fi
  
  # Rename the correct CI workflow
  if [[ -f ".github/workflows/ci-$lang.yml" ]]; then
    mv ".github/workflows/ci-$lang.yml" .github/workflows/ci.yml
    log_success "Renamed ci-$lang.yml to ci.yml"
  fi
}

# Function to activate terraform modules based on cloud choice
activate_terraform_modules() {
  local cloud=$1
  
  log_info "Activating Terraform modules for cloud: $cloud"
  
  # Uncomment the relevant provider and module in main.tf
  case $cloud in
    "aws")
      sed -i 's/^# \(.*# AWS Provider\)/\1/' infra/main.tf
      sed -i 's/^# \(.*# AWS Module\)/\1/' infra/main.tf
      ;;
    "gcp")
      sed -i 's/^# \(.*# GCP Provider\)/\1/' infra/main.tf  
      sed -i 's/^# \(.*# GCP Module\)/\1/' infra/main.tf
      ;;
    "azure")
      sed -i 's/^# \(.*# Azure Provider\)/\1/' infra/main.tf
      sed -i 's/^# \(.*# Azure Module\)/\1/' infra/main.tf
      ;;
    "local")
      log_warning "Local development selected - no cloud infrastructure will be provisioned"
      ;;
  esac
  
  # Copy the relevant terraform module to the main infra directory
  if [[ "$cloud" != "local" && -d "infra/modules/$cloud" ]]; then
    cp -r "infra/modules/$cloud"/* infra/
    log_success "Copied $cloud module configuration to infra/"
  fi
}

# Function to update Helm values based on language
update_helm_values() {
  local lang=$1
  
  log_info "Updating Helm values for language: $lang"
  
  # Update target port based on language conventions
  case $lang in
    "node")
      sed -i 's/targetPort: .*/targetPort: 3000/' deploy/helm-chart/values.yaml
      ;;
    "python")
      sed -i 's/targetPort: .*/targetPort: 8000/' deploy/helm-chart/values.yaml
      ;;
    "go")
      sed -i 's/targetPort: .*/targetPort: 8080/' deploy/helm-chart/values.yaml
      ;;
  esac
}

# Main initialization function using cookiecutter
init_with_cookiecutter() {
  log_info "Using Cookiecutter for template initialization..."
  
  # Run cookiecutter
  if cookiecutter . --no-input 2>/dev/null; then
    log_success "Cookiecutter initialization completed successfully"
    return 0
  else
    log_error "Cookiecutter initialization failed"
    return 1
  fi
}

# Fallback initialization function with manual prompts
init_with_prompts() {
  log_info "Using manual prompts for template initialization..."
  
  # Collect user input
  printf "Service name (e.g., 'My Awesome Service'): "
  read -r service_name
  
  printf "Programming language (node/python/go): "
  read -r lang
  
  printf "Cloud provider (aws/gcp/azure/local): "
  read -r cloud
  
  # Validate inputs
  if [[ ! "$lang" =~ ^(node|python|go)$ ]]; then
    log_error "Invalid language. Must be one of: node, python, go"
    exit 1
  fi
  
  if [[ ! "$cloud" =~ ^(aws|gcp|azure|local)$ ]]; then
    log_error "Invalid cloud provider. Must be one of: aws, gcp, azure, local"
    exit 1
  fi
  
  # Generate slug
  service_slug=$(generate_slug "$service_name")
  
  log_info "Service Name: $service_name"
  log_info "Service Slug: $service_slug"
  log_info "Language: $lang"
  log_info "Cloud: $cloud"
  
  # Replace placeholders in files
  log_info "Replacing template variables..."
  
  find . -type f -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.json" -o -name "*.tf" -o -name "*.tpl" | \
  xargs sed -i "s/{{ cookiecutter.service_name }}/$service_name/g"
  
  find . -type f -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.json" -o -name "*.tf" -o -name "*.tpl" | \
  xargs sed -i "s/{{ cookiecutter.service_slug }}/$service_slug/g"
  
  find . -type f -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.json" -o -name "*.tf" -o -name "*.tpl" | \
  xargs sed -i "s/{{ cookiecutter.lang }}/$lang/g"
  
  find . -type f -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.json" -o -name "*.tf" -o -name "*.tpl" | \
  xargs sed -i "s/{{ cookiecutter.cloud }}/$cloud/g"
  
  # Clean up unused files
  cleanup_files "$lang"
  
  # Activate terraform modules
  activate_terraform_modules "$cloud"
  
  # Update Helm values
  update_helm_values "$lang"
  
  log_success "Template initialization completed successfully"
}

# Function to remove init files after successful initialization
cleanup_init_files() {
  log_info "Cleaning up initialization files..."
  rm -f cookiecutter.json init.sh
  log_success "Initialization files removed"
}

# Function to initialize git repository
init_git_repo() {
  if [[ ! -d .git ]]; then
    log_info "Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit from app-template

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
    log_success "Git repository initialized with initial commit"
  else
    log_warning "Git repository already exists, skipping initialization"
  fi
}

# Function to display next steps
show_next_steps() {
  local lang=${1:-"your-chosen-language"}
  local cloud=${2:-"your-chosen-cloud"}
  
  echo ""
  log_success "🎉 Template initialization completed successfully!"
  echo ""
  echo "📋 Next steps:"
  echo ""
  echo "1. 📖 Review and update documentation:"
  echo "   - README.md: Add project description and specific instructions"
  echo "   - docs/design_doc.md: Complete technical design documentation"
  echo "   - docs/adr/001-*.md: Create your first architecture decision record"
  echo ""
  echo "2. 🔧 Set up development environment:"
  
  case $lang in
    "node")
      echo "   - npm install"
      echo "   - npm run dev"
      ;;
    "python")
      echo "   - pip install -e \".[dev]\""
      echo "   - python -m src.main"
      ;;
    "go")
      echo "   - go mod tidy"
      echo "   - go run src/main.go"
      ;;
    *)
      echo "   - Install dependencies for your chosen language"
      echo "   - Start the development server"
      ;;
  esac
  
  echo ""
  echo "3. 🏗️ Set up infrastructure (if using cloud):"
  if [[ "$cloud" != "local" ]]; then
    echo "   - cd infra"
    echo "   - terraform init"
    echo "   - terraform plan"
    echo "   - terraform apply"
  else
    echo "   - docker-compose -f observability/otel-compose.yml up -d"
  fi
  
  echo ""
  echo "4. 🚀 Set up CI/CD:"
  echo "   - Push to GitHub: git remote add origin git@github.com:Equilibretech/projects-<slug>.git"
  echo "   - GitHub Actions will automatically run on push"
  echo "   - Deploy with ArgoCD: kubectl apply -f deploy/argocd-app.yaml"
  echo ""
  echo "5. 📊 Monitor your application:"
  echo "   - Prometheus: http://localhost:9090"
  echo "   - Grafana: http://localhost:3000"
  echo "   - Jaeger: http://localhost:16686"
  echo ""
  echo "🎯 Happy coding! Your application template is ready to use."
}

# Main execution
main() {
  echo ""
  log_info "🚀 Initializing {{ cookiecutter.service_name || 'Application' }} Template"
  echo ""
  
  # Check if we're in a git repository
  if [[ -d .git ]]; then
    log_warning "Already in a git repository. Template will be initialized in current directory."
  fi
  
  # Try cookiecutter first, fallback to manual prompts
  if check_cookiecutter; then
    log_info "Cookiecutter detected, using automated initialization..."
    if ! init_with_cookiecutter; then
      log_warning "Cookiecutter failed, falling back to manual prompts..."
      init_with_prompts
    fi
  else
    log_info "Cookiecutter not found, using manual prompts..."
    log_info "💡 Tip: Install cookiecutter (pip install cookiecutter) for better experience"
    echo ""
    init_with_prompts
  fi
  
  # Initialize git repository
  init_git_repo
  
  # Clean up initialization files
  cleanup_init_files
  
  # Show next steps
  show_next_steps
}

# Run main function if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi