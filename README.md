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
-	Enhance microservices using patterns like Dapr for service invocation and develop event-driven architectures with KEDA.
-	Establish CI/CD pipelines with GitHub Actions for seamless container app deployments.

  
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

- Install the required development tools. This initial session is crucial to ensure that all participants are well-prepared and can fully engage with the workshop's content.

### Challenge 1: **[Introduction to Azure Container Apps](Student/Challenge-01.md)**

- Overview of Azure Container Apps. A managed, serverless container orchestration service that abstracts away infrastructure concerns.

### Challenge 2: **[Deploy Your First Container App.](Student/Challenge-02.md)**

- Deploy your first containerized application by using the Azure CLI or the Portal to deploy a container app from a public registry.

### Challenge 3: **[Application lifecycle management - Updates and Rollbacks.](Student/Challenge-03.md)**

- Update a Container App and manage its revisions. Experience deploying a new version of your app while retaining the ability to roll back if necessary.

### Challenge 4: **[Operations and Monitoring](Student/Challenge-04.md)**

- When you are building applications, you want to be able to observe the behavior of your services. Observability is the ability to monitor and analyze the internal state of components within a distributed system. It is a key requirement for building enterprise-ready solutions.

### Challenge 5: **[Scaling your application](Student/Challenge-05.md)**

- Explore the scaling mechanisms, to ensure resiliency under load. Practice hoe to manage automatic horizontal scaling through a set of declarative scaling rules.

### Challenge 6: **[Header](Student/Challenge-06.md)**

- Description

### (Optional) Challenge 7: **[Header](Student/Challenge-07.md)**

- Description

### Challenge 8: **[Header](Student/Challenge-08.md)**

- Description

### Challenge 9: **[Header](Student/Challenge-09.md)**

- Description

### Challenge 10: **[Header](Student/Challenge-10.md)**

- Description

### Challenge 11: **[Header](Student/Challenge-10.md)**

- Description

### Challenge 12: **[Header](Student/Challenge-10.md)**

- Description

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
