# Equilibretech App Template

> Production-ready template for creating new application projects with best practices built-in

## 🎯 What is this?

This is a comprehensive application template that provides:
- **Multi-language support**: Node.js, Python, Go
- **Multi-cloud infrastructure**: AWS, GCP, Azure, Local development
- **Complete CI/CD pipeline**: GitHub Actions with security scanning
- **Kubernetes deployment**: Helm charts + ArgoCD
- **Observability stack**: OpenTelemetry, Prometheus, Grafana, Jaeger
- **Security by default**: OWASP scanning, container security, accessibility guidelines

## 🚀 How to Use This Template

### Method 1: GitHub Template (Recommended)
1. Click **"Use this template"** button above
2. Create your new repository as `Equilibretech/projects-<your-service-name>`
3. Clone your new repository
4. Run the initialization script:
   ```bash
   ./init.sh
   ```

### Method 2: Cookiecutter
```bash
# If you have cookiecutter installed
pip install cookiecutter
cookiecutter gh:Equilibretech/app-template
```

### Method 3: Manual Clone
```bash
git clone https://github.com/Equilibretech/app-template.git your-project-name
cd your-project-name
./init.sh
```

## ⚙️ Initialization Process

The `init.sh` script will:
1. **Ask 3 questions**:
   - Service name (e.g., "My Awesome Service")
   - Programming language (node/python/go)
   - Cloud provider (aws/gcp/azure/local)

2. **Auto-configure your project**:
   - Replace template variables throughout all files
   - Remove unused language-specific files
   - Configure infrastructure for your chosen cloud
   - Set up git repository with initial commit

3. **Clean up**:
   - Remove initialization files
   - Display next steps

## 📁 What You Get

After initialization, your project will have:
```
your-project/
├── src/                    # Your application code
├── tests/                  # Test files
├── Dockerfile             # Optimized for your language
├── .github/workflows/     # CI/CD pipelines
├── deploy/                # Kubernetes + Helm configuration
├── infra/                 # Terraform infrastructure
├── observability/         # Monitoring stack
├── docs/                  # Project documentation
└── README.md             # Your project's README
```

## 📋 Prerequisites

- **Docker & Docker Compose** (for local development and observability stack)
- **Git** (for version control)
- **Your chosen language runtime**:
  - Node.js 18+ (if using Node.js)
  - Python 3.10+ (if using Python)
  - Go 1.20+ (if using Go)

### For Infrastructure (Optional):
- **Terraform 1.0+** (for cloud provisioning)
- **kubectl** (for Kubernetes management)
- **Helm 3+** (for application deployment)
- **Cloud CLI** (aws-cli, gcloud, or az-cli depending on your choice)

## 🏗️ Template Architecture

This template follows **industry best practices**:

### 🔧 **Development**
- **Multi-language support** with optimized configurations
- **Hot reload** and development tools for each language
- **Linting and formatting** rules pre-configured
- **Testing frameworks** set up with coverage reporting

### 🚀 **CI/CD Pipeline**
- **GitHub Actions** workflows for each language
- **Multi-platform Docker builds** (linux/amd64, linux/arm64)
- **Security scanning** with OWASP Dependency-Check and Trivy
- **Automated testing** and code quality checks

### ☁️ **Infrastructure**
- **Terraform modules** for AWS, GCP, and Azure
- **Kubernetes manifests** with Helm charts
- **ArgoCD configuration** for GitOps deployment
- **Auto-scaling** and **load balancing** configured

### 📊 **Observability**
- **OpenTelemetry** for traces, metrics, and logs
- **Prometheus** for metrics collection
- **Grafana** for visualization and dashboards
- **Jaeger** for distributed tracing
- **SLO monitoring** with error budget tracking

## 🔧 Development Workflow

### 1. **After Template Initialization**
```bash
# Your project is ready! Start developing:

# Node.js projects:
npm install && npm run dev

# Python projects:
pip install -e ".[dev]" && python -m src.main

# Go projects:
go mod tidy && go run src/main.go
```

### 2. **Local Observability Stack**
```bash
# Start monitoring tools
docker-compose -f observability/otel-compose.yml up -d

# Access dashboards:
# - Prometheus: http://localhost:9090
# - Grafana: http://localhost:3000 (admin/admin)
# - Jaeger: http://localhost:16686
```

### 3. **Testing & Quality**
```bash
# Run tests (language-specific)
npm test              # Node.js
pytest                # Python  
go test ./...         # Go

# Check code quality
npm run lint          # Node.js
ruff check src/       # Python
golangci-lint run     # Go
```

## 🚀 Deployment

### Infrastructure Setup
```bash
cd infra/
terraform init
terraform plan
terraform apply
```
*See [infra/README.md](infra/README.md) for detailed infrastructure documentation.*

### Application Deployment
```bash
# Local Kubernetes
helm install myapp deploy/helm-chart/

# Production via ArgoCD
kubectl apply -f deploy/argocd-app.yaml
```

## 📊 Monitoring & Observability

Built-in observability stack with industry-standard tools:
- **📈 Metrics**: Prometheus scraping and alerting
- **🔍 Traces**: Jaeger for distributed tracing  
- **📝 Logs**: Centralized logging with structured formats
- **📋 SLOs**: Service Level Objectives with error budget tracking
- **🚨 Alerting**: Configurable alerts for key metrics

## 🔒 Security Features

Security is built-in from day one:
- **🛡️ Automated scanning**: OWASP Dependency-Check and Trivy in CI/CD
- **🔐 Container security**: Non-root containers, read-only filesystems
- **📊 Secret scanning**: GitHub secret detection enabled
- **♿ Accessibility**: WCAG 2.2 AA compliance guidelines
- **🔍 Code analysis**: CodeQL security analysis

## 📚 Documentation

- **[Infrastructure Guide](infra/README.md)** - Terraform setup and cloud configuration
- **[Design Document](docs/design_doc.md)** - Technical architecture and decisions  
- **[Architecture Decision Records](docs/adr/)** - Historical decision tracking
- **[Accessibility Guidelines](a11y.md)** - WCAG compliance and testing

## 🛠️ Template Maintenance

### For Template Contributors
See **[CONTRIBUTING.md](CONTRIBUTING.md)** for detailed information on:
- Template architecture and design decisions
- How to test template changes
- Development workflow and best practices

### Quick Template Test
```bash
# Test template generation
./init.sh

# Test with different configurations:
# - Languages: node/python/go  
# - Clouds: aws/gcp/azure/local
```

## 🤝 Using This Template

**For end users**: Follow the [How to Use This Template](#-how-to-use-this-template) section above.

**For template developers**: See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## 📄 License

This template is provided under the MIT License. 

Generated projects inherit this license by default, but you can change it in your specific project.

---

🎯 **Ready to build something awesome?** Click "Use this template" to get started!
