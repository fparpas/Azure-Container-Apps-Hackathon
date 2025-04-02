# Challenge 08 - Data Volumes with Azure Files

## Introduction
Many applications require persistent storage. Azure Container Apps support mounting Azure Files as data volumes. In this challenge, you will enable persistent storage for your containerized app.

## Description
- Create an Azure Files share.
- Mount the file share as a volume in your container app.
- Demonstrate persistence by writing data to the volume and showing it persists across container restarts.

## Success Criteria
- The Azure File share is successfully mounted.
- Data written by your container app persists after restarts.

## Learning Resources
- [Using Azure Files with Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/using-vnet#mounting-azure-files)
- [Azure Files documentation](https://learn.microsoft.com/en-us/azure/storage/files/)
