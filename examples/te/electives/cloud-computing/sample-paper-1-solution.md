---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-63**

**T.E. (Computer Engineering)**

**CLOUD COMPUTING**

**(2019 Pattern) (Semester - II) (310254(C))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Virtualization

**Q1)** **a)** Explain the concept of virtualization in cloud computing. Describe the types of
virtualization with examples. [9]

**Virtualization** is the creation of a virtual (rather than actual) version of a resource, such as
a server, OS, storage, or network. It abstracts physical hardware into multiple virtual instances.

**Types of Virtualization:**

| Type         | Description                                        | Example                               |
| ------------ | -------------------------------------------------- | ------------------------------------- |
| **Hardware** | Virtualizes physical server into multiple VMs      | VMware ESXi, KVM                      |
| **Software** | Application runs in isolated environment           | Java JVM, Docker                      |
| **Memory**   | Shares physical RAM across VMs                     | VMware memory overcommit              |
| **Storage**  | Abstracts physical storage into pools              | SAN, NAS, vSAN                        |
| **Network**  | Creates virtual networks over physical switches    | VLAN, SDN, VXLAN                      |
| **Data**     | Abstracts data access across heterogeneous sources | Data federation, virtualization layer |

**b)** Compare Type 1 and Type 2 hypervisors. Explain CPU virtualization techniques. [9]

| Feature         | Type 1 (Bare-metal)             | Type 2 (Hosted)                |
| --------------- | ------------------------------- | ------------------------------ |
| **Runs on**     | Directly on hardware            | On host OS                     |
| **Performance** | Native (near metal)             | Overhead from host OS          |
| **Examples**    | VMware ESXi, Hyper-V, KVM, Xen  | VirtualBox, VMware Workstation |
| **Use Case**    | Data centers, enterprise        | Development, testing, desktop  |
| **Security**    | Higher (smaller attack surface) | Lower (depends on host OS)     |

**CPU Virtualization Techniques:**

- **Full Virtualization** — Guest OS runs unmodified. Hypervisor emulates hardware. Uses binary
  translation. (e.g., VMware)
- **Paravirtualization** — Guest OS is modified to issue hypercalls directly. Better performance.
  (e.g., Xen)
- **Hardware-Assisted** — CPU extensions (Intel VT-x, AMD-V) handle privileged operations. No
  emulation needed. Best performance.

---

**OR**

**Q2)** **a)** Cloud vs Grid Computing comparison. [9]

| Feature             | Cloud Computing            | Grid Computing                 |
| ------------------- | -------------------------- | ------------------------------ |
| **Goal**            | On-demand service delivery | Collaborative resource sharing |
| **Resource Mgmt**   | Centralized (provider)     | Distributed (federation)       |
| **Scalability**     | Elastic (auto-scale)       | Limited (fixed nodes)          |
| **Pricing**         | Pay-per-use                | Often free/shared              |
| **Standardization** | High (AWS, Azure APIs)     | Lower (Globus, middleware)     |
| **Workload**        | General purpose, web apps  | Scientific, batch processing   |

**Virtualization Architecture:**

```
┌─────────────────────────────────┐
│        Applications              │
├─────────────────────────────────┤
│        Guest OS (VM1)           │
├─────────────────────────────────┤
│      Hypervisor (VMM)           │
├─────────────────────────────────┤
│      Physical Hardware           │
│  (CPU, RAM, Storage, NIC)       │
└─────────────────────────────────┘
```

**b)** Network and Storage Virtualization. [9]

**Network Virtualization:** Combines hardware/software network resources into a single virtual
network. SDN separates control plane from data plane (OpenFlow). Benefits: centralized management,
traffic isolation, dynamic reconfiguration.

**Storage Virtualization:** Abstracts physical storage into pools. SDS separates storage software
from hardware. Benefits: simplified management, tiering, replication.

---

### Unit IV — Cloud Platforms and Applications

**Q3)** **a)** AWS architecture and core services. [9]

**AWS Global Infrastructure:** Regions → Availability Zones → Edge Locations

**Core Services:** | Service | Category | Description | Use Case | |---|---|---|---| | **EC2** |
Compute | Virtual servers (instances) | Web hosting, batch processing | | **S3** | Storage | Object
storage (buckets) | Backups, static assets, data lakes | | **Lambda** | Serverless | Event-driven
functions | Image processing, API backends |

**b)** AWS vs Azure vs GCP comparison. [8]

| Feature      | AWS              | Azure                      | GCP                             |
| ------------ | ---------------- | -------------------------- | ------------------------------- |
| **Compute**  | EC2, Lambda      | VMs, Functions             | Compute Engine, Cloud Functions |
| **Storage**  | S3, EBS, Glacier | Blob, Disk, File           | Cloud Storage, Persistent Disk  |
| **Database** | RDS, DynamoDB    | SQL DB, Cosmos DB          | Cloud SQL, Firestore            |
| **Pricing**  | Hourly, Reserved | Per-minute, Hybrid benefit | Per-second, Sustained use       |
| **Coverage** | 25+ regions      | 60+ regions                | 35+ regions                     |

---

**OR**

**Q4)** **a)** Microsoft Azure architecture. [9]

**Azure Architecture:** Azure Resource Manager (ARM) manages resources. **Azure VMs** — IaaS virtual
machines. **Azure App Services** — PaaS for web/mobile apps. **Azure Functions** — serverless
compute. **Azure AD** — identity and access management (SSO, MFA, Conditional Access).

**b)** Industry cloud applications. [8]

