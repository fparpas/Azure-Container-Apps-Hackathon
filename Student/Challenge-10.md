# Challenge 10 - Publisher and Subscriber Microservices that Leverage the Dapr Pub/Sub API

[< Previous Challenge](./Challenge-09.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-11.md)

## Introduction
Dapr (Distributed Application Runtime) is an open-source, portable runtime that simplifies building microservices by abstracting common patterns such as state management, pub/sub, and service invocation.

In this challenge, you will create publisher and subscriber microservices that leverage the Dapr Pub/Sub API to communicate using messages for event-driven architectures.

![Dapr Pub/Sub](../Resources/Images/pubsub-quickstart.png)

In this challenge, you will do the following:
- Use a **Publisher** microservice that generates and sends messages (such as order checkout events) to a specific topic.
- Use a **Subscriber** microservice that listens for these messages from Azure Service Bus and processes them (e.g., to process orders).
- Deploy the application to Azure Container Apps via the Azure Developer CLI with the provided Bicep template.
- Verify end-to-end messaging by triggering the publisher and confirming that the subscriber receives and processes the messages.

You will use [this sample pub/sub project](https://github.com/Azure-Samples/pubsub-dapr-csharp-servicebus), which includes:
- A message generator checkout service (publisher) that generates messages for a specific topic.
- An order-processor service (subscriber) that listens for messages from the checkout service for a specific topic.

In this sample project, you'll create a publisher microservice and a subscriber microservice to demonstrate how Dapr enables a publish-subscribe pattern. The publisher will generate messages for a specific topic, while subscribers will listen for messages on specific topics.

## Description
- **Configure Dapr for Azure Service Bus Pub/Sub:**  
  - Install all necessary prerequisites.
  - Create or update a Dapr component YAML file that configures Azure Service Bus as the pub/sub broker.
  - The configuration should include the connection string and other required settings for Azure Service Bus.

- **Develop or Use Sample Microservices:**  
  - **Publisher Service:** Implement or use the sample microservice that uses Dapr’s HTTP API to publish messages to a designated topic. For example, the service could send order checkout events.
  - **Subscriber Service:** Implement or use the sample microservice that subscribes to the same topic. The Dapr sidecar will forward published messages from Azure Service Bus to this service for processing.

- **Deployment:**  
  - Package your microservices and deploy them to Azure Container Apps with Dapr enabled.
  OR
  - Use the sample project provided to deploy the application template using the Azure Developer CLI.
  
## Success Criteria
- The publisher microservice successfully publishes messages to the specified topic using Dapr’s API.
- The subscriber microservice receives and processes the messages, with confirmation via logs or telemetry.
- The microservices are deployed to Azure Container Apps with Dapr enabled and properly configured for pub/sub messaging.
- Validate that the entire message flow is handled by Dapr and Azure Service Bus, ensuring reliable event-driven communication.

## Learning Resources
- [Tutorial: Microservices Communication Using Dapr Publish and Subscribe](https://learn.microsoft.com/en-us/azure/container-apps/microservices-dapr-pubsub?tabs=windows&pivots=csharp)
- [Using Dapr with Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/)
- [Getting Started with Dapr](https://docs.dapr.io/getting-started/)
- [GitHub Dapr Quickstarts](https://github.com/dapr/quickstarts)
- [Dapr Quickstarts](https://docs.dapr.io/getting-started/quickstarts/)
