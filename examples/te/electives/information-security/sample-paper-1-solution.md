---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-61**

**T.E. (Computer Engineering)**

**INFORMATION SECURITY**

**(2019 Pattern) (Semester - II) (310254(A))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Asymmetric Key Cryptography

**Q1)** **a)** Explain the RSA algorithm in detail. Given p = 11, q = 13, choose an appropriate
public key e and compute the private key d. Encrypt the plaintext M = 25. [9]

**RSA Algorithm:**

1. **Key Generation:**
   - Choose two large primes p, q
   - Compute n = p × q
   - Compute φ(n) = (p-1)(q-1)
   - Choose e such that 1 < e < φ(n) and gcd(e, φ(n)) = 1
   - Compute d ≡ e⁻¹ mod φ(n) (d is multiplicative inverse of e)
   - Public key: (e, n), Private key: (d, n)

2. **Encryption:** C = Mᵉ mod n
3. **Decryption:** M = Cᵈ mod n

**Numerical:**

```
Given: p = 11, q = 13
n = 11 × 13 = 143
φ(n) = 10 × 12 = 120
Choose e = 7 (gcd(7, 120) = 1)
d = 7⁻¹ mod 120 = 103 (since 7 × 103 = 721 ≡ 1 mod 120)
Public key: (7, 143), Private key: (103, 143)

Encrypt M = 25:
C = 25⁷ mod 143 = 25² = 625 mod 143 = 53
  25⁴ = 53² = 2809 mod 143 = 95
  25⁷ = 25⁴ × 25² × 25 = 95 × 53 × 25 = 125875 mod 143 = 20

Ciphertext: 20
```

**b)** Explain Diffie-Hellman key exchange algorithm. Given prime q = 23, primitive root α = 5, XA =
6, XB = 15, compute the shared secret key. [9]

**Diffie-Hellman Key Exchange:**

1. Global public elements: prime q, primitive root α
2. Alice selects private XA, computes public YA = α^XA mod q
3. Bob selects private XB, computes public YB = α^XB mod q
4. Alice computes shared key K = YB^XA mod q
5. Bob computes shared key K = YA^XB mod q

**Numerical:**

```
q = 23, α = 5, XA = 6, XB = 15

Alice computes:
YA = 5⁶ mod 23 = 15625 mod 23 = 8

Bob computes:
YB = 5¹⁵ mod 23 = 19

Shared key:
Alice: K = 19⁶ mod 23 = 47045881 mod 23 = 2
Bob:   K = 8¹⁵ mod 23 = 35184372088832 mod 23 = 2

Shared secret: K = 2
```

**MitM Prevention:** DH alone is vulnerable to MitM. Using digital signatures or certificates
authenticates the public keys, preventing an attacker from substituting their own keys.

---

**OR**

**Q2)** **a)** Explain Elliptic Curve Cryptography (ECC). Compare ECC with RSA on the basis of key
size, security level, performance, and applications. [9]

**ECC** uses the algebraic structure of elliptic curves over finite fields for public-key
cryptography. The security relies on the Elliptic Curve Discrete Logarithm Problem (ECDLP).

**ECC vs RSA Comparison:**

| Parameter                       | ECC                      | RSA                               |
| ------------------------------- | ------------------------ | --------------------------------- |
| **Key Size (256-bit security)** | 512 bits                 | 15360 bits                        |
| **Key Size (128-bit security)** | 256 bits                 | 3072 bits                         |
| **Key Generation**              | Faster                   | Slower                            |
| **Encryption Speed**            | Slower                   | Faster                            |
| **Decryption Speed**            | Faster                   | Slower                            |
| **Signature Size**              | Smaller                  | Larger                            |
| **Computational Overhead**      | Lower                    | Higher                            |
| **Bandwidth**                   | Lower                    | Higher                            |
| **Applications**                | Mobile, IoT, Smart cards | Web servers, Digital certificates |

**ECC Advantages:** Smaller keys, lower power consumption, ideal for constrained devices

**b)** State and prove Fermat's theorem and Euler's theorem. Compute Euler's totient function φ(n)
for n = 120. [9]

**Fermat's Theorem:** If p is prime and a is not divisible by p, then aᵖ⁻¹ ≡ 1 (mod p)

