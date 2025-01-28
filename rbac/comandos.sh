#!/bin/bash

# Agrega un rol de contribuidor global
az ad sp create-for-rbac -n ContribuidoresGlobales --role Contributor --scopes /subscriptions/30a83aff-7a8b-4ca3-aa48-ab93268b5a8b

# Agega dos grupos de recursos
az group create -l eastus2 -n GrupoRecursosContribuidores

az group create -l eastus2 -n GrupoRecursosLectores

# Agrega un rol de contribuido a un grupo de recursos
az ad sp create-for-rbac -n ContribuidoresGrupales --role Contributor --scopes /subscriptions/30a83aff-7a8b-4ca3-aa48-ab93268b5a8b/resourceGroups/GrupoRecursosContribuidores

# Agrega un rol de lectura a un grupo de recursos
az ad sp create-for-rbac -n LectoresGrupales --role Reader --scopes /subscriptions/30a83aff-7a8b-4ca3-aa48-ab93268b5a8b/resourceGroups/GrupoRecursosLectores

# Ingresa a la CLI de Azure usando RBAC
az login --service-principal 
--username 2290c808-fd3f-4971-b113-b0d030a48509 
--password xTh8Q~H2babrDEC_O-G0~F84gbaypP4mGId0Ddib 
--tenant 0fe86da7-ca5d-4cc6-8c3c-a91b0c4b50ba

az ad sp delete --id APP_ID

# Elimina los grupos de recursos
az group delete -n GrupoRecursosContribuidores
az group delete -n GrupoRecursosLectores