# Challenge 10 - Implementing CI/CD with GitHub Actions

## Introduction
To achieve agile development, it is essential to automate your builds and deployments. In this challenge, you will create a GitHub Actions workflow that automatically builds and deploys your container app upon code changes.

Azure Container Apps allows you to use GitHub Actions to publish revisions to your container app. As commits are pushed to your GitHub repository, a workflow is triggered which updates the container image in the container registry. Azure Container Apps creates a new revision based on the updated container image.

![CI/CD Diagram](./Resources/Challenge-10/cicd-diagram.png)

The GitHub Actions workflow is triggered by commits to a specific branch in your repository. When creating the workflow, you decide which branch triggers the workflow.

The action supports the following scenarios:
- Build from a Dockerfile and deploy to Container Apps
- Build from source code without a Dockerfile and deploy to Container Apps. Supported languages include .NET, Java, - Node.js, PHP, and Python
- Deploy an existing container image to Container Apps

### Build and deploy to Container Apps
The following snippet shows how to build a container image from source code and deploy it to Container Apps.
```yaml
name: Azure Container Apps Deploy

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Log in to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}

      - name: Build and deploy Container App
        uses: azure/container-apps-deploy-action@v1
        with:
          appSourcePath: ${{ github.workspace }}/src
          acrName: <ACR_NAME>
          containerAppName: my-container-app
          resourceGroup: my-container-app-rg
```
## Description
- Configure secrets in your GitHub repository
- Create an Azure Container Registry and manage access accordingly
- Create a GitHub Actions workflow file in your repository.
- Configure the workflow to build your container image and deploy it to Azure Container Apps.
- Test the workflow by pushing a code change and verifying a new deployment.

## Success Criteria
- A GitHub Actions pipeline is established.
- Code changes automatically trigger a build and deployment.
- The container app updates seamlessly based on the CI/CD process.

## Learning Resources
- [GitHub Actions for Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/github-actions)
- [Introduction to GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions)
- [Azure Container Apps Build and Deploy action](https://github.com/marketplace/actions/azure-container-apps-build-and-deploy)