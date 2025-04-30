# Challenge 07 - Data Volumes with Azure Files

 [< Previous Challenge](./Challenge-06.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-08.md)

## Introduction
Many applications require storage. Azure Container Apps support ephemeral storage and mounting Azure Files as data volumes. In this challenge, you will learn how to enable persistent storage for your containerized app.

A container app has access to different types of storage.

### Ephemeral Storage
Container apps can utilize ephemeral storage for temporary data. This storage can be assigned to either a container or a replica. The total amount of storage available to each replica is determined by the number of vCPUs allocated to it.

#### Container-Scoped Storage
A container can write to its own file system. Container file system storage has the following characteristics:
- The storage is temporary and disappears when the container is shut down or restarted.
- Files written to this storage are only visible to processes running in the current container.

#### Replica-Scoped Storage
You can mount an ephemeral, temporary volume that is equivalent to EmptyDir (empty directory) in Kubernetes. This storage is scoped to a single replica.

Replica-scoped storage has the following characteristics:
- Files persist for the lifetime of the replica. If a container within a replica restarts, the files in the volume remain.
- Any init or app containers in the replica can mount the same volume.
- A container can mount multiple EmptyDir volumes.

### Azure Files Volume
You can mount a file share from Azure Files as a volume in a container. Azure Files storage has the following characteristics:
- Files written to the mount location persist in the file share.
- Files in the share are accessible through the mount location.
- Multiple containers can mount the same file share, including ones that are in another replica, revision, or container app.
- All containers that mount the share can access files written by any other container or method.
- More than one Azure Files volume can be mounted in a single container.

## Description
- Set up a storage account with the following parameters:
    - Kind: StorageV2
    - SKU: Standard_LRS
    - Enable large file share
- Create a publicly available container app with the `nginx` image and set the target port to port 80.
- Mount the file share as a volume in your container app.
    - Export the container app's configuration in YAML format.
    - Replace the `volumes:` definition in the template section with the `volumes:` definition referencing the storage volume.
    - Add a `volumeMounts` section to the Nginx container in the `containers` section.
- Demonstrate persistence by writing data to the volume and showing it persists across container restarts.
- Open an interactive shell inside the container app to execute commands inside the running container. List the values of the `/var/log/nginx` folder:
    ```powershell
    az containerapp exec --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP
    ```

## Success Criteria
- The Azure File share is successfully mounted.
- Data written by your container app persists after restarts.
- Verify the storage mount by executing an `ls` command in the `/var/log/nginx` folder inside the running container.

## Learning Resources
- [Use storage mounts in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts?tabs=smb&pivots=azure-cli)
- [Tutorial: Create an Azure Files volume mount in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/storage-mounts-azure-files?tabs=bash)
