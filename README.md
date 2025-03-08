# Kubernetes Security  

## Module 1. Kubernetes and Cloud Security Basics  
### 1. Kubernetes Architecture  
- Deploying a Pod and Deployment  
- Other Object Types  

### 2. The 4 C's of Cloud Security  
- Cloud, Cluster, Container, Code  
- Kubernetes Security Best Practices  

## Module 2. Cluster Security  
### 1. Kubernetes Cluster Security Fundamentals  

### 2. Securing Clusters with RBAC  
- What is RBAC (Cluster Roles/Roles, Cluster Role Bindings/Role Bindings, Users, Service Accounts)  
- Sample YAML + Demo  

### 3. Security Auditing Tools  
- Why Cluster Security Auditing?  
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
- What it does?  
- About CVE scanning  

### 2. Scanning Container Images for CVEs  
- **CVE Scanning with Trivy** (Scans container images for known CVEs)  
- **CVE Scanning in M9sweeper** (Extending security automation & policies)  

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
