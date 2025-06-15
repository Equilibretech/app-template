# Contributing to Equilibretech App Template

> Guide for maintaining and improving this template

## 🎯 Template Overview

This is not a regular application - it's a **template generator** that creates production-ready projects. Understanding this distinction is crucial for contributors.

### Template vs Generated Project
- **This repository**: Template files with `{{ cookiecutter.* }}` variables
- **Generated projects**: Real applications after running `./init.sh`
- **Our job**: Maintain the template, not individual projects

## 🏗️ Template Architecture

### Core Design Decisions

#### 1. **Multi-Language Support**
```
package.json      → Node.js configuration
pyproject.toml    → Python configuration  
go.mod           → Go configuration
```
**Why**: Single template for all Equilibretech languages  
**How**: `init.sh` removes unused files based on user choice

#### 2. **Multi-Cloud Infrastructure**
```
infra/modules/aws/     → AWS-specific resources
infra/modules/gcp/     → GCP-specific resources
infra/modules/azure/   → Azure-specific resources
```
**Why**: Flexibility across cloud providers  
**How**: Terraform modules activated by `init.sh` based on choice

#### 3. **Separate Dockerfiles**
```
Dockerfile.node    → Node.js optimized
Dockerfile.python  → Python optimized
Dockerfile.go      → Go optimized
```
**Why**: Each language has different optimization needs  
**How**: `init.sh` renames the correct one to `Dockerfile`

#### 4. **Workflow Per Language**
```
.github/workflows/ci-node.yml    → Node.js CI/CD
.github/workflows/ci-python.yml  → Python CI/CD
.github/workflows/ci-go.yml      → Go CI/CD
```
**Why**: Different test commands, build processes  
**How**: `init.sh` keeps only the relevant workflow

## 🧪 Testing Template Changes

### 1. **Full Template Test** (Required before PR)
```bash
# Test Node.js + AWS
rm -rf test-node && git clone . test-node
cd test-node && echo -e "Test Service Node\nnode\naws" | ./init.sh
cd .. && rm -rf test-node

# Test Python + GCP  
rm -rf test-python && git clone . test-python
cd test-python && echo -e "Test Service Python\npython\ngcp" | ./init.sh
cd .. && rm -rf test-python

# Test Go + Local
rm -rf test-go && git clone . test-go
cd test-go && echo -e "Test Service Go\ngo\nlocal" | ./init.sh
cd .. && rm -rf test-go
```

### 2. **Cookiecutter Test** (If available)
```bash
# Test with cookiecutter
cookiecutter . --no-input
cookiecutter . --no-input service_name="Custom Service" lang="python" cloud="azure"
```

### 3. **Verification Checklist**
After template generation, verify:
- [ ] Only correct language files remain
- [ ] Only correct Dockerfile exists  
- [ ] Only correct CI workflow exists
- [ ] Terraform modules activated for chosen cloud
- [ ] All `{{ cookiecutter.* }}` variables replaced
- [ ] Git repo initialized with proper commit
- [ ] Next steps displayed correctly

## 📋 Development Workflow

### Adding New Features

#### 1. **New Language Support** (e.g., Rust)
1. **Add configuration files**: `Cargo.toml`, `rust-toolchain.toml`
2. **Create Dockerfile**: `Dockerfile.rust` with Rust optimizations
3. **Add CI workflow**: `.github/workflows/ci-rust.yml`
4. **Update `init.sh`**: Add rust to language choices and cleanup logic
5. **Update `cookiecutter.json`**: Add "rust" to lang options
6. **Test**: Verify full template generation works

#### 2. **New Cloud Provider** (e.g., Oracle Cloud)
1. **Create Terraform module**: `infra/modules/oracle/`
2. **Update `init.sh`**: Add oracle to cloud choices and activation logic  
3. **Update `cookiecutter.json`**: Add "oracle" to cloud options
4. **Update documentation**: Add Oracle prerequisites to README
5. **Test**: Verify infrastructure configuration works

#### 3. **New Development Tool** (e.g., Different Testing Framework)
1. **Identify impact**: Which languages? All or specific ones?
2. **Update config files**: Modify `package.json`, `pyproject.toml`, etc.
3. **Update workflows**: Modify CI files if test commands change
4. **Update documentation**: Add to README and CLAUDE.md
5. **Test**: Verify workflows still pass

