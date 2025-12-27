# Terraform EKS Cluster (AWS)

Ye project **Terraform** use karke **AWS EKS (Elastic Kubernetes Service) cluster** create karta hai.  
Isme VPC, networking aur EKS managed node group automatically setup hota hai.

---

## Project Overview

Is project ka main goal hai:
- Infrastructure ko **code ke through automate** karna
- AWS par **EKS cluster** banana without manual steps
- Terraform modules ka real-world use sikhna

---

## What this project creates

- Custom VPC (`10.0.0.0/16`)
- Public, Private aur Intra subnets
- Amazon EKS Cluster
- EKS Managed Node Group
- EKS Addons:
  - vpc-cni
  - coredns
  - kube-proxy

---

## Tools & Technologies

- Terraform
- AWS (EKS, VPC, EC2)
- Kubernetes
- terraform-aws-modules

---

## AWS Details

- Region: `ap-south-1` (Mumbai)
- Cluster Name: `tws-eks-cluster`
- Node Type: `t2.medium`
- Capacity Type: SPOT
- Nodes: Min 2 | Max 3

---

## Folder Structure

terraform-eks/
├── main.tf
├── locals.tf
├── providers.tf
├── versions.tf
├── .gitignore
└── README.md

yaml
Copy code

---

## How to run this project

### 1. Configure AWS CLI
```bash
aws configure
2. Initialize Terraform
bash
Copy code
terraform init -upgrade
3. Validate code
bash
Copy code
terraform validate
4. Create infrastructure
bash
Copy code
terraform apply
Type yes to confirm.

Verify EKS Cluster
bash
Copy code
aws eks update-kubeconfig --region ap-south-1 --name tws-eks-cluster
kubectl get nodes
Important Notes
.terraform aur terraform.tfstate GitHub me commit nahi kiye gaye hain

Provider aur module versions pinned hain

Project real-world Terraform best practices follow karta hai

Clean up (to avoid AWS cost)
bash
Copy code
terraform destroy
