# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-datavolumes"

$STORAGE_ACCOUNT_NAME="acawstorageaccount$(Get-Random -Maximum 10000)"
$STORAGE_SHARE_NAME="acawfileshare"
$STORAGE_MOUNT_NAME="acastoragemount"

# Create Azure Storage Account for the container app
az storage account create `
  --resource-group $RESOURCE_GROUP `
  --name $STORAGE_ACCOUNT_NAME `
  --location "$LOCATION" `
  --kind StorageV2 `
  --sku Standard_LRS `
  --enable-large-file-share `
  --query provisioningState

# Create the Azure Storage file share.
az storage share-rm create `
  --resource-group $RESOURCE_GROUP `
  --storage-account $STORAGE_ACCOUNT_NAME `
  --name $STORAGE_SHARE_NAME `
  --quota 1024 `
  --enabled-protocols SMB `
  --output table

# Get the storage account key.
$STORAGE_ACCOUNT_KEY=$(az storage account keys list -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP --query "[0].value" -o tsv)

# Create the storage mount
az containerapp env storage set `
  --access-mode ReadWrite `
  --azure-file-account-name $STORAGE_ACCOUNT_NAME `
  --azure-file-account-key $STORAGE_ACCOUNT_KEY `
  --azure-file-share-name $STORAGE_SHARE_NAME `
  --storage-name $STORAGE_MOUNT_NAME `
  --name $CONTAINERAPPS_ENVIRONMENT `
  --resource-group $RESOURCE_GROUP `
  --output table

  # Create the container app.
  az containerapp create `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image nginx `
  --min-replicas 1 `
  --max-replicas 1 `
  --target-port 80 `
  --ingress external `
  --query properties.configuration.ingress.fqdn

# Export the container app's configuration in yaml format
az containerapp show --name $CONTAINERAPP --resource-group $RESOURCE_GROUP --output yaml > app.yaml

# Open app.yaml in a code editor
# Replace the volumes: null definition in the template section with a volumes: definition referencing the storage volume. 
# The template section should look like the following:
  template:
  containers:
  - image: nginx
    name: aca-workshop-datavolumes
    resources:
      cpu: 0.5
      ephemeralStorage: 2Gi
      memory: 1Gi
    volumeMounts:
    - volumeName: aca-file-volume
      mountPath: /var/log/nginx
  initContainers: null
  revisionSuffix: ''
  scale:
    maxReplicas: 1
    minReplicas: 1
    rules: null
  serviceBinds: null
  terminationGracePeriodSeconds: null
  volumes: 
  - name: aca-file-volume
    storageName: acastoragemount
    storageType: AzureFile

# Update the container app with the new storage mount configuration.
az containerapp update `
    --name $CONTAINERAPP `
    --resource-group $RESOURCE_GROUP `
    --yaml app.yaml --output table

# Verify the storage mount
# (1).Open an interactive shell inside the container app to execute commands inside the running container.
az containerapp exec --name $CONTAINERAPP --resource-group $RESOURCE_GROUP

# (2).Change into the nginx /var/log/nginx folder.
cd /var/log/nginx

# (3). Return to the browser and navigate to the website and refresh the page a few times.
# The requests made to the website create a series of log stream entries

# (4). Return to your terminal and list the values of the /var/log/nginx folder.
# Note how the access.log and error.log files appear in this folder. These files are written to the Azure Files mount in your Azure Storage share created in the previous steps.
ls

# (5). View the contents of the access.log file.
cat access.log

# (6). Exit the container app shell.
exit

# (7). Return to the Azure portal and navigate to the Storage account created in the previous steps.
# Select the File shares option in the left-hand menu and select the file share created in the previous steps.