# SPPU B.E. Computer Engineering — Honors in Cyber Security
## Semester VIII Syllabus (2019 Pattern)

---

## Course Structure — Semester VIII

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 410403 | Cloud and Application Security | 3 | — | 3 | 30 | 70 | 100 |
| 410404 | Cloud and Application Security Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 410403: Cloud and Application Security

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Prerequisites:** Information and Cyber Security (310401), IoT and Embedded Security (410401)

### Course Objectives
- Understand cloud security architecture and shared responsibility model
- Learn secure application development and DevSecOps practices
- Master cloud penetration testing and security assessment

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Design secure cloud architectures using IAM, encryption, and network controls |
| CO2 | Implement secure CI/CD pipelines with integrated security testing |
| CO3 | Apply DevSecOps practices for continuous security |
| CO4 | Perform cloud security assessments and penetration testing |
| CO5 | Implement container and Kubernetes security |

### Course Contents

#### Unit I: Cloud Security Architecture (07 Hours)
- Cloud Deployment Models: Public, Private, Hybrid, Multi-cloud
- Shared Responsibility Model: IaaS, PaaS, SaaS
- Cloud IAM: Users, Groups, Roles, Policies, MFA, Federation
- Cloud Network Security: VPC, Security Groups, NACL, WAF
- Cloud Data Security: Encryption (at rest, in transit), KMS, Secrets Management
- Cloud Compliance: SOC 2, ISO 27001, FedRAMP, PCI DSS
- AWS/Azure/GCP Security Best Practices

#### Unit II: Application Security (07 Hours)
- Secure SDLC: Threat Modeling, Security Requirements, Design Review
- OWASP Top 10: Injection, Broken Authentication, XSS, Insecure Deserialization
- Secure Coding Practices: Input Validation, Output Encoding, Parameterized Queries
- Web Application Firewall: ModSecurity, Cloud WAF
- API Security: OAuth 2.0, OpenID Connect, JWT, Rate Limiting
- Mobile App Security: Root Detection, SSL Pinning, Secure Storage
- Container Security: Docker Security Best Practices, Image Scanning

#### Unit III: DevSecOps (07 Hours)
- DevSecOps Principles: Shift Left, Security as Code, Continuous Security
- CI/CD Pipeline Security: SAST, DAST, SCA Integration
- Infrastructure as Code (IaC) Security: Terraform, CloudFormation Scanning
- Configuration Management Security: Ansible, Chef, Puppet
- Container Security Pipeline: Image Scanning, Runtime Protection
- Compliance as Code: Open Policy Agent, Sentinel, Checkov
- Security Monitoring: SIEM Integration with CI/CD

#### Unit IV: Cloud Penetration Testing (07 Hours)
- Cloud Reconnaissance: Enumeration, OSINT, Attack Surface Discovery
- IAM Attacks: Privilege Escalation, Backdoor User Creation
- Storage Security: S3 Bucket Misconfiguration, Data Exposure
- Network Attacks: VPC Peering, DNS Spoofing, Cloud Metadata
- Serverless Security: Function Injection, Event Manipulation
- Cloud API Abuse: Rate Limiting Bypass, API Key Leakage
- Cloud Pentesting Tools: ScoutSuite, Prowler, Pacu, CloudSploit

#### Unit V: Kubernetes Security (07 Hours)
- Kubernetes Architecture: Control Plane, Nodes, Pods, Services
- Pod Security: Pod Security Standards, Security Contexts
- Network Security: Network Policies, CNI Plugins, Service Mesh
- RBAC: Roles, ClusterRoles, RoleBindings, ServiceAccounts
- Secrets Management: Kubernetes Secrets, External Secrets, Vault
- Container Runtime Security: Seccomp, AppArmor, SELinux
- Kubernetes Auditing: Audit Logs, Falco, Sysdig

#### Unit VI: Advanced Security Topics (07 Hours)
- Zero Trust Architecture: Micro-segmentation, Identity-based Access
- Software Supply Chain Security: SBOM, Sigstore, In-toto
- Homomorphic Encryption and Secure Multi-party Computation
- Blockchain for Cybersecurity: Identity Management, Smart Contracts
- AI/ML for Cybersecurity: Anomaly Detection, Threat Intelligence, SOAR
- Quantum-safe Cryptography: Post-Quantum Algorithms
- Cyber Insurance: Coverage, Risk Assessment, Compliance

### Learning Resources

#### Textbooks
1. Mark Birch, "Cloud Security: A Comprehensive Guide to Secure Cloud Computing", Wiley, 2019
2. Gene Kim, "The DevOps Handbook", IT Revolution Press, 2016

#### Reference Books
1. Liz Rice, "Container Security", O'Reilly, 2020
2. Paul Czarny, "Kubernetes Security and Observability", O'Reilly, 2021

---

## 410404: Cloud and Application Security Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Set up AWS IAM with least privilege policies and MFA
2. Configure VPC with public/private subnets, security groups, and NACLs
3. Implement SAST using SonarQube/Snyk in a CI/CD pipeline
4. Perform web application penetration testing using Burp Suite
5. Scan AWS infrastructure for misconfigurations using ScoutSuite/Prowler
6. Implement container security: image scanning, runtime protection
7. Configure Kubernetes RBAC and network policies
8. Build a DevSecOps pipeline with GitHub Actions + SAST/DAST
9. Perform cloud privilege escalation attack simulations
10. Mini-project: Complete cloud security assessment and report

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
