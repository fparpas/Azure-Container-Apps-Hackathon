# Challenge 06 - Jobs in Azure Container Apps

 [< Previous Challenge](./Challenge-05.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-07.md)

## Introduction
Not every container needs to be a long-running web service. Container Jobs let you run containerized tasks that execute for a finite duration and then exit. In this challenge, you will learn how to deploy a container job.

You can use jobs to perform tasks such as data processing, machine learning, or any scenario where on-demand processing is required.

Azure Container Apps provide two types of compute resources: apps and jobs. Apps run continuously and restart automatically if a container fails, making them suitable for HTTP APIs, web apps, and background services. Jobs run for a finite duration, handling a single unit of work, and can be started manually, scheduled, or triggered by events, making them ideal for batch processes and scheduled tasks.

### Job trigger types
A job's trigger type determines how the job is started. The following trigger types are available:
- **Manual**: Manual jobs are triggered on-demand.
- **Schedule**: Scheduled jobs are triggered at specific times and can run repeatedly.
- **Event**: Events, such as a message arriving in a queue, trigger event-driven jobs. Examples of event-driven jobs include:
    - A job that runs when a new message is added to a queue, such as Azure Service Bus, Kafka, or RabbitMQ.
    - A self-hosted GitHub Actions runner or Azure DevOps agent that runs when a new job is queued in a workflow or pipeline.

    Container apps and event-driven jobs use KEDA scalers. They both evaluate scaling rules on a polling interval to measure the volume of events for an event source, but the way they use the results is different.

    In an app, each replica continuously processes events, and a scaling rule determines the number of replicas to run to meet demand. In event-driven jobs, each job execution typically processes a single event, and a scaling rule determines the number of job executions to run.

> [!TIP]
> Use jobs when each event requires a new instance of the container with dedicated resources or needs to run for a long time. Event-driven jobs are conceptually similar to KEDA scaling jobs.

## Description
- Create a scheduled job that runs every 1 minute using the public image `mcr.microsoft.com/k8se/quickstart-jobs:latest`. 
- This container image is a public sample container image that runs a job, waits a few seconds, prints a message to the console, and then exits.
- Check the scheduled job's output and status.
- Trigger the scheduled task manually.

## Success Criteria
- Verify that the job is successfully scheduled and executed in the execution history.
- Ensure the task completes and its console output is verifiable.
- Manually trigger the scheduled task and verify its execution and output.
- Use the Azure CLI to list the recent job execution history.

## Learning Resources
- [Jobs in Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/jobs)
- [Tutorial: Deploy an event-driven job with Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/tutorial-event-driven-jobs)
