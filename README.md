# Módulo Terraform linuxtips-eks

## Descrição

Este módulo cria um cluster Amazon EKS totalmente funcional com os recursos associados.

## Uso

```hcl
module "linuxtips_eks" {
  source = "./linuxtips-eks"

  name                    = "my-cluster"
  region                  = "eu-west-1"
  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  private_subnet_cidrs    = ["10.0.128.0/19", "10.0.160.0/19", "10.0.192.0/19"]
  availability_zones      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  cluster_name            = "my-cluster"
  node_instance_types     = ["c5.large"]
  node_group_desired_size = 2
  node_group_max_size     = 6
  node_group_min_size     = 2
  tags = {
    Environment = "production"
    Team        = "Platform Engineering"
  }
}
```

## Entradas

- `name`: Nome do cluster EKS.
- `region`: Região AWS.
- `vpc_cidr_block`: Bloco CIDR para a VPC.
- `public_subnet_cidrs`: Lista de blocos CIDR para sub-redes públicas.
- `private_subnet_cidrs`: Lista de blocos CIDR para sub-redes privadas.
- `availability_zones`: Lista de zonas de disponibilidade para as sub-redes.
- `cluster_name`: Nome do cluster EKS.
- `node_instance_types`: Lista de tipos de instância para os nós de trabalho.
- `node_group_desired_size`: Tamanho desejado do grupo de nós.
- `node_group_max_size`: Tamanho máximo do grupo de nós.
- `node_group_min_size`: Tamanho mínimo do grupo de nós.
- `tags`: Tags a serem aplicadas aos recursos.

## Saídas

- `eks_cluster_id`: ID do cluster EKS.
- `eks_cluster_endpoint`: Endpoint do cluster EKS.
- `eks_cluster_certificate_authority`: Dados da autoridade certificadora para o cluster.
- `eks_cluster_oidc_issuer_url`: URL do emissor OIDC do cluster EKS.
- `eks_node_group_role_arn`: ARN da função IAM do grupo de nós.
- `eks_autoscaler_role_arn`: ARN da função IAM do escalador automático do cluster.
- `eks_cluster_oidc_provider_arn`: ARN do provedor OIDC para o cluster EKS.
- `eks_cluster_oidc_provider_id`: ID do provedor OIDC para o cluster EKS.

## Notas

- O módulo cria uma VPC, sub-redes e outros recursos necessários na região especificada.
- O módulo cria um grupo de nós com os tipos de instância especificados e configuração de escalabilidade automática.
- O módulo cria uma função IAM para o grupo de nós e uma função para o escalador automático do cluster.
- O módulo cria um provedor OIDC para o cluster EKS.
- O módulo cria uma política IAM para o escalador automático do cluster EKS.
- O módulo cria uma função IAM para o escalador automático do cluster EKS.
- O módulo cria uma política IAM para o escalador automático do cluster EKS.

## Estado do Terraform

O estado do Terraform é armazenado em um bucket S3 e em uma tabela DynamoDB. O bucket e a tabela são criados no módulo raiz.

## Bloqueio de Estado do Terraform

O estado do Terraform é bloqueado usando uma tabela DynamoDB. A tabela é criada no módulo raiz.

