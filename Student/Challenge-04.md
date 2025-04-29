# Challenge 04 - Operations and Monitoring

[< Previous Challenge](./Challenge-03.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-05.md)

## Introduction
Running a containerized app in production requires effective monitoring. In this challenge, you’ll integrate observability features into your Container App. Learn to configure logging, set up alerts, and use Application Insights to monitor performance and troubleshoot issues.

Azure Container Apps (ACA) provides several built-in observability features that together give you a holistic view of your container app’s health throughout its application lifecycle. These features help you monitor and diagnose the state of your app to improve performance and respond to trends and critical problems.

| **Feature**                 | **Description**                                                                 |
|-----------------------------|---------------------------------------------------------------------------------|
| [**Log streaming**](https://learn.microsoft.com/en-us/azure/container-apps/log-streaming)           | View streaming system and console logs from a container in near real-time.      |
| [**Container console**](https://learn.microsoft.com/en-us/azure/container-apps/container-console)       | Connect to the Linux console in your containers to debug your application from inside the container. |
| [**Azure Monitor metrics**](https://learn.microsoft.com/en-us/azure/container-apps/metrics)   | View and analyze your application's compute and network usage through metric data. |
| [**Application logging**](https://learn.microsoft.com/en-us/azure/container-apps/logging)     | Monitor, analyze, and debug your app using log data.                            |
| [**Azure Monitor Log Analytics**](https://learn.microsoft.com/en-us/azure/container-apps/log-monitoring) | Run queries to view and analyze your app's system and application logs.       |
| [**Azure Monitor alerts**](https://learn.microsoft.com/en-us/azure/container-apps/alerts)    | Create and manage alerts to notify you of events and conditions based on metric and log data. |
| [**Azure Monitor Application Insights**](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)    | While not a built-in feature, Azure Monitor Application Insights is a powerful tool to monitor your web and background applications. Although Container Apps don't support the Application Insights auto-instrumentation agent, you can instrument your application code using Application Insights SDKs. |

## Description
- Use the Azure Portal and CLI to retrieve logs and metrics from your application.
- Explore diagnostic data to determine the app’s health and performance.
- Connect to a container's console using the Azure portal or Azure CLI.
- (Optional) Build and deploy a container of your choice that integrates with Application Insights SDKs. Then, review the logging and telemetry for your Container App within Application Insights.

## Success Criteria
- View the metrics collected by Azure Monitor (CPU usage, memory, and request counts). 
- View the container app system or console log stream via the Azure CLI.
- View the container's console using the Azure portal.
- Query system logs with Log Analytics in the Azure Portal.
- (Optional) Review the logging and telemetry for your Container App within Application Insights.

## Learning Resources
- [Observability in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/observability)
- [Integrate Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)
