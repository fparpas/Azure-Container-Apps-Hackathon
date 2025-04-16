# Challenge 08 - Data Volumes with Azure Files

 [< Previous Challenge](./Challenge-07.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-09.md)

## Introduction
Many applications requires storage. Azure Container Apps support ephemeral storage and mounting Azure Files as data volumes. In this challenge, you will enable persistent storage for your containerized app.

A container app has access to different types of storage.

### Ephemeral storage
A container app can utilize ephemeral storage for temporary data. This storage can be assigned either to a container or a replica. The total amount of storage available to each replica is determined by the number of vCPUs allocated to it.
#### Container-scoped storage
A container can write to its own file system.
Container file system storage has the following characteristics:
- The storage is temporary and disappears when the container is shut down or restarted.
- Files written to this storage are only visible to processes running in the current container.

#### Replica-scoped storage
You can mount an ephemeral, temporary volume that is equivalent to EmptyDir (empty directory) in Kubernetes. This storage is scoped to a single replica. 
- Files are persisted for the lifetime of the replica. If a container in a replica restarts, the files in the volume remain.
- Any init or app containers in the replica can mount the same volume.
- A container can mount multiple EmptyDir volumes.

### Azure Files volume
You can mount a file share from Azure Files as a volume in a container.
Azure Files storage has the following characteristics:
- Files written under the mount location are persisted to the file share.
- Files in the share are available via the mount location.
- Multiple containers can mount the same file share, including ones that are in another replica, revision, or container app.
- All containers that mount the share can access files written by any other container or method.
- More than one Azure Files volume can be mounted in a single container.
Replica-scoped storage has the following characteristics:

## Description
- Set up a storage account with the following parameters:
    - Kind: StorageV2
    - SKU: Standard_LRS
    - Enable large file share
- Create a publicly available container app with nginx image and set taRGET PORT TO PORT 80.
- Mount the file share as a volume in your container app.
    - Export the container app's configuration in yaml format
    - Replace the volumes: definition in the template section with the volumes: definition referencing the storage volume.
    - Add a volumeMounts section to the nginx container in the containers section.
- Demonstrate persistence by writing data to the volume and showing it persists across container restarts.
- Open an interactive shell inside the container app to execute commands inside the running container. List the values of the /var/log/nginx folder
``` powershell
az containerapp exec --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP
```

## Success Criteria
- The Azure File share is successfully mounted.
- Data written by your container app persists after restarts.
- Verify the storage mount by executing a ls command in /var/log/nginx folder inside the running container.

## Learning Resources
- [Use storage mounts in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts?tabs=smb&pivots=azure-cli)
- [Tutorial: Create an Azure Files volume mount in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash)
