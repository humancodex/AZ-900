#!/usr/bin/env bash
set -euo pipefail

# Parámetros (ajusta a tu entorno)
RG="MiGrupoRecursos"
LOCATION="eastus"
PLAN="MiAppServicePlan"
SKU="S1"                      # Basic S1; puede ser B1, P1v2, etc.
OS="Linux"                    # Linux o Windows
APP="MiWebApp"                # Debe ser único a nivel global
RUNTIME="PYTHON|3.9"          # Ej: "NODE|14-lts", "DOTNETCORE|7.0", etc.

# 1. Crear grupo de recursos
az group create \
  --name $RG \
  --location $LOCATION

# 2. Crear App Service Plan
az appservice plan create \
  --name $PLAN \
  --resource-group $RG \
  --sku $SKU \
  --is-linux                      # quita esta línea si usas Windows

# 3. Crear la Web App
az webapp create \
  --resource-group $RG \
  --plan $PLAN \
  --name $APP \
  --runtime $RUNTIME

# 4. Configurar variables de entorno (App Settings)
az webapp config appsettings set \
  --name $APP \
  --resource-group $RG \
  --settings \
      ENVIRONMENT="Production" \
      LOG_LEVEL="Info"

# 5. Habilitar logs de aplicación y de servidor
az webapp log config \
  --name $APP \
  --resource-group $RG \
  --application-logging filesystem \
  --web-server-logging filesystem

# 6. (Opcional) Configurar despliegue continuo desde GitHub
az webapp deployment source config \
  --name $APP \
  --resource-group $RG \
  --repo-url https://github.com/tu-org/tu-repo \
  --branch main \
  --manual-integration

# 7. (Opcional) Escalado automático en función de CPU
az monitor autoscale create \
  --resource-group $RG \
  --resource $PLAN \
  --resource-type Microsoft.Web/serverfarms \
  --name "Autoscale-$PLAN" \
  --min-count 1 \
  --max-count 3 \
  --count 1

az monitor autoscale rule create \
  --resource-group $RG \
  --autoscale-name "Autoscale-$PLAN" \
  --condition "Percentage CPU > 70 avg 5m" \
  --scale out 1

az monitor autoscale rule create \
  --resource-group $RG \
  --autoscale-name "Autoscale-$PLAN" \
  --condition "Percentage CPU < 30 avg 5m" \
  --scale in 1

echo "App Service '$APP' desplegado en el plan '$PLAN' (SKU $SKU) en la región $LOCATION."