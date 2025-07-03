# ha-two-tier-aws-terraform-jenkins
Deploying High-Availability One-Tier AWS Architecture with Terraform and Jenkins

Here is a comprehensive outline and project plan for Deploying High-Availability Two-Tier AWS Architecture with Terraform and Jenkins. This plan is designed for intermediate to advanced users and covers project structure, workflow, and step-by-step guidance, ensuring clarity and best practices.

## Project Overview
    Objective:
    Automate the deployment of a high-availability, two-tier AWS architecture using Terraform for Infrastructure as Code and Jenkins for CI/CD automation.
    
    Architecture Components:
    
    VPC with public and private subnets across multiple Availability Zones
    
    Web Tier: Auto Scaling Group of EC2 instances behind an Application Load Balancer (ALB) in public subnets
    
    Database Tier: Managed RDS (e.g., MySQL) in private subnets
    
    Security Groups: Restrict access between tiers and from the internet

Jenkins: Orchestrates infrastructure provisioning and application deployment
---
## 📦 Project Structure

aws-ha-two-tier-terraform-jenkins/
```
.
├── modules/
│   ├── jenkins/
│   │   ├── main.tf                # Jenkins EC2 setup
│   │   ├── variables.tf           # Inputs for Jenkins module
│   │   └── outputs.tf             # Outputs (e.g., public IP)
│   ├── vpc/
│   │   ├── main.tf                # VPC, subnets, NAT
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── alb/
│   │   ├── main.tf                # Application Load Balancer
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── asg/
│   │   ├── main.tf                # Launch Template, Auto Scaling
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── rds/
│   │   ├── main.tf                # RDS MySQL multi-AZ
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── bastion/
│       ├── main.tf                # Bastion host in public subnet
│       ├── variables.tf
│       └── outputs.tf
├── terraform/
│   ├── main.tf                    # Calls modules
│   ├── provider.tf                # AWS provider config
│   ├── variables.tf               # All root-level variables
│   ├── outputs.tf                 # Final outputs (e.g., ALB DNS)
│   └── backend.tf                 # Remote S3 backend config
├── jenkins/
│   ├── Jenkinsfile                # Multibranch pipeline for full infra
│   └── bootstrap.sh              # EC2 user data script to install Jenkins
├── .github/
│   └── workflows/
│       └── jenkins-bootstrap.yml  # GitHub Action: deploy only Jenkins module
├── secrets/                      # (Optional) Placeholder for dev secrets
├── docs/
│   ├── architecture.png           # HA architecture diagram
│   └── report.pdf                 # Project design report
├── README.md                     # Project documentation
└── .gitignore                    # Ignore Terraform artifacts and secrets
```

---

## Project Workflow
```
Step	Description
1	    Initialize Project & Repo Structure
2	    Write & Commit Terraform Code (HCL) to GitHub
3	    Provision Jenkins Server (locally or on AWS)
4	    Configure Jenkins: Plugins, Credentials, GitHub Webhook
5	    Create Jenkins Pipeline (Jenkinsfile)
6	    Pipeline Triggers Terraform to Deploy AWS Infra
7	    Application is Deployed to EC2 via User Data or Pipeline
8	    Verify Application via ALB and Database Connectivity
```
---

## Step-by-Step Guide

1. Design & Initialize the GitHub Repo
    
    Create a new repository with the structure above.
    Add a .gitignore for Terraform, Jenkins, and OS files.

2. Write Terraform Code

    provider.tf: AWS provider configuration.

    vpc.tf: Define VPC, public/private subnets (at least two AZs for HA), internet gateway, NAT gateway, and route tables.

    security_groups.tf:

    ALB: Allow HTTP/HTTPS from the internet.

    Web tier: Allow traffic from ALB only.

    DB tier: Allow traffic from web tier only.

    alb.tf: Create ALB in public subnets, target group, listener.

    asg.tf: Launch template (with user data), Auto Scaling Group in public subnets, scaling policies.

    rds.tf: RDS instance in private subnets, subnet group, security group.

    userdata.sh: Script to install and start your application on EC2 at boot.

    outputs.tf: Output ALB DNS, RDS endpoint, etc.

3. Provision Jenkins
   Launch Jenkins (locally, on EC2, or managed).

    Install plugins: Git, Pipeline, Terraform, AWS Credentials, etc.

    Add AWS credentials as Jenkins secrets.

4. Configure Jenkins Pipeline
    
    Create a Jenkinsfile in your repo:

    Clone repo

    Run terraform init, plan, apply

    Optionally deploy app code if not handled by user data

    Configure a Jenkins job to use this pipeline.

    Set up a GitHub webhook to trigger the job on push.

5. Pipeline Execution
   
    On code push, Jenkins pulls the latest code and runs the pipeline.
    Terraform provisions or updates AWS infrastructure.
    EC2 instances in the ASG run the user data script to install/start the application and connect to RDS.
    The ALB routes traffic to healthy EC2 instances.

6: Verification

    After deployment, find the ALB DNS and RDS endpoint in Terraform outputs or Jenkins logs.
    Open the ALB DNS in your browser to access the web app.
    Verify application can connect to the database.
    Outputs You Should NOT Commit
    Terraform State Files: .terraform/, terraform.tfstate, terraform.tfstate.backup
    Jenkins Build Artifacts/Logs: Managed by Jenkins
    AWS Credentials: Never commit secrets or credentials to the repo

---

## Visual Workflow

graph TD
A[GitHub Push] --> B[Jenkins Pipeline Triggered]
B --> C[Terraform Init/Plan/Apply]
C --> D[AWS: VPC, Subnets, ALB, ASG, RDS]
D --> E[User Data: App Installed on EC2]
E --> F[ALB DNS Exposed, RDS Endpoint Output]
F --> G[User Accesses App via ALB; App Connects to RDS]

---

## Best Practices
Use remote state for Terraform (e.g., S3 backend with DynamoDB lock)

Never commit secrets; use Jenkins credentials and environment variables

Use modules for reusability if project grows

Restrict security group rules to least privilege

Tag resources for easy management

Use multi-AZ for RDS and subnets for high availability

Regularly backup RDS and enable maintenance windows

---
