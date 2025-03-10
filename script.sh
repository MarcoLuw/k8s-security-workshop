# kube-bench --- https://github.com/aquasecurity/kube-bench
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml
kubectl logs kube-bench-j76s9

# kube-hunter -- https://github.com/aquasecurity/kube-hunter
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-hunter/main/job.yaml
kubectl logs kube-hunter-fdb5m

# trivy -- https://github.com/aquasecurity/trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh
./bin/trivy --version

./bin/trivy image nginx:latest                            # Scan a Container Image
./bin/trivy k8s --report summary cluster                  # Scan a Running Kubernetes Cluster
./bin/trivy k8s --report summary --include-kinds pod            # Scan Kubernetes Resources
./bin/trivy k8s --report summary --include-namespaces default      
./bin/trivy fs /path/to/directory                         # Scan a Local Filesystem for Vulnerabilities
./bin/trivy config /path/to/configs                       # Scan IaC Files (Terraform, Kubernetes YAMLs)

# kubesec -- https://github.com/controlplaneio/kubesec
wget https://github.com/controlplaneio/kubesec/releases/download/v2.14.2/kubesec_linux_amd64.tar.gz
tar -zvxf kubesec_linux_amd64.tar.gz
sudo chmod +x kubesec
sudo mv kubesec /usr/local/bin/
    ## print scanning rules
    kubesec print-rules                 

    ## Specify custom schema
    kubesec [scan|http] 
    kubesec [scan|http] --kubernetes-version <version> --schema-location https://host.server    # via HTTP
    kubesec [scan|http] --kubernetes-version <version> --schema-location /opt/schemas           # via local files
    
    ## Usage
    kubesec scan pod.yaml           # Scan pod

# OPA Gatekeeper - Kubernetes admission controller
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.11/deploy/gatekeeper.yaml
    ## Create a sample constraint template
    '''
        apiVersion: templates.gatekeeper.sh/v1
        kind: ConstraintTemplate
        metadata:
          name: k8sdenyroot
        spec:
          crd:
            spec:
              names:
                kind: K8sDenyRoot
          targets:
            - target: admission.k8s.gatekeeper.sh
              rego: |
                package k8sdenyroot

                violation[{"msg": msg}] {
                  input.review.object.spec.containers[_].securityContext.runAsNonRoot == false
                  msg := "Running as root is not allowed"
                }
    '''
    ## Create Constraint based on constraint template
    '''
        apiVersion: constraints.gatekeeper.sh/v1beta1
        kind: K8sDenyRoot
        metadata:
          name: deny-root-containers
        spec:
          match:
            kinds:
              - apiGroups: [""]
                kinds: ["Pod"]
    '''
    ## Create a bad-pod for example
    '''
        apiVersion: v1
        kind: Pod
        metadata:
          name: bad-pod
        spec:
          containers:
            - name: nginx
              image: nginx
              securityContext:
                runAsNonRoot: false  # This violates our policy!
    '''