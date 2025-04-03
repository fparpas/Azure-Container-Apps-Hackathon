# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$LOG_ANALYTICS_WORKSPACE="aca-workshop-logs"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-myfirstapp"

# Set revision mode to multiple revisions (available options are single and multiple)
az containerapp revision set-mode `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --mode 'multiple'

# Update the container image
az containerapp update `
--name $CONTAINERAPP `
--resource-group $RESOURCE_GROUP `
--image 'mavilleg/acarevision-helloworld:acarevision-hellowold'

# Get the containerapp revision list
az containerapp revision list `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --all `
  -o table

# Get the container app revision
az containerapp revision show `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --revision '<REVISION_NAME>'

  #Add revision label
  az containerapp revision label add `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --revision '<REVISION_NAME>' `
  --label '<LABEL_NAME>'

  # Set traffic splitting between revisions
az containerapp ingress traffic set `
    --name $CONTAINERAPP `
    --resource-group $RESOURCE_GROUP `
    --revision-weight <REVISION_1>=50 <REVISION_2>=50

# Set traffic splitting between revisions with revision labels
az containerapp ingress traffic set  `
--name $CONTAINERAPP `
--resource-group $RESOURCE_GROUP `
--label-weight <LABEL_1>=80 <LABEL_2>=20