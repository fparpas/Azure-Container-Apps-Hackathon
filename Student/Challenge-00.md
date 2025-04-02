# Challenge 00 - Setup and prepare Evironment

**[Home](../README.md)** - [Next Challenge >](./Challenge-01.md)

## Pre-requisites

- Your laptop (development machine): Win, MacOS or Linux that you have **administrator rights**.
- Active Azure Subscription with **Contributor access** to create or modify resources.
- Latest version of Azure CLI
- Latest version of Visual Studio or Visual Studio Code
- GitHub account
- .NET 9.0 SDK or later version

## Introduction

Before diving into container orchestration, you must prepare your development environment. In this challenge, you will install the necessary tools (Azure CLI, Docker, Visual Studio Code) and configure your Azure subscription.

## Description

Setup and configure the following tools

- Use your active Azure Subscription or the one provided.
- Log into the [Azure Portal](https://portal.azure.com) and confirm that you have an active subscription that you can deploy cloud services.
- Use the latest version of [Visual Studio](https://visualstudio.microsoft.com) or [Visual Studio Code](https://code.visualstudio.com) if you don't have it.
- Install .NET 9.0 SDK or later version
- Clone the GitHub repository onto your workstation.
- Install the latest version of [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Install or update the Azure Container Apps extension for the CLI

    ```bash
    az extension add --name containerapp --upgrade
    ```

- Register the Microsoft.App and Microsoft.OperationalInsights providers

    ```bash
    az provider register --namespace Microsoft.App
    az provider register --namespace Microsoft.OperationalInsights
    ```

## Success Criteria

- You should be able to log in to the Azure Portal.
- You have a bash shell or PowerShell at your disposal (you can also use Azure Cloud Shell)
- Running az --version shows the version of your Azure CLI
- Visual Studio or Visual Studio Code is installed.
- Ensure that the ACA extension is installed and the Microsoft.App and Microsoft.OperationalInsights providers are registered.
- Ensure that you clone the GitHub repository onto your workstation.
