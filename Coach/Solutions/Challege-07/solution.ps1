# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERJOB="aca-workshop-scheduledjob"

# Deploy a scheduled container job
az containerapp job create `
--name $CONTAINERJOB `
--resource-group $RESOURCE_GROUP  `
--environment $CONTAINERAPPS_ENVIRONMENT `
--trigger-type "Schedule" `
--replica-timeout 1800 `
--image "mcr.microsoft.com/k8se/quickstart-jobs:latest" `
--cpu "0.25" `
--memory "0.5Gi" `
--cron-expression "*/1 * * * *"

#List the recent job execution history
az containerapp job execution list `
    --name $CONTAINERJOB  `
    --resource-group "$RESOURCE_GROUP" `
    --output table `
    --query '[].{Status: properties.status, Name: name, StartTime: properties.startTime}'