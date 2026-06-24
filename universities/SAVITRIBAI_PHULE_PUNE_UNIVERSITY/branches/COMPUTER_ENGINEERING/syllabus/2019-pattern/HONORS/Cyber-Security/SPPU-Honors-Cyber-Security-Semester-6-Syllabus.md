# SPPU B.E. Computer Engineering — Honors in Cyber Security
## Semester VI Syllabus (2019 Pattern)

---

## Course Structure — Semester VI

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 310403 | Network Forensics and Incident Response | 3 | — | 3 | 30 | 70 | 100 |
| 310404 | Network Forensics Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 310403: Network Forensics and Incident Response

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Prerequisites:** Information and Cyber Security (310401)

### Course Objectives
- Understand digital forensics principles and investigation methodology
- Learn network forensics, memory analysis, and malware analysis
- Master incident response handling and reporting

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Apply digital forensics methodology for evidence collection and analysis |
| CO2 | Perform network forensics to investigate network-based attacks |
| CO3 | Conduct memory and disk forensics analysis |
| CO4 | Implement incident response procedures |
| CO5 | Analyze malware and produce forensic reports |

### Course Contents

#### Unit I: Digital Forensics Fundamentals (07 Hours)
- Digital Forensics: Definition, Scope, Types (Computer, Network, Mobile, Cloud)
- Forensic Readiness: Planning, Policies, Procedures
- Evidence: Types (Volatile, Non-volatile), Chain of Custody
- Forensic Acquisition: Imaging (dd, FTK Imager), Hashing (MD5, SHA-1)
- Forensic Analysis: Timeline Analysis, File Carving, Keyword Search
- Legal and Ethical Issues: IT Act, Evidence Act, Privacy
- Forensic Tools: Autopsy, Sleuth Kit, FTK, EnCase

#### Unit II: Network Forensics (07 Hours)
- Network Evidence Sources: Firewall Logs, IDS/IPS Alerts, Proxy Logs
- Packet Capture and Analysis: Wireshark, tcpdump, TShark
- Network Flow Analysis: NetFlow, sFlow, IPFIX
- Log Analysis: Syslog, Windows Event Log, Apache/IIS Logs
- DNS Forensics: Query Analysis, Tunneling Detection
- Email Forensics: Headers Analysis, SMTP Logs, Phishing Investigation
- Network Attribution: IP Tracking, WHOIS, Geolocation

#### Unit III: Memory Forensics (07 Hours)
- Memory Acquisition: RAM Capture Tools (FTK Imager, LiME, WinPmem)
- Memory Analysis Framework: Volatility (imageinfo, pslist, netscan, cmdscan)
- Process Analysis: Hidden Processes, DLL Injection, Rootkits
- Network Connections: Listening Ports, Active Connections
- Registry Analysis: UserAssist, MRU, USB Storage
- Malware Artifacts in Memory: Code Injection, API Hooking
- Memory Dump Analysis Case Studies

#### Unit IV: Disk Forensics and File System Analysis (07 Hours)
- File Systems: NTFS, FAT32, EXT4, HFS+ — Structures and Artifacts
- File Carving: Foremost, Scalpel, PhotoRec
- Deleted File Recovery: MFT Entry Analysis, Inode Recovery
- Windows Artifacts: Prefetch, Jump Lists, LNK Files, $MFT
- Browser Forensics: History, Cache, Cookies, Downloads
- Registry Forensics: SAM, SYSTEM, SOFTWARE, NTUSER.DAT, USRCLASS.DAT
- Steganalysis: Detecting Hidden Data in Images, Audio, Video

#### Unit V: Incident Response (07 Hours)
- Incident Response Lifecycle: Preparation, Detection, Containment, Eradication, Recovery
- Incident Classification: Severity Levels, Escalation Procedures
- First Responder Procedures: Evidence Preservation, Documentation
- Containment Strategies: Isolation, Network Segmentation, Blocking
- Eradication and Recovery: Malware Removal, System Restoration
- Post-Incident Activities: Lessons Learned, Report Writing
- Incident Response Teams: CSIRT, SOC Structure and Operations

#### Unit VI: Malware Analysis (07 Hours)
- Malware Types: Viruses, Worms, Trojans, Ransomware, Botnets, Rootkits
- Static Analysis: PE File Structure, Strings, Import/Export Tables
- Dynamic Analysis: Sandbox Execution (Cuckoo, Joe Sandbox), API Monitoring
- Code Analysis: Disassembly (IDA Pro, Ghidra), Debugging (x64dbg, OllyDbg)
- Anti-Analysis Techniques: Packing, Obfuscation, Anti-Debug, Anti-VM
- Malware Persistence: Registry Run Keys, Scheduled Tasks, Services
- Threat Intelligence: IoCs, TTPs, MITRE ATT&CK Framework

### Learning Resources

#### Textbooks
1. Bill Nelson, Amelia Phillips, Christopher Steuart, "Guide to Computer Forensics and Investigations", 6th Edition, Cengage, 2018
2. Luttgens, Pepe, Mandia, "Incident Response and Computer Forensics", 3rd Edition, McGraw-Hill, 2014

#### Reference Books
1. Michael Hale Ligh, "The Art of Memory Forensics", Wiley, 2014
2. Michael Sikorski, Andrew Honig, "Practical Malware Analysis", No Starch Press, 2012

---

## 310404: Network Forensics Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Create a forensic disk image using dd/FTK Imager and verify with hashing
2. Analyze network packet captures in Wireshark for attack patterns
3. Perform memory acquisition and analysis using Volatility
4. Recover deleted files using file carving tools (Foremost, ScalephotoRec)
5. Analyze Windows registry artifacts for forensic evidence
6. Investigate a web attack using web server logs and network captures
7. Perform static and dynamic malware analysis in a sandbox
8. Conduct a full incident response drill (simulated breach)
9. Analyze email headers to trace phishing attacks
10. Mini-project: Complete forensic investigation and report

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