- **Healthcare:** AWS HealthLake (FHIR), Azure Health Bot, HIPAA-compliant storage
- **Business:** Salesforce (CRM SaaS), Office 365, SAP on Cloud
- **Education:** Google Classroom, Coursera (AWS), virtual labs (Azure Lab Services)

---

### Unit V — Cloud Security

**Q5)** **a)** Risk management in cloud. [9]

**Risk Management Process:**

1. **Risk identification** — Asset inventory, threat modeling
2. **Risk assessment** — Likelihood × Impact
3. **Risk treatment** — Avoid, Mitigate, Transfer, Accept
4. **Risk monitoring** — Continuous assessment

**Data Security:**

- **Encryption at rest** — AES-256 (S3 SSE, EBS encryption)
- **Encryption in transit** — TLS 1.2/1.3
- **Key management** — KMS (AWS), Key Vault (Azure), Cloud KMS (GCP)

**b)** Identity and Access Management (IAM). [9]

**IAM Components:**

- **User** — Individual entity (person/service account)
- **Group** — Collection of users (Admin, Developer)
- **Role** — Set of permissions assumed by trusted entities
- **Policy** — JSON document defining permissions
- **Permission** — Allow/Deny for specific actions on resources

**AWS IAM Example:**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
```

---

**OR**

**Q6)** **a)** Cloud security challenges and CSA guidance. [9]

**Challenges:** Data breaches, misconfiguration, lack of visibility, compliance complexity, shared
technology vulnerabilities, insider threats.

**Shared Responsibility Model:**

- **Provider responsible FOR security OF the cloud** (physical, network, hypervisor)
- **Customer responsible FOR security IN the cloud** (data, apps, IAM, OS, network config)

**CSA Guidance:** Cloud Controls Matrix (CCM), CAIQ, STAR registry.

**b)** Compliance standards. [9]

| Standard      | Scope                        | Key Requirements                                  |
| ------------- | ---------------------------- | ------------------------------------------------- |
| **GDPR**      | Personal data of EU citizens | Consent, right to erasure, breach notification    |
| **HIPAA**     | US healthcare data           | PHI encryption, BAA, access controls              |
| **SOC 2**     | Service organizations        | Security, availability, confidentiality           |
| **ISO 27001** | ISMS                         | Risk assessment, controls, continuous improvement |

---

### Unit VI — Advanced Cloud Techniques

**Q7)** **a)** Docker container architecture. [9]

**Docker Architecture:**

```
┌─────────────────────┐
│   Docker Client     │
│  (CLI / API)        │
└─────────┬───────────┘
          │ REST API
┌─────────▼───────────┐
│   Docker Daemon      │
│  (dockerd)           │
└─────────┬───────────┘
          │
┌─────────▼───────────┐
│   Docker Registry    │
│  (Docker Hub)        │
└─────────────────────┘
```

**Components:**

- **Image** — Lightweight, standalone, executable package (read-only template)
- **Container** — Runnable instance of an image
- **Dockerfile** — Script with instructions to build an image
- **Docker Compose** — Define multi-container apps (YAML)

**Container vs VM:** | Feature | Container | VM | |---|---|---| | **OS** | Shares host kernel | Full
OS per VM | | **Startup** | Seconds | Minutes | | **Size** | MB | GB | | **Isolation** |
Process-level | Hardware-level |

**b)** Kubernetes architecture. [8]

```
┌────────── Master Node ─────────┐
│ API Server → Scheduler →  │
│ Controller Manager → etcd       │
└────────────────────────────────┘
         │
┌────────▼───────┐  ┌────────▼───────┐
│ Worker Node 1   │  │ Worker Node 2   │
│ ┌─ Pods ───────┐│  │ ┌─ Pods ───────┐│
│ │ Container    ││  │ │ Container    ││
│ └──────────────┘│  │ └──────────────┘│
│ Kubelet, Kube-proxy│  │ Kubelet, Kube-proxy│
└────────────────┘  └────────────────┘
```

**Concepts:** Pod (smallest unit), Service (stable endpoint), Deployment (desired state), Ingress
(external access), ConfigMap/Secret (configuration).

---

**OR**

**Q8)** **a)** IoT and Cloud convergence. Edge vs Fog vs Cloud comparison. [9]

| Feature        | Cloud               | Fog                 | Edge                |
| -------------- | ------------------- | ------------------- | ------------------- |
| **Latency**    | High (100ms+)       | Medium (10-100ms)   | Low (<10ms)         |
| **Processing** | Massive (unlimited) | Moderate            | Limited             |
| **Bandwidth**  | High (internet)     | Moderate/Local      | Low (device)        |
| **Location**   | Remote data center  | Network edge        | Device itself       |
| **Example**    | AWS IoT Analytics   | Fog node in factory | Raspberry Pi sensor |

**b) Short notes:** [8]

**i) DevOps in Cloud:** CI/CD pipelines (Jenkins, GitHub Actions), Infrastructure as Code
(Terraform, CloudFormation), monitoring (CloudWatch, Grafana). Cloud enables automated, repeatable
deployments.

**ii) Mobile Cloud Computing:** Offload processing from mobile to cloud. Examples: iCloud backup,
Google Photos, mobile backend services (Firebase, AWS Amplify).

---

---

## Examiner Commentary

This paper covers the full cloud computing syllabus: virtualization techniques, cloud platforms
(AWS/Azure/GCP), security (IAM, shared responsibility, compliance), and advanced topics (containers,
Kubernetes, edge computing). The comparative tables (hypervisors, cloud platforms, container vs VM)
test analytical skills, while IAM policy examples and Docker architecture questions test practical
knowledge.
