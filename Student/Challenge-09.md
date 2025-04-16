# Challenge 09 - Adding Environment Variables and Secrets

 [< Previous Challenge](./Challenge-08.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-10.md)

## Introduction
Securely setting configuration values is key to robust applications. You will learn how to pass environment variables and manage secrets in your container apps, reducing hard-coded configurations.

### Environmental Variables
In Azure Container Apps, you're able to set runtime environment variables. These variables can be set as manually entries or as references to secrets. These environment variables are loaded onto your Container App during runtime.

You can configure the Environment Variables upon the creation of the Container App or later by creating a new revision.

### Secrets

Azure Container Apps allows your application to securely store sensitive configuration values. Once secrets are defined at the application level, secured values are available to revisions in your container apps. Secrets has the following characteristics:
- Secrets are scoped to an application, outside of any specific revision of an application.
- New revisions don't get generated through adding, removing, or changing secrets.
- Each application revision can reference one or more secrets.
- Multiple revisions can reference the same secret(s).

#### Defining secrets
Secrets are defined as a set of name/value pairs. The value of each secret is stored directly in the container app or as a reference to a secret stored in Azure Key Vault.

> [!NOTE]
> Avoid specifying the value of a secret directly in a production environment. Instead, use a reference to a secret stored in Azure Key Vault, as described in the Store secret value in Container Apps section.

#### Referencing secrets in environment variables
After declaring secrets at the application level as described above, you can reference them in environment variables when you create a new revision in your container app. When an environment variable references a secret, its value is populated with the value defined in the secret.

#### Mounting secrets in a volume
After declaring secrets at the application level as described in the defining secrets section, you can reference them in volume mounts when you create a new revision in your container app. When you mount secrets in a volume, each secret is mounted as a file in the volume. 

## Description
- Deploy a Container App using the public image: mcr.microsoft.com/k8se/quickstart:latest and set target port to port 80 or use an existing app already deployed. Configure your container app to include an environmental variable with Key: MY_ENVIRONMENTAL_VARIABLE and set the value to "Test".
- Open an interactive shell inside the container app and execute the 'env' command inside the running container to view the environmental variable you craeted above and the built-in one 'CONTAINER_APP_NAME'.
``` powershell
az containerapp exec --name $CONTAINER_APP --resource-group $RESOURCE_GROUP
```
- Store in container app "my-custom-secret" secret with the secret value "ThisIsAPassword".
- Reference the secret "my-custom-secret" in "MY_CUSTOM_SECRET_ENV_VAR" environment variable
- Create and configure Key Vault to store secrets. Add "my-custom-keyvault-secret" in key vault with value "ThisIsAKeyVaultPassword" and reference it in the container as an environmental variable with name "MY_CUSTOM_SECRET_KAYVAULT_ENV_VAR".
> [!NOTE]
> To reference a secret from Key Vault, you must first enable managed identity in your container app and grant the identity access to the Key Vault secrets with "Key Vault Secrets User" role. 
- Reference the "my-custom-keyvault-secret" secret from the Key vault and mount it as a volume.

## Success Criteria
- Environment variables and secrets are correctly injected.
- Check the value of the following by executing the 'env' command within the container.
    - The custom MY_ENVIRONMENTAL_VARIABLE
    - The built-in one CONTAINER_APP_NAME environmental variables by executing the 'env' command within the container.
    - The custom secret stored in MY_CUSTOM_SECRET_ENV_VAR env variable
    - The custom secret referenced in key vault and stored in MY_CUSTOM_SECRET_KAYVAULT_ENV_VAR env variable
- Check the value of the secret in the mounted volume within the container.
- Explain to your coach what are the Built-in environment variables

## Learning Resources
- [Manage environment variables on Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/environment-variables)
- [Manage secrets in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/manage-secrets)