### Modifying Existing Features

#### ⚠️ **Critical Files - Test Thoroughly**
- **`init.sh`**: Core template generation logic
- **`cookiecutter.json`**: Template variables definition
- **Workflows**: Any change affects all generated projects

#### 🔧 **Safe Changes**
- Documentation updates (README, docs/)
- Adding new optional files (examples, additional configs)
- Improving existing Dockerfiles (performance, security)

## 🧩 Key Files Explained

### `init.sh` - Template Generation Engine
```bash
# Core responsibilities:
1. Collect user input (service, language, cloud)
2. Generate slug from service name  
3. Replace all {{ cookiecutter.* }} variables
4. Remove unused language files
5. Activate chosen cloud infrastructure
6. Initialize git repository
7. Display next steps
```

### `cookiecutter.json` - Template Configuration
```json
{
  "service_name": "Default service name",
  "service_slug": "auto-generated-slug", 
  "lang": ["node", "python", "go"],
  "cloud": ["aws", "gcp", "azure", "local"]
}
```

### Workflows - CI/CD Templates
- **Purpose**: Provide working CI/CD from day one
- **Strategy**: Separate workflow per language for maintainability
- **Testing**: Validate template structure, build Docker images
- **Security**: Integrated OWASP and Trivy scanning

## 🚨 Common Pitfalls

### 1. **Forgetting Template Variables**
❌ **Wrong**: Hardcoding values  
✅ **Right**: Using `{{ cookiecutter.service_slug }}`

### 2. **Testing Only One Configuration**
❌ **Wrong**: Testing only Node.js + AWS  
✅ **Right**: Testing all language/cloud combinations

### 3. **Breaking the Init Script**
❌ **Wrong**: Syntax errors in `init.sh`  
✅ **Right**: Test script thoroughly after changes

### 4. **Forgetting Cleanup Logic**
❌ **Wrong**: Adding new files without cleanup  
✅ **Right**: Update `cleanup_files()` function

## 📝 Pull Request Checklist

### Before Submitting
- [ ] Tested template generation with multiple configurations
- [ ] All workflows validate successfully  
- [ ] Documentation updated (README, CLAUDE.md)
- [ ] No hardcoded values (use template variables)
- [ ] `init.sh` script runs without errors
- [ ] Generated projects have clean structure

### PR Description Must Include
1. **What**: Brief description of changes
2. **Why**: Motivation/problem solved
3. **Testing**: Which configurations tested
4. **Impact**: Which files/features affected
5. **Breaking**: Any breaking changes for existing users

### Review Process
1. **Automated**: GitHub Actions validate workflows
2. **Manual**: Reviewer tests template generation
3. **Approval**: Two approvals required for template changes
4. **Merge**: Squash merge to keep clean history

## 🎯 Template Quality Standards

### Code Quality
- **Consistent**: Same patterns across all languages
- **Secure**: Non-root containers, secret scanning
- **Performant**: Optimized Dockerfiles, efficient workflows
- **Maintainable**: Clear structure, good documentation

### Documentation
- **Complete**: Every feature documented
- **Accurate**: Instructions actually work
- **Updated**: Changes include doc updates
- **Examples**: Real working examples provided

### User Experience  
- **Simple**: `./init.sh` just works
- **Fast**: Template generation under 30 seconds
- **Clear**: Obvious next steps after generation
- **Helpful**: Good error messages when things fail

## 🚀 Release Process

### Versioning Strategy
- **Template versions**: Git tags (v1.0.0, v1.1.0)
- **Generated projects**: Independent versioning
- **Breaking changes**: Major version bump

### Release Checklist
1. **Test**: Full regression test with all combinations
2. **Update**: Version in relevant files
3. **Tag**: Create Git tag with release notes
4. **Announce**: Update internal docs/communication

---

## 🆘 Getting Help

### For Template Issues
- **GitHub Issues**: Report bugs or request features
- **Discussions**: Ask questions about template architecture
- **Internal Slack**: Quick questions for team members

### For Generated Project Issues  
- **Not our responsibility**: Once generated, projects are independent
- **Exception**: If issue caused by template bug
- **Solution**: Fix template, users regenerate their projects

---

**Remember**: We maintain the template, not individual projects. Focus on making the template generation robust and the generated structure excellent. 🎯