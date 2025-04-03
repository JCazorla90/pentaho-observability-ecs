# Pentaho Observability Stack on AWS ECS Fargate

Este repositorio permite desplegar todo el stack de observabilidad para Pentaho en AWS ECS usando Fargate.

## Servicios incluidos

- Pentaho ETL (con Python)
- Exporter de Prometheus
- Prometheus
- Grafana
- Elasticsearch
- Kibana

## Características

- Servicios desacoplados (1 Task Definition por microservicio)
- Deploy profesional con HTTPS opcional (ACM + Route53)
- Dashboards preconfigurados (Grafana + Kibana)
- Secrets seguros con AWS Secrets Manager
- CloudWatch Logs integrados

---

## Despliegue paso a paso

### 1. Crear y subir imágenes a ECR + Task Definitions
```bash
cd infra/scripts
./deploy-all.sh
```

Este script:

- Crea repos en ECR para cada microservicio
- Construye y sube las imágenes Docker
- Registra las Task Definitions en ECS

### 2. Lanzar servicios en un cluster ECS
```bash
./launch-services.sh
```

Este script:

- Lanza todos los servicios como ECS Services (1 por microservicio)
- Requiere definir:
  - `CLUSTER_NAME`
  - Subredes públicas (subnet-xxx)
  - Security Group (sg-xxx)

---

## Requisitos previos

- Tener configurado `aws cli`
- Permisos para ECR, ECS, CloudWatch y Secrets Manager
- VPC y subredes públicas creadas

---

## Opcional: HTTPS + dominio

Puedes añadir soporte HTTPS y dominios personalizados vía ACM + Route53. Mira la carpeta `infra/config/` para ejemplos de Terraform o CloudFormation.



---

## Entorno preparado para producción profesional

✔️ Imágenes oficiales en todos los servicios  
✔️ Despliegue modular por microservicio  
✔️ Configuración de Prometheus y Alertmanager lista  
✔️ Dockerfiles listos para CI/CD y ECS  
✔️ Scripts de build y push para ECR  
✔️ Integración opcional con:
- Correo (SNS + email_configs)
- Slack (webhook)
- Microsoft Teams (webhook)

Archivos clave:
- `infra/config/prometheus.yml` → Targets configurables
- `infra/config/alertmanager.yml` → Receptores editables

⚠️ Recuerda personalizar los campos vacíos de notificación antes de aplicar en producción.
