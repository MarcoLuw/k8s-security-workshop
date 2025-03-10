# Kubernetes Security  

## Module 1. Kubernetes and Cloud Security Basics
### 1. Kubernetes Security
- Why do we need security?
- Kubernetes Architecture Diagram
- Kubernetes Security Best Practices  

### 2. The 4 C's of Kubernetes Security  
- Cloud, Cluster, Container, Code  

## Module 2. Cluster Security  
### 1. Kubernetes Cluster Security Fundamentals  

### 2. Securing Clusters with RBAC  
- What is RBAC (Cluster Roles/Roles, Cluster Role Bindings/Role Bindings, Users, Service Accounts)  
- Sample YAML + Demo (Demo: use picture instead)  

### 3. Security Auditing Tools  
- What is CIS Benchmark?
- What is Penetration Testing?
- Why need tools?  
- **Demo:**  
  - kube-bench (CIS Benchmark Testing)
  - kube-hunter (Kubernetes Penetration Testing)  

## Module 3. Container Security  
### 1. Understanding Containers & Isolation  
- Virtualization vs. Containers  
- Container Isolation (cgroups, chroot, namespaces)  

### 2. Container Breakout  
- What is container breakout?  
- Example: [Pentest Monkey - Chroot Breakout](https://pentestmonkey.net/blog/chroot-breakout-perl)  
- Real-world example: **"Dirty Cow" exploit** *(If needed)*  

### 3. Preventing Container Breakout  
- Using Kubernetes Security Context  
- Avoid Mounting Host’s Root Directory  
- Limit Service Account’s Privileges  
- Limiting Linux Kernel Calls  

### 4. Using Kubernetes' Built-in Security Features  
- Pod Security Admissions  
- Network Policies  

### 5. Extending Security with External Tools  
- **Why?** → Shortcomings of Built-in Features  
- **Policy Enforcement with:**  
  - OPA Gatekeeper (M9sweeper)
  - kubesec (Evaluates YAML manifests) 

## Module 4. Code Security  
### 1. Vulnerability Scanning & Intrusion Detection  
- What it does?  (Definitions, Threats, Benefits)

### 2. Scanning Container Images for CVEs  
- What is CVE?
- **CVE Scanning with Trivy** (Scans container images for known CVEs)  

### 3. Runtime Intrusion Detection  
- **Project Falco** and Intrusion Detection (Detecting abnormal behavior in clusters)  

---

## Why is Falco put in Code Security Scope?  
- While Falco operates at the **cluster level**, it detects **container breakouts, privilege escalation, and runtime anomalies**.  
- Falco is an **active runtime security tool**, detecting **real-time threats** after containers are running.  

---

## Reference  
- **DevOpsCon - Kubernetes Security Workshop:** [Workshop Link](https://devopscon.io/kubernetes-ecosystem/kubernetes-security-workshop/)  
  - **Slide:** [Google Slides](https://docs.google.com/presentation/d/1b8P19XOtsLzpS5vJtlUhzTVPEByhEQB6wBGotc7c_PE/edit#slide=id.g2010fd6445c_0_667)  
- **Jake - Short Kubernetes Security Workshop:** [Workshop PDF](https://conf42.github.io/static/slides/Conf42%20Kube%20Native%202023%20-%20Jacob%20Beasley.pdf)  
  - **Lab Guide:** [Google Doc](https://docs.google.com/document/d/18wwz2vxDK1kdvCyUMXdr7XcKF0bQ8yrfuRi067RwP8A/edit?tab=t.0#heading=h.3qrtvg9967oy)  
- **Scotty - Kubernetes Security Workshop:** [GitHub Repository](https://github.com/scotty-c/kubernetes-security-workshop/tree/master)
- **Cybereason - Container Escape:** [Referral Link](https://www.cybereason.com/blog/container-escape-all-you-need-is-cap-capabilities)
- **Pentestmonkey - Breaking Out of a Chroot Jail Using PERL:** [Referral Link](https://pentestmonkey.net/blog/chroot-breakout-perl)
- **OWASP - Kubernetes Security Cheat Sheet:** [Referral Link](https://cheatsheetseries.owasp.org/cheatsheets/Kubernetes_Security_Cheat_Sheet.html)
- **Gatekeeper Introduction:** [Referral Link](https://open-policy-agent.github.io/gatekeeper/website/docs/)
- **Open Policy Agent Introduction:** [Referral Link](https://www.openpolicyagent.org/)
- **OPA Gatekeeper: Policy and Governance for Kubernetes:** [Referral Link](https://kubernetes.io/blog/2019/08/06/opa-gatekeeper-policy-and-governance-for-kubernetes/)
