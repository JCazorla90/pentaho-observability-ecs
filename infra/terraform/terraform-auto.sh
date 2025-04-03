#!/bin/bash

set -e

echo "🌍 Inicializando Terraform..."
terraform init

echo "📐 Generando plan de ejecución..."
terraform plan -out=tfplan

echo ""
read -p "¿Deseas aplicar el plan? (y/n): " CONFIRM
if [ "$CONFIRM" == "y" ]; then
    echo "🚀 Aplicando cambios..."
    terraform apply tfplan
    echo "✅ Infraestructura desplegada correctamente."
else
    echo "❌ Ejecución cancelada."
fi
