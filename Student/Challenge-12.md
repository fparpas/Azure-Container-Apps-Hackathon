# Challenge 12 - Implement an Event-Driven App with KEDA & RabbitMQ

 [< Previous Challenge](./Challenge-12.md) - **[Home](../README.md)**

## Introduction
Capitalize on the event-driven architecture of Azure Container Apps by integrating KEDA (Kubernetes-based Event Driven Autoscaling) with Azure Service Bus. In this challenge, you’ll modify the previous checkout and processor application that responds to message queues, demonstrating real-time processing and dynamic scaling based on event load.

Azure Container Apps automatically scales HTTP traffic to zero. However, to scale non-HTTP traffic (like Dapr pub/sub and bindings), you can use KEDA scalers to scale your application and its Dapr sidecar up and down, based on the number of pending inbound events and messages.

This guide demonstrates how to configure the scale rules of a Dapr pub/sub application with a KEDA messaging scaler. 

For context, refer to the corresponding sample pub/sub applications. In this sample application, the application uses the following elements:

- The checkout publisher is an application that is meant to run indefinitely and never scale down to zero, despite never receiving any incoming HTTP traffic.
- The Dapr Azure Service Bus pub/sub component.
- An order-processor subscriber container app picks up messages received via the orders topic and processed as they arrive.
- The scale rule for Azure Service Bus, which is responsible for scaling up the order-processor service and its Dapr sidecar when messages start to arrive to the orders topic.
![Scaling Dapr with KEDA](Resources/Challenge-12/scaling-dapr-apps-keda.png)


## Description
- Make all necessary changes to order-processor subscriber app to include a custom scale rule that monitors a resource of type azure-servicebus. With this rule, the app (and its sidecar) scales up and down as needed based on the number of pending messages in the Bus.
- Configure the app to scale from 0 to 10 replicas
- Configure the messageCount property on the scaler's configuration in the subscriber app to 2. This property tells the scaler how many messages each instance of the application can process at the same time.
- For KEDA scaler authentication parameters use the Container Apps secrets for accessing the Service Bus.

>[!NOTE]
> Container Apps scale rules support secrets-based authentication. Scale rules for Azure resources, including Azure Queue Storage, Azure Service Bus, and Azure Event Hubs, also support managed identity. In production environments it's preferred to use managed identity authentication to avoid storing secrets within the app.

## Success Criteria
- The order-processor subscriber container app can consume events added in Service Bus topic.
- KEDA is configured to scale your Container App based on real-time topic metrics.
- The application processes events and logs output as expected.

## Learning Resources

- [Scale Dapr applications with KEDA scalers](https://learn.microsoft.com/en-us/azure/container-apps/dapr-keda-scaling)
- [Set scaling rules in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/scale-app?pivots=azure-portal#custom)
- [KEDA Overview ](https://keda.sh/)
- [KEDA Azure Service Bus scaler ](https://keda.sh/docs/2.17/scalers/azure-service-bus/)
- [KEDA Scalers](https://keda.sh/docs/2.17/scalers/)