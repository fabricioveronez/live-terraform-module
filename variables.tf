# Variáveis gerais
variable "region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "eks-demo"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Variáveis de rede
variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para as subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDRs para as subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade para usar"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Se deve criar NAT Gateways para acesso à internet a partir das subnets privadas"
  type        = bool
  default     = true
}

# Variáveis do EKS
variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-demo-cluster"
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes a ser usada"
  type        = string
  default     = "1.32"
}

variable "endpoint_private_access" {
  description = "Se o endpoint privado do EKS deve ser habilitado"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Se o endpoint público do EKS deve ser habilitado"
  type        = bool
  default     = true
}

# Variáveis do Node Group
variable "instance_types" {
  description = "Lista de tipos de instância para os nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "disk_size" {
  description = "Tamanho do disco para os nodes em GB"
  type        = number
  default     = 20
}

variable "node_desired_size" {
  description = "Número desejado de workers"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Número máximo de workers"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Número mínimo de workers"
  type        = number
  default     = 1
}

variable "node_labels" {
  description = "Labels a serem aplicados aos nodes"
  type        = map(string)
  default     = {
    "role" = "worker"
  }
}

# Variáveis de Add-ons
variable "vpc_cni_version" {
  description = "Versão do VPC CNI add-on"
  type        = string
  default     = null # Usará a versão padrão recomendada
}

variable "coredns_version" {
  description = "Versão do CoreDNS add-on"
  type        = string
  default     = null # Usará a versão padrão recomendada
}

variable "kube_proxy_version" {
  description = "Versão do kube-proxy add-on"
  type        = string
  default     = null # Usará a versão padrão recomendada
}