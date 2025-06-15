# {{ cookiecutter.service_name }}

> TODO: Décrire l'application, son objectif principal, et sa valeur métier

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/Equilibretech/projects-{{ cookiecutter.service_slug }}.git
cd projects-{{ cookiecutter.service_slug }}

# Install dependencies (based on chosen language)
# Node.js:
npm install

# Python:
pip install -e ".[dev]"

# Go:
go mod download

# Run the application
npm start  # or python -m src.main # or go run src/main.go
```

## 📋 Prerequisites

- TODO: Lister les prérequis techniques (versions Node/Python/Go, bases de données, services externes)
- Docker & Docker Compose
- Kubernetes cluster (for deployment)
- Terraform (for infrastructure)

## 🏗️ Architecture

TODO: Décrire l'architecture technique et les choix de design

## 🔧 Development

### Running locally
```bash
# Development mode with hot reload
npm run dev  # or python -m src.main --reload # or go run -race src/main.go
```

### Testing
```bash
# Run tests
npm test        # Node.js
pytest          # Python
go test ./...   # Go

# With coverage
npm run test:coverage
pytest --cov=src
go test -cover ./...
```

### Linting
```bash
# Check code style
npm run lint        # Node.js
ruff check src/     # Python
golangci-lint run   # Go
```

## 🚀 Deployment

### Local Development Stack
```bash
# Start observability stack
docker-compose -f observability/otel-compose.yml up -d

# Deploy to local Kubernetes
helm install {{ cookiecutter.service_slug }} deploy/helm-chart/
```

### Production Deployment
1. Infrastructure provisioning: `cd infra && terraform apply`
2. Application deployment via ArgoCD: `kubectl apply -f deploy/argocd-app.yaml`

## 📊 Monitoring & Observability

- **Metrics**: Prometheus at http://localhost:9090
- **Traces**: Jaeger at http://localhost:16686  
- **Logs**: Grafana at http://localhost:3000
- **SLOs**: See `observability/slo.yaml`

## 🔒 Security

- Security scanning automated via GitHub Actions
- Dependency vulnerability checks with OWASP Dependency-Check
- Container scanning with Trivy

## 📚 Documentation

- [Design Document](docs/design_doc.md)
- [Architecture Decision Records](docs/adr/)
- [Accessibility Guidelines](a11y.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes and add tests
4. Run linting and tests: `npm run lint && npm test`
5. Commit your changes: `git commit -m 'Add some feature'`
6. Push to the branch: `git push origin feature/your-feature`
7. Submit a pull request

## 📄 License

TODO: Spécifier la licence du projet