**Proof:** Consider {1, 2, 3, ..., p-1} modulo p. Multiply each by a: {a, 2a, 3a, ..., (p-1)a} mod
p. This is a permutation of {1, 2, ..., p-1}. Products are equal: 1×2×...×(p-1) ≡ a×2a×...×(p-1)a
mod p. (p-1)! ≡ aᵖ⁻¹(p-1)! mod p. Since (p-1)! is invertible mod p, aᵖ⁻¹ ≡ 1 mod p.

**Euler's Theorem:** If gcd(a, n) = 1, then a^φ(n) ≡ 1 (mod n)

**Proof:** Let φ(n) = k. Let the reduced residue set be {x₁, x₂, ..., xₖ}. Multiply each by a: {ax₁,
ax₂, ..., axₖ} is also a reduced residue set. Products are equal mod n. Cancel each xᵢ (since
gcd(xᵢ, n) = 1): aᵏ ≡ 1 mod n.

**φ(120):** 120 = 2³ × 3 × 5 φ(120) = 120(1-1/2)(1-1/3)(1-1/5) = 120 × 1/2 × 2/3 × 4/5 = 32

---

### Unit IV — Data Integrity Algorithms and Web Security

**Q3)** **a)** Explain the SHA-512 hash function in detail. Describe the message digest computation
process with a block diagram. Compare SHA-512 with MD5. [9]

**SHA-512 (Secure Hash Algorithm 512):**

- Produces 512-bit (64-byte) message digest
- Processes message in 1024-bit blocks
- 80 rounds of compression

**Process:**

1. **Padding:** Pad message to multiple of 1024 bits (append 1, then zeros, then 128-bit length)
2. **Initialize buffer:** Eight 64-bit registers (A-H) with initial hash values
3. **Process each 1024-bit block:**
   - Expand block into 80 64-bit words (W₀ to W₇₉)
   - 80 rounds of compression using logical functions (Ch, Maj, Σ₀, Σ₁)
   - Update registers A-H
4. **Output:** Concatenate A-H registers → 512-bit hash

**SHA-512 vs MD5:**

| Feature         | SHA-512                      | MD5                       |
| --------------- | ---------------------------- | ------------------------- |
| **Digest Size** | 512 bits                     | 128 bits                  |
| **Block Size**  | 1024 bits                    | 512 bits                  |
| **Rounds**      | 80                           | 64                        |
| **Security**    | Secure (collision resistant) | Broken (collisions found) |
| **Speed**       | Slower                       | Faster                    |
| **Usage**       | Modern secure systems        | Legacy, checksums         |

**b)** What are digital signatures? Explain the RSA-based digital signature scheme. Discuss how
digital signatures provide authentication, integrity, and non-repudiation. [8]

**Digital Signatures** are cryptographic mechanisms that provide authentication, integrity, and
non-repudiation for electronic documents.

**RSA Digital Signature Scheme:**

1. **Signing (Sender):**
   - Hash message M → h(M)
   - Encrypt hash with private key: S = h(M)ᵈ mod n
   - Send (M, S) to receiver
2. **Verification (Receiver):**
   - Decrypt signature with sender's public key: h' = Sᵉ mod n
   - Hash received message: h(M)
   - Compare: h' == h(M) → signature is valid

**Security Properties:**

- **Authentication:** Only the sender's public key can verify the signature
- **Integrity:** If message changes, hash verification fails
- **Non-repudiation:** Sender cannot deny signing (only they have their private key)

---

**OR**

**Q4)** **a)** Explain Public Key Infrastructure (PKI) architecture. Describe the roles of
Certificate Authority (CA), Registration Authority (RA), and Certificate Revocation List (CRL). [9]

**PKI Architecture:**

```
[CA] ← [RA] ← [End User (Certificate Request)]
  ↓
[Certificate Issuance]
  ↓
[Repository/Directory] ← [CRL]
```

**Components:**

- **Certificate Authority (CA):** Issues, revokes, and manages digital certificates. Root CA signs
  its own certificate; intermediate CAs are signed by root.
- **Registration Authority (RA):** Verifies identity of certificate applicants before forwarding to
  CA. Handles authentication but not certificate issuance.
- **Certificate Revocation List (CRL):** Published list of revoked certificates (expired,
  compromised, or invalid). Clients check CRL before accepting certificates.
- **Certificate Repository:** Publicly accessible directory for certificates and CRLs.

