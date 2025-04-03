# CodePipeline Setup

## Requisitos

- AWS CodePipeline y CodeBuild habilitados
- IAM Role con permisos para ECR, ECS, CodeBuild y CodePipeline
- Código en un repositorio Git conectado a CodePipeline

## Pasos

1. Crear repositorio ECR para `pentaho-exporter`
2. Subir este repositorio a GitHub o CodeCommit
3. Crear un pipeline con:
   - Origen: GitHub / CodeCommit
   - Build: CodeBuild con este `buildspec.yml`
   - Despliegue manual o automatizado (ECS, CloudFormation)

