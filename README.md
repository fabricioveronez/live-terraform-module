# Projeto EKS com Terraform (Versão Monolítica)

Este projeto implementa um cluster Amazon EKS (Elastic Kubernetes Service) na AWS usando o Terraform. Esta é uma versão monolítica do projeto, onde todos os recursos são definidos em um único conjunto de arquivos sem usar módulos Terraform.

## Arquitetura do Projeto

Este projeto criará:

- Uma VPC dedicada com subnets públicas e privadas
- Internet Gateway e NAT Gateways para conectividade
- Security Groups adequados para o cluster EKS e seus nodes
- IAM roles e policies necessárias para o EKS
- Cluster EKS
- Grupo de nodes para o cluster
- Add-ons essenciais (vpc-cni, coredns, kube-proxy)

## Pré-requisitos

- Terraform >= 1.0.0
- AWS CLI configurado com credenciais adequadas
- kubectl (para interagir com o cluster após a criação)

## Estrutura do Projeto

```
.
├── main.tf           # Definição principal dos recursos
├── variables.tf      # Definição das variáveis
├── outputs.tf        # Saídas do Terraform
├── terraform.tfvars  # Valores das variáveis
└── README.md         # Esta documentação
```

## Como usar

1. Clone este repositório:
   ```
   git clone <repo-url>
   cd <repo-dir>
   ```

2. Inicialize o Terraform:
   ```
   terraform init
   ```

3. Verifique o plano de execução:
   ```
   terraform plan
   ```

4. Aplique as mudanças:
   ```
   terraform apply
   ```

5. Configure o kubectl para o novo cluster:
   ```
   aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_id)
   ```

6. Verifique o cluster:
   ```
   kubectl get nodes
   ```

## Customização

Você pode personalizar os recursos editando o arquivo `terraform.tfvars` com seus próprios valores:

- Alterar a região da AWS
- Modificar os CIDRs da VPC e subnets
- Ajustar o tamanho e tipo das instâncias dos nodes
- Personalizar o nome do cluster e environment
- E muito mais...

## Limpeza

Para destruir todos os recursos criados:

```
terraform destroy
```

## Limitações da Versão Monolítica

Esta versão do projeto tem algumas limitações:

1. Baixa reusabilidade - difícil aplicar a mesma configuração em diferentes ambientes
2. Manutenção complexa - alterações em uma parte podem afetar outras partes
3. Colaboração limitada - equipes diferentes não podem trabalhar em componentes separados
4. Testes difíceis - não é possível testar componentes individualmente

A próxima etapa deste projeto será refatorá-lo para usar módulos Terraform, o que resolverá essas limitações.