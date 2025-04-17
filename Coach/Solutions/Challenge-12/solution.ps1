# Define variables
$RESOURCE_GROUP="<Add here the resource group name>"
$LOCATION="<Add here the location>"
$CONTAINERAPPS_ENVIRONMENT="<Add here the container apps environment name>"
$CONTAINERAPP_CHECKOUT="<Add here the checkout container app name>"
$CONTAINERAPP_ORDERS="<Add here the orders container app name>"

# Configure an existing app by adding a secret with a Service Bus connection string reference
az containerapp secret set -n $CONTAINERAPP -g $RESOURCE_GROUP --secrets "sb-connectionstring=<add here the connection string>"

# Export the container app's configuration in yaml format
az containerapp show --name $CONTAINERAPP_ORDERS --resource-group $RESOURCE_GROUP --output yaml > app.yaml

# Open app.yaml in a code editor
# Add KEDA scaler configuration to the yaml file
# The template section should look like the following:
template:
  scale:
    maxReplicas: 10
    minReplicas: 0
    rules: 
    - name: 'topic-based-scaling'
      custom: 
          type: 'azure-servicebus'
          auth:
          - secretRef: "sb-connectionstring"
            triggerParameter: "connection"
          metadata: 
            topicName: 'orders'
            subscriptionName: 'orders'
            messageCount: '2'

# Update the container app with the custom KEDA scaler configuration.
az containerapp update `
    --name $CONTAINERAPP_ORDERS `
    --resource-group $RESOURCE_GROUP `
    --yaml app.yaml --output table
