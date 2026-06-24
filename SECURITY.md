# Security Policy

## Supported Versions

| Version        | Supported |
| -------------- | --------- |
| main (latest)  | ✅        |
| Other branches | ❌        |

## Reporting a Vulnerability

This repo contains **educational content** (exam papers, study skills, scripts). Security issues are
unlikely but possible in:

- Scripts (`scripts/*.sh`, `scripts/*.js`, `scripts/*.py`)
- CI/CD workflows (`.github/workflows/*.yml`)
- Dependencies (`package.json`, `requirements.txt`)

### To Report

1. **Open a draft security advisory** at
   [github.com/pinakdhabu/Exam-prompt/security/advisories](https://github.com/pinakdhabu/Exam-prompt/security/advisories)
2. **Or email**: pinakdhabu2005@gmail.com (mention "Exam Prompt security" in subject)

### Response

- You'll get an acknowledgment within 48 hours
- Critical issues will be addressed within 7 days
- Non-critical issues will be fixed in the next release cycle

## Scope

- ✅ `.sh` scripts (shell injection, path traversal)
- ✅ `.js` scripts (dependency vulnerabilities)
- ✅ `.py` scripts (arbitrary code execution)
- ✅ CI/CD workflows (secret leakage)
- ❌ Sample paper content (solutions may contain errors but aren't security issues)
- ❌ SKILL.md content (prompt injection is inherent to LLM systems)

Thank you for helping keep this project safe! 🙏
