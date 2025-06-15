# Test workflows

This file is created to trigger all GitHub Actions workflows and configure status checks.

After this PR is merged, the following status checks will be available in branch protection:
- CI - Node.js / test
- CI - Python / test  
- CI - Go / test
- Security - Dependency Check / dependency-check
- Security - Dependency Check / container-scan

This file can be deleted after status checks are configured.
