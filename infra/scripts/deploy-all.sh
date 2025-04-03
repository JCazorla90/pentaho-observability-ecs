#!/bin/bash

set -e

# Variables
REGION="eu-west-1"
SERVICES=("pentaho" "exporter" "prometheus" "grafana" "elasticsearch" "kibana")
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

echo "🔧 Creando repositorios en ECR..."
for SERVICE in "${SERVICES[@]}"; do
  REPO_NAME="pentaho-${SERVICE}"
  aws ecr describe-repositories --repository-names "$REPO_NAME" --region $REGION >/dev/null 2>&1 ||   aws ecr create-repository --repository-name "$REPO_NAME" --region $REGION
done

echo "🐳 Construyendo y subiendo imágenes..."
for SERVICE in "${SERVICES[@]}"; do
  echo "➡️  $SERVICE"
  cd ../../services/$SERVICE
  ./build-and-push.sh
  cd - >/dev/null
done

echo "📦 Registrando Task Definitions en ECS..."
for SERVICE in "${SERVICES[@]}"; do
  echo "➡️  $SERVICE"
  aws ecs register-task-definition     --cli-input-json file://../../services/$SERVICE/task-definition.json     --region $REGION
done

echo "✅ Despliegue base completado. Ahora puedes lanzar servicios en tu cluster ECS."