**b)** Explain the working of HTTPS and SSL/TLS protocols. How does the TLS handshake establish a
secure connection between client and server? [8]

**HTTPS = HTTP over TLS/SSL** (port 443)

**TLS Handshake (1.3 simplified):**

1. **Client Hello:** Client sends supported TLS version, cipher suites, random nonce
2. **Server Hello:** Server selects cipher suite, sends certificate (with public key), digital
   signature
3. **Authentication:** Client verifies server certificate against trusted CA
4. **Key Exchange:** Client generates pre-master secret, encrypts with server's public key
5. **Session Keys:** Both derive symmetric session keys from pre-master secret
6. **Finished:** Encrypted "Finished" message confirms handshake success
7. **Secure Communication:** All subsequent data encrypted with session keys (AES, ChaCha20)

**Benefits:** Confidentiality (encryption), Integrity (MAC), Authentication (certificates)

---

### Unit V — Network and System Security

**Q5)** **a)** Explain Intrusion Detection Systems (IDS) and Intrusion Prevention Systems (IPS).
Compare signature-based and anomaly-based detection techniques with examples. [9]

**IDS** monitors network traffic for suspicious activity and alerts. **IPS** actively blocks
detected threats.

**Detection Techniques:**

| Feature                | Signature-based                    | Anomaly-based                             |
| ---------------------- | ---------------------------------- | ----------------------------------------- |
| **Approach**           | Matches known attack patterns      | Detects deviations from normal            |
| **False Positives**    | Low                                | High                                      |
| **False Negatives**    | High (new attacks missed)          | Low                                       |
| **Examples**           | Snort rules matching SQL injection | ML model flagging unusual traffic volumes |
| **Maintenance**        | Constant signature updates         | Baseline retraining                       |
| **Zero-day Detection** | No                                 | Yes                                       |

**Example (Signature):** Rule matching "SELECT \* FROM users WHERE" → SQL injection alert **Example
(Anomaly):** 10× normal traffic at 3 AM → possible DDoS

**b)** What is a firewall? Explain the types of firewalls: packet filter, stateful inspection,
application proxy, and next-generation firewall (NGFW). [9]

**Firewall** is a network security device that monitors and filters incoming/outgoing traffic based
on security rules.

| Type                    | Layer | Operation                       | Pros                     | Cons                      |
| ----------------------- | ----- | ------------------------------- | ------------------------ | ------------------------- |
| **Packet Filter**       | 3/4   | Filters by IP, port, protocol   | Fast, simple             | No context awareness      |
| **Stateful Inspection** | 3/4   | Tracks connection state         | Context-aware, secure    | Slower than packet filter |
| **Application Proxy**   | 7     | Intermediary for applications   | Deep inspection, logging | Performance overhead      |
| **NGFW**                | 3-7   | Combines all + IPS, app control | Comprehensive security   | Expensive, complex        |

---

**OR**

**Q6)** **a)** Explain Denial of Service (DoS) and Distributed Denial of Service (DDoS) attacks.
Describe mitigation techniques: rate limiting, blackholing, and DDoS protection services. [9]

**DoS/DDoS Attacks:** Overwhelm target with traffic, making services unavailable.

**Types:** SYN flood, UDP flood, HTTP flood, DNS amplification, Ping of Death

**Mitigation Techniques:**

- **Rate Limiting** — Limit requests per IP per time window. Effective against application-layer
  attacks.
- **Blackholing** — Route attack traffic to null interface (also drops legitimate traffic).
- **DDoS Protection Services** — Cloud-based (Cloudflare, AWS Shield) filter malicious traffic
  before reaching origin.

**b)** Discuss operating system security mechanisms. Explain trusted computing, secure boot, and
mandatory access control (MAC). [9]

**OS Security Mechanisms:**

- **Authentication** — Password policies, biometrics, multi-factor
- **Access Control** — DAC (user-driven), MAC (system-enforced), RBAC (role-based)
- **Audit Logging** — Track user and system events
- **Memory Protection** — ASLR, DEP, address space layout

**Trusted Computing:** Hardware-based security using TPM (Trusted Platform Module) for secure key
storage, remote attestation, and integrity measurement.

**Secure Boot:** UEFI firmware verifies digital signature of bootloader; bootloader verifies OS
kernel; each component validates the next — creating a chain of trust.

