#!/bin/bash

set -e

CLUSTER_NAME="pentaho-observability-cluster"
REGION="eu-west-1"
SUBNETS="subnet-xxxxxxx1,subnet-xxxxxxx2"  # ← REEMPLAZAR
SECURITY_GROUP="sg-xxxxxxxx"               # ← REEMPLAZAR

SERVICES=("pentaho" "exporter" "prometheus" "grafana" "elasticsearch" "kibana")

for SERVICE in "${SERVICES[@]}"; do
  echo "🚀 Creando servicio ECS para $SERVICE"
  aws ecs create-service \
    --cluster $CLUSTER_NAME \
    --service-name pentaho-${SERVICE} \
    --task-definition pentaho-${SERVICE} \
    --desired-count 1 \
    --launch-type FARGATE \
    --network-configuration "awsvpcConfiguration={subnets=[$SUBNETS],securityGroups=[$SECURITY_GROUP],assignPublicIp=ENABLED}" \
    --region $REGION
done

echo "✅ Todos los servicios han sido desplegados en el cluster: $CLUSTER_NAME"
