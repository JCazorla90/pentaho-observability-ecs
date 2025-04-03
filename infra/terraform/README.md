# Despliegue de Infraestructura con Terraform

Este módulo crea automáticamente:

- VPC con subredes públicas
- ECS Cluster con Fargate
- Seguridad para balanceador y tareas
- (Opcional) ACM y dominios Route53

## Uso

1. Entra a la carpeta:
```bash
cd infra/terraform
```

2. Inicializa Terraform:
```bash
terraform init
```

3. Revisa y aplica:
```bash
terraform apply
```

## Permisos necesarios en AWS

El archivo `permissions-policy.json` contiene las acciones mínimas necesarias para crear un permissionset o rol con acceso a:

- ECS
- ECR
- EC2 (subnets, SG, VPC)
- Secrets Manager
- ACM y Route53
- CloudWatch Logs

Puedes crear un rol desde AWS IAM o Identity Center con esta policy.



---

## Script automático

Puedes usar el script `terraform-auto.sh` para:

1. Inicializar Terraform
2. Generar el plan (`terraform plan`)
3. Aplicar automáticamente (`terraform apply`) con confirmación previa

```bash
./terraform-auto.sh
```
