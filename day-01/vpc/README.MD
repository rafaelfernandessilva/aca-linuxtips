# Terraform VPC Module and Environment Setup

Este repositório contém a configuração de infraestrutura para provisionamento de uma VPC utilizando Terraform. 

## Diretório

A estrutura do repositório é organizada da seguinte forma:

```bash
├── module
│   └── vpc
│       ├── database_subnet.tf
│       ├── private_subnet.tf
│       ├── public_subnet.tf
│       └── nat_gateway.tf
│       └── parameter_store.tf
│       └── providers.tf
│       └── variables.tf
│       └── ouput.tf
└── environment
    └── dev
        ├── main.tf
        ├── backend.tf
        ├── variables.tf
        ├── terraform.tfvars
        ├── backend.tfvars
        └── output.tf
```
### Diretório `/module/vpc`

Este diretório contém o módulo Terraform responsável pela criação da VPC. 

### Diretório `/environment/dev`

Este diretório contém a configuração do ambiente de desenvolvimento, que faz uso do módulo de VPC:

### Como Utilizar

#### Inicializar o Terraform

 ``` cd environment/dev ```

``` terraform init ```

``` terraform plan ```

``` terraform apply ```
