#!/bin/bash

# Variables
RESOURCE_GROUP="GrupoRecursosFunciones"
LOCATION="eastus2"
STORAGE_ACCOUNT="storagefunciones$(openssl rand -hex 3)"
FUNCTION_APP_NAME="funcionapp$(openssl rand -hex 3)"
APP_SERVICE_PLAN="planfunciones$(openssl rand -hex 3)"

echo "🚀 Creando recursos para Azure Functions..."

# Crear grupo de recursos
echo "📦 Creando grupo de recursos..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Crear cuenta de almacenamiento para Functions
echo "💾 Creando cuenta de almacenamiento..."
az storage account create \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2

# Crear plan de App Service (Consumption Plan para serverless)
echo "📋 Creando plan de App Service (Consumption Plan)..."
az appservice plan create \
    --name $APP_SERVICE_PLAN \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Y1 \
    --is-linux
#Nota importante: El SKU Y1 es el Consumption Plan (serverless).
# Crear Function App con .NET
echo "⚡ Creando Function App con .NET..."
az functionapp create \
    --name $FUNCTION_APP_NAME \
    --resource-group $RESOURCE_GROUP \
    --consumption-plan-location $LOCATION \
    --storage-account $STORAGE_ACCOUNT \
    --runtime dotnet \
    --functions-version 4 \
    --os-type Linux

# Configurar variables de entorno
echo "🔧 Configurando variables de entorno..."
az functionapp config appsettings set \
    --name $FUNCTION_APP_NAME \
    --resource-group $RESOURCE_GROUP \
    --settings \
    "FUNCTIONS_WORKER_RUNTIME=dotnet" \
    "WEBSITE_RUN_FROM_PACKAGE=1" \
    "AzureWebJobsStorage=DefaultEndpointsProtocol=https;AccountName=$STORAGE_ACCOUNT;AccountKey=$(az storage account keys list --account-name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --query "[0].value" --output tsv);EndpointSuffix=core.windows.net"

# Crear Function App con Python (ejemplo adicional)
echo "🐍 Creando Function App con Python..."
PYTHON_FUNCTION_APP="funcionapppython$(openssl rand -hex 3)"
az functionapp create \
    --name $PYTHON_FUNCTION_APP \
    --resource-group $RESOURCE_GROUP \
    --consumption-plan-location $LOCATION \
    --storage-account $STORAGE_ACCOUNT \
    --runtime python \
    --functions-version 4 \
    --os-type Linux

# Configurar variables de entorno para Python
az functionapp config appsettings set \
    --name $PYTHON_FUNCTION_APP \
    --resource-group $RESOURCE_GROUP \
    --settings \
    "FUNCTIONS_WORKER_RUNTIME=python" \
    "WEBSITE_RUN_FROM_PACKAGE=1" \
    "AzureWebJobsStorage=DefaultEndpointsProtocol=https;AccountName=$STORAGE_ACCOUNT;AccountKey=$(az storage account keys list --account-name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --query "[0].value" --output tsv);EndpointSuffix=core.windows.net"

# Crear Function App con Node.js (ejemplo adicional)
echo "📦 Creando Function App con Node.js..."
NODE_FUNCTION_APP="funcionappnode$(openssl rand -hex 3)"
az functionapp create \
    --name $NODE_FUNCTION_APP \
    --resource-group $RESOURCE_GROUP \
    --consumption-plan-location $LOCATION \
    --storage-account $STORAGE_ACCOUNT \
    --runtime node \
    --functions-version 4 \
    --os-type Linux

# Configurar variables de entorno para Node.js
az functionapp config appsettings set \
    --name $NODE_FUNCTION_APP \
    --resource-group $RESOURCE_GROUP \
    --settings \
    "FUNCTIONS_WORKER_RUNTIME=node" \
    "WEBSITE_RUN_FROM_PACKAGE=1" \
    "AzureWebJobsStorage=DefaultEndpointsProtocol=https;AccountName=$STORAGE_ACCOUNT;AccountKey=$(az storage account keys list --account-name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --query "[0].value" --output tsv);EndpointSuffix=core.windows.net"

# Mostrar información de las Function Apps creadas
echo "✅ Function Apps creadas exitosamente:"
echo "   - .NET Function App: $FUNCTION_APP_NAME"
echo "   - Python Function App: $PYTHON_FUNCTION_APP"
echo "   - Node.js Function App: $NODE_FUNCTION_APP"
echo "   - Storage Account: $STORAGE_ACCOUNT"
echo "   - Resource Group: $RESOURCE_GROUP"

# Mostrar URLs de las Function Apps
echo ""
echo "🌐 URLs de las Function Apps:"
echo "   .NET: https://$FUNCTION_APP_NAME.azurewebsites.net"
echo "   Python: https://$PYTHON_FUNCTION_APP.azurewebsites.net"
echo "   Node.js: https://$NODE_FUNCTION_APP.azurewebsites.net"

echo ""
echo "📋 Para eliminar todos los recursos:"
echo "   az group delete --name $RESOURCE_GROUP --yes" 

echo ""
echo "📋 Comandos útiles para listar recursos:"
echo ""
echo "🔍 Listar todos los recursos en un grupo de recursos:"
echo "   az resource list --resource-group $RESOURCE_GROUP"
echo ""
echo "🔍 Listar recursos con formato de tabla:"
echo "   az resource list --resource-group $RESOURCE_GROUP --output table"
echo ""
echo "🔍 Listar recursos con formato JSON detallado:"
echo "   az resource list --resource-group $RESOURCE_GROUP --output json"
echo ""
echo "🔍 Listar recursos por tipo específico (ej: Microsoft.Web/sites):"
echo "   az resource list --resource-group $RESOURCE_GROUP --resource-type Microsoft.Web/sites"
echo ""
echo "🔍 Listar recursos con filtro por nombre:"
echo "   az resource list --resource-group $RESOURCE_GROUP --query \"[?contains(name, 'funcionapp')]\""
echo ""
echo "🔍 Listar recursos con información específica (nombre, tipo, ubicación):"
echo "   az resource list --resource-group $RESOURCE_GROUP --query \"[].{Name:name, Type:type, Location:location}\" --output table" 