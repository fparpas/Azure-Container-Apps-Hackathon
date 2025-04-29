# Challenge 02 - Deploy Your First Container App

 [< Previous Challenge](./Challenge-01.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-03.md)
 
## Introduction
Now that you understand the core concepts, it’s time to deploy your first containerized application. In this challenge, you will use either the Azure CLI or the Portal to deploy a container app from a public registry. Watch how the service abstracts infrastructure management so you can focus on app logic.

You have several options available as you develop and deploy your apps to Azure Container Apps. Depending on your situation, you might want to deploy from a code editor, through the Azure portal, with a hosted code repository, or via infrastructure as code. 


## Description
- Deploy a Container App using the public image: mcr.microsoft.com/k8se/quickstart:latest and set target port to port 80
- Choose one of the following methods for your first deployment
    - Using the Azure Portal
    - Using Azure CLI -> az containerapp up
    - Using Azure CLI -> az containerapp create
- The application should be publicly available
- Use the Azure CLI or Portal to configure basic settings (such as CPU and memory).

## Success Criteria
- The container app is deployed and running.
- You can access the deployed application via a public URL.
- Explain the differences of the three deployment options mentioned above

## Learning Resources
- [Quickstart: Deploy your first container app using the Azure portal](https://learn.microsoft.com/en-us/azure/container-apps/quickstart-portal)
- [Quickstart: Deploy your first container app with az containerapp up](https://learn.microsoft.com/en-us/azure/container-apps/get-started?tabs=bash)
- [Tutorial: Deploy your first container app with az containerapp create](https://learn.microsoft.com/en-us/azure/container-apps/tutorial-deploy-first-app-cli?tabs=bash)
- [Azure CLI for Container Apps](https://learn.microsoft.com/en-us/cli/azure/containerapp)
