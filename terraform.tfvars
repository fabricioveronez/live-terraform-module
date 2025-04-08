# Valores de exemplo para as variáveis
region       = "us-east-1"
project_name = "eks-demo"
environment  = "dev"

# Configurações de rede
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

# Configurações do EKS
cluster_name            = "eks-demo-cluster"
kubernetes_version      = "1.27"
endpoint_private_access = true
endpoint_public_access  = true

# Configurações dos Nodes
instance_types    = ["t3.medium"]
disk_size         = 20
node_desired_size = 2
node_max_size     = 4
node_min_size     = 1
node_labels = {
  "role"      = "worker"
  "type"      = "standard"
  "purpose"   = "general"
}