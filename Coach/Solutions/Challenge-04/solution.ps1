# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$LOG_ANALYTICS_WORKSPACE="aca-workshop-logs"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-myfirstapp"

# View Container app logs. (type options are system or console.)
# Use follow to stream logs in real time, or tail to view the last 50 lines of logs.
az containerapp logs show `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --type console `
  --tail 50

  #Connect to a container's console log stream in a container app with multiple revisions, replicas, and containers
  az containerapp logs show `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --revision '<REVISION_NAME>' `
  --replica '<REPLICA_NAME>' `
  --container '<CONTAINER_NAME>' `
  --type system `
  --tail 50

  
# View environment system logs. (type options are system or console.)
# Use follow to stream logs in real time, or tail to view the last 50 lines of logs.
az containerapp env logs show `
  --name $CONTAINERAPPS_ENVIRONMENT `
  --resource-group $RESOURCE_GROUP `
  --type system `
  --follow