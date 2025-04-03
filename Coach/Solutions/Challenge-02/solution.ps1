# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$LOG_ANALYTICS_WORKSPACE="aca-workshop-logs"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-myfirstapp"

# Create Resource Group and Log Analytics Workspace
az group create --name $RESOURCE_GROUP --location $LOCATION
az monitor log-analytics workspace create --resource-group $RESOURCE_GROUP --workspace-name $LOG_ANALYTICS_WORKSPACE

$LOG_ANALYTICS_WORKSPACE_CLIENT_ID = az monitor log-analytics workspace show --query customerId -g $RESOURCE_GROUP -n $LOG_ANALYTICS_WORKSPACE --out tsv
$LOG_ANALYTICS_WORKSPACE_CLIENT_SECRET = az monitor log-analytics workspace get-shared-keys --query primarySharedKey -g $RESOURCE_GROUP -n $LOG_ANALYTICS_WORKSPACE --out tsv

# Create Container Apps Environment
az containerapp env create `
--name $CONTAINERAPPS_ENVIRONMENT `
--resource-group $RESOURCE_GROUP `
--logs-workspace-id $LOG_ANALYTICS_WORKSPACE_CLIENT_ID `
--logs-workspace-key $LOG_ANALYTICS_WORKSPACE_CLIENT_SECRET `
--location "$LOCATION"

# Create your first Container Apps
az containerapp create `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image 'mcr.microsoft.com/k8se/quickstart:latest' `
  --cpu 0.25 `
  --memory '0.5Gi' `
  --target-port 80 `
  --ingress "external" `
  --query 'properties.configuration.ingress.fqdn'
