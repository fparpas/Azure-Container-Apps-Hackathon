# Challenge 12 - Implement an Event-Driven App with KEDA & RabbitMQ

## Introduction
Capitalize on the event-driven architecture of Azure Container Apps by integrating KEDA (Kubernetes-based Event Driven Autoscaling) with RabbitMQ. In this final challenge, you’ll build an application that responds to message queues, demonstrating real-time processing and dynamic scaling based on event load.

## Description
- Deploy RabbitMQ (locally or using Azure Marketplace) to simulate an event bus.
- Integrate KEDA with your Container App to auto-scale based on RabbitMQ queue length.
- Develop a simple event-driven application that processes messages from the queue and logs the events accordingly.

## Success Criteria
- RabbitMQ is deployed and publishing events.
- KEDA is configured to scale your Container App based on real-time queue metrics.
- The application processes events and logs output as expected.

## Learning Resources