**Mandatory Access Control (MAC):** System-enforced policies (not user-overridable). SELinux,
AppArmor. Every subject (process) and object (file) has security labels. Access decisions based on
labels.

---

### Unit VI — Cyber Security and Tools

**Q7)** **a)** Classify cyber crimes with examples for each category. Explain the Indian IT Act 2000
and its amendments related to cyber crimes. [9]

**Cyber Crime Classification:**

| Category                 | Examples                                                   |
| ------------------------ | ---------------------------------------------------------- |
| **Against Individuals**  | Identity theft, cyber stalking, phishing, email spoofing   |
| **Against Property**     | Credit card fraud, intellectual property theft, ransomware |
| **Against Organization** | Data breach, DoS/DDoS, insider threats                     |
| **Against Government**   | Cyber terrorism, cyber warfare, website defacement         |
| **Cyber Bullying**       | Harassment, trolling, revenge porn                         |

**Indian IT Act 2000:** Provides legal recognition for electronic transactions, digital signatures.
**Amendments (2008):** Added Section 66 (hacking), 66B (dishonestly receiving stolen computer
device), 66C (identity theft), 66D (cheating by impersonation), 66E (privacy violation), 67 (obscene
content), 67A (sexually explicit content). Section 43A: Compensation for failure to protect data.

**b)** What is phishing? Explain different types of phishing attacks (spear phishing, whaling,
vishing, smishing). Describe countermeasures for phishing. [8]

**Phishing:** Social engineering attack where attacker masquerades as a legitimate entity to steal
credentials/sensitive data.

**Types:**

- **Spear Phishing** — Targeted at specific individual (uses personal details)
- **Whaling** — Targets senior executives (C-level)
- **Vishing** — Voice phishing (fake calls from bank)
- **Smishing** — SMS phishing (fake text messages with malicious links)

**Countermeasures:** MFA, email filtering, security awareness training, DMARC/DKIM/SPF verification,
suspicious link checking (hover before click), reporting mechanisms.

---

**OR**

**Q8)** **a)** Write short notes on any three: i) Password cracking techniques ii) Network scanning
with Nmap iii) Metasploit framework iv) Wireshark for packet analysis [9]

**i) Password Cracking Techniques:**

- **Brute Force** — Try all combinations (time-consuming)
- **Dictionary Attack** — Use common password lists (wordlist.txt)
- **Rainbow Tables** — Precomputed hash chains for fast reversing
- **Social Engineering** — Guess based on personal information
- **Tools:** John the Ripper, Hashcat, Cain & Abel

**ii) Network Scanning with Nmap:**

- **Ping Sweep** — Discover live hosts (`-sn`)
- **Port Scan** — Open ports/services (`-sS` TCP SYN, `-sT` TCP connect)
- **OS Detection** — Identify operating system (`-O`)
- **Version Detection** — Service versions (`-sV`)
- **Script Scan** — NSE scripts for vulnerabilities (`-sC`)
- Example: `nmap -sS -sV -O 192.168.1.0/24`

**iii) Metasploit Framework:**

- Penetration testing framework
- **Modules:** Exploit, Payload, Auxiliary, Encoder, Post
- **Workflow:** `use exploit → set payload → set RHOSTS → exploit`
- Popular exploits: EternalBlue (MS17-010), Shellshock

**b)** What is identity theft? Explain how identity theft occurs and describe preventive measures.
Discuss the role of biometric authentication in identity protection. [8]

**Identity Theft** is the fraudulent acquisition and use of another person's personal information
for financial gain.

**How it occurs:** Data breaches, phishing, dumpster diving, skimming devices, social media
oversharing, mail theft.

**Preventive Measures:**

- Strong unique passwords, MFA, credit freeze
- Regular monitoring of financial accounts
- Secure disposal of documents (shredding)
- Limited sharing of personal information online

**Biometric Authentication:** Fingerprint, face recognition (Face ID), iris scan, voice recognition.
Advantages: hard to steal/replicate compared to passwords. Limitations: cannot be changed if
compromised, privacy concerns.

---

---

## Examiner Commentary

This paper thoroughly assesses asymmetric cryptography and key exchange, data integrity mechanisms,
network security defenses, and cyber security awareness. The numerical problems (RSA, DH key
exchange, φ(n) computation) test applied cryptography skills, while the OS security and cyber crime
questions assess practical security knowledge.
