# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Equilibretech App Template** - a comprehensive, production-ready template for creating new application projects. It supports multiple programming languages (Node.js, Python, Go) and cloud providers (AWS, GCP, Azure, Local).

## Template Initialization

### First Time Setup
```bash
# Initialize the template
./init.sh

# The script will:
# 1. Ask for service name, language, and cloud provider
# 2. Replace template variables throughout files
# 3. Remove unused language-specific files
# 4. Configure infrastructure for chosen cloud
# 5. Set up git repository with initial commit
```

### Alternative with Cookiecutter
```bash
# If cookiecutter is installed
cookiecutter .
```

## Project Structure

```
├── src/                           # Application source code
├── tests/                         # Test files
├── docs/                          # Documentation
│   ├── design_doc.md             # Technical design document
│   └── adr/                      # Architecture Decision Records
├── deploy/                        # Deployment configuration
│   ├── helm-chart/               # Helm chart for Kubernetes
│   └── argocd-app.yaml          # ArgoCD application manifest
├── infra/                         # Infrastructure as Code
│   ├── main.tf, variables.tf    # Terraform configuration
│   └── modules/                  # Cloud-specific modules
├── observability/                 # Monitoring and observability
│   ├── otel-compose.yml         # OpenTelemetry stack
│   └── slo.yaml                 # Service Level Objectives
├── .github/workflows/            # CI/CD pipelines
└── a11y.md                      # Accessibility guidelines
```

## Language-Specific Commands

### Node.js Projects
```bash
npm install              # Install dependencies
npm run dev             # Development server
npm test                # Run tests
npm run lint            # Lint code
npm run build           # Build for production
```

### Python Projects  
```bash
pip install -e ".[dev]"  # Install with dev dependencies
python -m src.main      # Run application
pytest                  # Run tests
ruff check src/         # Lint code
black src/              # Format code
```

### Go Projects
```bash
go mod download         # Download dependencies
go run src/main.go      # Run application
go test ./...           # Run tests
golangci-lint run       # Lint code
go build -o bin/app     # Build binary
```

## Development Workflow

### Local Development
```bash
# Start observability stack
docker-compose -f observability/otel-compose.yml up -d

# Access monitoring tools:
# - Prometheus: http://localhost:9090
# - Grafana: http://localhost:3000 (admin/admin)
# - Jaeger: http://localhost:16686
```

### Infrastructure Management
```bash
cd infra/
terraform init          # Initialize Terraform
terraform plan          # Preview changes
terraform apply         # Apply infrastructure changes
```

### Deployment
```bash
# Local Kubernetes deployment
helm install myapp deploy/helm-chart/

# Production deployment via ArgoCD
kubectl apply -f deploy/argocd-app.yaml
```

## Key Conventions

### File Organization
- Source code in `src/` directory
- Tests mirror source structure in `tests/`
- Infrastructure code in `infra/` with cloud-specific modules
- Deployment manifests in `deploy/`
- Documentation in `docs/` following MADR format for ADRs

### CI/CD Pipeline
- Automated testing and linting on all PRs
- Security scanning with OWASP Dependency-Check and Trivy
- Docker images built and pushed to GitHub Container Registry
- Multi-platform builds (linux/amd64, linux/arm64)

### Security & Compliance
- All containers run as non-root users
- Security scanning integrated in CI pipeline
- Accessibility guidelines (WCAG 2.2 AA) in `a11y.md`
- SLO monitoring configured in `observability/slo.yaml`

### Monitoring & Observability
- OpenTelemetry for traces, metrics, and logs
- Prometheus for metrics collection
- Grafana for visualization
- Jaeger for distributed tracing
- SLO definitions with error budget tracking

## Template Maintenance

### When Working on Template Improvements
1. Test changes with `./init.sh` to ensure template generation works
2. Update this CLAUDE.md file if project structure changes
3. Verify all three language configurations (Node.js, Python, Go)
4. Test infrastructure modules for all supported clouds
5. Ensure CI/CD workflows work for each language variant

### Architecture Decisions
- Document significant decisions in `docs/adr/`
- Follow MADR format using the template in `docs/adr/000-template.md`
- Update `docs/design_doc.md` for major architectural changes

## Common Issues and Solutions

### Template Variables Not Replaced
- Ensure `./init.sh` completed successfully
- Check that Cookiecutter syntax `{{ variable }}` is used consistently

### Language-Specific Files Not Cleaned Up
- Verify language selection in init script
- Check that cleanup_files() function in `init.sh` works correctly

### Infrastructure Not Provisioned
- Ensure correct cloud provider selection
- Verify Terraform modules are uncommented in `main.tf`
- Check cloud-specific variables in `terraform.tfvars`