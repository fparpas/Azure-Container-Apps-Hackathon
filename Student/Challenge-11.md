# Challenge 06 - Dapr and Service Invocation

## Introduction
Dapr (Distributed Application Runtime) is an open-source, portable runtime that simplifies building microservices by abstracting common patterns such as state management, pub/sub, and service invocation. In this challenge, you will integrate Dapr into your containerized applications to enable secure and reliable service-to-service communication. By leveraging Dapr’s service invocation building block, you'll learn how to offload common communication logic from your application code, making your microservices more resilient and easier to manage.

## Description
- **Set Up Dapr:**  
  - Deploy your container app with Dapr enabled. This involves modifying your deployment configuration to include the Dapr sidecar.
- **Implement Service Invocation:**  
  - Create two microservices: a caller and a callee. The callee should expose an endpoint (e.g., `/process`) that the caller can invoke.
  - Configure your caller service to use Dapr’s HTTP service invocation API (e.g., `http://localhost:<daprPort>/v1.0/invoke/<callee-app-id>/method/process`) to call the callee endpoint.
- **Testing and Verification:**  
  - Verify that the service invocation works as expected by triggering the caller service, which should in turn successfully invoke the callee’s endpoint.
  - Monitor the logs to see the invocation trace and confirm that Dapr has correctly routed the request between services.

## Success Criteria
- Dapr is properly enabled for your container app.
- The caller service can successfully invoke the callee’s endpoint using Dapr’s service invocation API.
- Logs confirm that requests are being routed through Dapr, and the expected responses are received.
- You document any configuration changes (e.g., Dapr annotations) made to enable the sidecar and service invocation.

## Learning Resources
- [Dapr Service Invocation](https://docs.dapr.io/developing-applications/building-blocks/service-invocation/)
- [Getting Started with Dapr](https://docs.dapr.io/getting-started/)
- [Using Dapr with Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/)