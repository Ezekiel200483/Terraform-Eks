# 🚀 EKS Cluster Deployment with Terraform

A production-ready AWS EKS (Elastic Kubernetes Service) cluster deployment using Terraform. This repository provides a complete infrastructure-as-code solution for deploying a scalable, secure Kubernetes cluster on AWS.

## 🏗️ Infrastructure Components

This deployment creates:

- **EKS Cluster**: Kubernetes 1.30 with managed node groups
- **VPC**: Custom VPC with public/private subnets across multiple AZs
- **Security Groups**: Properly configured networking and security rules
- **IAM Roles**: Service roles for cluster and node groups with minimal permissions
- **Auto Scaling**: Node groups that scale from 2-6 instances based on demand

## 📋 Prerequisites

### Install AWS CLI 

As the first step, you need to install AWS CLI as we will use the AWS CLI (`aws configure`) command to connect Terraform with AWS in the next steps.

Follow the below link to Install AWS CLI.
```
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```

### Install Terraform

Next, Install Terraform using the below link.
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

### Install kubectl

Install kubectl to interact with your EKS cluster:
```bash
# macOS
brew install kubectl

# Or follow: https://kubernetes.io/docs/tasks/tools/install-kubectl/
```

### Connect Terraform with AWS

Its very easy to connect Terraform with AWS. Run `aws configure` command and provide the AWS Security credentials as shown in the video.

## 🚀 Quick Start

### 1. Clone and Initialize

```bash
git clone https://github.com/Ezekiel200483/Terraform-Eks.git
cd Terraform-Eks
terraform init
```

### 2. Review Configuration (Optional)

Run `terraform plan` to see the configuration it creates when executed.

### 3. Deploy the Cluster

**Option A: Manual deployment**
```bash
terraform apply
```

**Option B: Automated deployment (Recommended)**
```bash
chmod +x deploy-eks.sh
./deploy-eks.sh
```

The automated script will:
- ✅ Check prerequisites (terraform, aws-cli, kubectl)
- 📋 Run terraform plan and show you what will be created
- 🚀 Apply the configuration after confirmation
- ⚙️ Configure kubectl automatically
- 📊 Display cluster information

### 4. Verify Deployment

```bash
# Check cluster status
kubectl get nodes

# View cluster info
kubectl cluster-info
```

## 📁 Project Structure

```
terraform-eks/
├── eks-cluster.tf      # Main EKS cluster configuration
├── vpc.tf             # VPC, subnets, and networking
├── security-groups.tf # Security group rules for cluster
├── variables.tf       # Input variables and configuration
├── outputs.tf         # Output values (cluster info)
├── versions.tf        # Terraform and provider versions
├── deploy-eks.sh      # Automated deployment script
└── README.md          # This documentation
```

## 🛡️ Security & Best Practices

This configuration follows AWS EKS best practices:

- **Network Security**: Worker nodes in private subnets
- **IAM**: Least privilege principle for all roles
- **Encryption**: EBS volumes encrypted at rest
- **Access Control**: Proper security group configurations
- **Updates**: Uses latest stable Kubernetes version (1.30)

## 💰 Cost Considerations

- **Instance Type**: t3.medium (~$30/month per node when running 24/7)
- **Node Count**: Starts with 2 nodes, scales to 6 based on demand
- **Storage**: EBS volumes for node storage (~$0.10/GB/month)
- **NAT Gateway**: ~$45/month for outbound internet access

**Cost Tip**: Destroy the cluster when not in use to avoid charges!

## 🧹 Cleanup

**Option A: Using the script**
```bash
./deploy-eks.sh destroy
```

**Option B: Manual cleanup**
```bash
terraform destroy
```

## 📚 Additional Resources

- [AWS EKS Documentation](https://docs.aws.amazon.com/eks/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the deployment
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
