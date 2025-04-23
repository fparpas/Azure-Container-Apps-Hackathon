# Azure Container Apps Hackathon

This hackathon will provide a deep dive experience of building and deploying containerized applications in Azure Container Apps.

Hackathon is a collaborative learning experience, designed as a set of challenges to practice your technical skills. By participating in this hackathon, you will be able to understand the capabilities of Azure Container Apps.

This workshop requires two full days to finish depending on the attendees' skill level. It is a collaborative activity where attendees form teams of 3-5 people to go through every workshop.
  
## Learning Objectives
Upon completing the workshop, participants will be able to:
-	Understand the fundamentals of Azure Container Apps and the benefits of serverless container orchestration.
-	Deploy containerized applications using Azure Container Apps.
-	Configure networking and ingress settings to securely expose container apps to the public internet.
-	Integrate built in observability features.
-	Manage application lifecycle effectively with updates, rollbacks, and revision management.
-	Configure autoscaling and resiliency to ensure high availability.
-	Integrate persistent storage using Azure Files and securely manage configuration with environment variables and secrets.
-	Create event-driven architectures with Dapr Pub/sub API.
- Demonstrating real-time processing and dynamic scaling based on event load with KEDA and Service Bus topics.
-	Establish CI/CD pipelines with GitHub Actions for seamless container app deployments.
- Protect Azure Container Apps with Web Application Firewall on Application Gateway

  
## Prerequisites
-	Familiarity with containerized applications
-	Experience in programming, preferable with C# or Python
-	Your laptop (development machine): Win, MacOS or Linux that you have administrator rights.
-	Active Azure Subscription with Contributor access to create or modify resources.
-	Latest version of Azure CLI
-	Latest version of Visual Studio or Visual Studio Code
-	GitHub account

## Target Audience
The intended audience os ideal for:
- DevOps Engineers
- Software Developers
- Solution Architects

## Training material before attending the workshop
-	(Required) [Implement Azure Container Apps - Training](https://learn.microsoft.com/en-us/training/modules/implement-azure-container-apps/)
-	(Optional) [Deploy cloud-native apps using Azure Container Apps AZ-2003 - Training](https://learn.microsoft.com/en-us/training/paths/deploy-cloud-native-applications-to-azure-container-apps/)

## Challenges

---

### Challenge 0: **[Setup and prepare Evironment](Student/Challenge-00.md)**

Install the required development tools. This initial session is crucial to ensure that all participants are well-prepared and can fully engage with the workshop's content.

### Challenge 1: **[Introduction to Azure Container Apps](Student/Challenge-01.md)**

Overview of Azure Container Apps. A managed, serverless container orchestration service that abstracts away infrastructure concerns.

### Challenge 2: **[Deploy Your First Container App.](Student/Challenge-02.md)**

Deploy your first containerized application by using the Azure CLI or the Portal to deploy a container app from a public registry.

### Challenge 3: **[Application lifecycle management - Updates and Rollbacks.](Student/Challenge-03.md)**

Update a Container App and manage its revisions. Experience deploying a new version of your app while retaining the ability to roll back if necessary.

### Challenge 4: **[Operations and Monitoring](Student/Challenge-04.md)**

When you are building applications, you want to be able to observe the behavior of your services. Observability is the ability to monitor and analyze the internal state of components within a distributed system. It is a key requirement for building enterprise-ready solutions.

### Challenge 5: **[Scaling your application](Student/Challenge-05.md)**

Explore the scaling mechanisms, to ensure resiliency under load. Practice how to manage automatic horizontal scaling through a set of declarative scaling rules.

### Challenge 6: **[Jobs in Azure Container Apps](Student/Challenge-06.md)**

Not every container needs to be a long-running web service. Container Jobs let you run containerized tasks that execute for a finite duration and exit. In this challenge, you will learn how to deploy a container job.

### Challenge 7: **[Data Volumes with Azure Files](Student/Challenge-07.md)**

Many applications requires storage. Azure Container Apps support ephemeral storage and mounting Azure Files as persistent storage data volumes. In this challenge, you will enable persistent storage for your containerized app.

### Challenge 8: **[Adding Environment Variables and Secrets](Student/Challenge-08.md)**

Securely setting configuration values is key to robust applications. You will learn how to pass environment variables and manage secrets in your container apps, reducing hard-coded configurations.

### Challenge 9: **[Implementing CI/CD with GitHub Actions](Student/Challenge-09.md)**

To achieve agile development, it is essential to automate your builds and deployments. In this challenge, you will create a GitHub Actions workflow that automatically builds and deploys your container app upon code changes.

### Challenge 10: **[Publisher and subscriber microservices that leverage the Dapr Pub/sub API](Student/Challenge-10.md)**

Dapr (Distributed Application Runtime) is an open-source, portable runtime that simplifies building microservices by abstracting common patterns such as state management, pub/sub, and service invocation. In this challenge, you will create publisher and subscriber microservices that leverage the Dapr Pub/sub API to communicate using messages for event-driven architectures. 

### Challenge 11: **[Implement an Event-Driven App with Dapr and KEDA](Student/Challenge-11.md)**

Capitalize on the event-driven architecture of Azure Container Apps by integrating KEDA (Kubernetes-based Event Driven Autoscaling) with Azure Service Bus. In this challenge, you’ll modify the previous checkout and processor application that responds to message queues, demonstrating real-time processing and dynamic scaling based on event load.

### (Optional) Challenge 12: **[Protect Azure Container Apps with WAF on Application Gateway](Student/Challenge-12.md)**

Enhance your container apps’ security by integrating a Web Application Firewall on an Application Gateway. In this challenge, you will also provide a Virtual Network for your Container Apps environment to securely isolate and control network traffic.

## References
- [Azure Container Apps documentation](https://learn.microsoft.com/en-us/azure/container-apps/)

## Repository Contents

- `./Student`
  - Student's Challenge Guide
- `./Student/Resources`
  - Resource files, sample code, scripts, etc meant to be provided to students. (Must be packaged up by the coach and provided to students at start of event)
- `./Coach`
  - Coach's Guide and related files
- `./Coach/Solutions`
  - Solution files with completed example answers to a challenge

## Remarks
- Please note that the content of this workshop may become outdated, as Azure Container Apps is an evolving platform. We recommend staying engaged with the community for the most current updates and practices.
    
## Contributors
- Phanis Parpas
