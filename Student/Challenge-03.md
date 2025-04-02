# Challenge 03 - Application lifecycle management - Updates and Rollbacks

 [< Previous Challenge](./Challenge-02.md) - **[Home](../README.md)** - [Next Challenge >](./Challenge-04.md)

## Introduction
Applications evolve over time. In this challenge, you will learn how to update a Container App and manage its revisions. Experience deploying a new version of your app while retaining the ability to roll back if necessary.

Change management in Azure Container Apps is powered by revisions, which are a snapshot of each version of your container app.

A revision is an immutable snapshot of a container app. The first revision is automatically created when you deploy your container app. New revisions will be automatically created when a container app’s template configuration changes. 

Changes to a container app fall under two categories: revision-scope or application-scope changes. Revision-scope changes trigger a new revision when you deploy your app, while application-scope changes don't.

ACA supports two revision modes, the single-revision mode, where only one revision is active at a time, and multi-revision mode, where multiple revisions can be active simultaneously for A/B testing or blue-green deployments. This flexibility helps manage updates effectively and minimize downtime.

## Description
- Deploy a new revision of your Container App with an updated image: mavilleg/acarevision-helloworld:acarevision-hellowold
- Configure 80/20 traffic splitting to test the new revision alongside the old version.
- Use the [revision label](https://learn.microsoft.com/en-us/azure/container-apps/revisions#labels) URL to access the updated revision.
- Test the update and then perform a rollback to the previous stable revision.

## Success Criteria
- New revision is successfully deployed.
- Rollback to an earlier revision functions as expected.
- Use the revision label URL to access the new revision.
- By using az CLI, get all the revisions available in a table format
- You clearly explain to your coach:
  - The differences between revision-scope changes and application-scope changes.
  - The concepts of single revision mode versus multiple revision mode, including scenarios and benefits of each.

## Learning Resources
- [Application lifecycle management in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/application-lifecycle-management)
- [Update and deploy changes in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/revisions)
- [Manage revisions in Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/revisions-manage)
