# Challenge 12 (Optional) - Protect Azure Container Apps with Web Application Firewall on Application Gateway

 [< Previous Challenge](./Challenge-11.md) - **[Home](../README.md)**

## Introduction
In this challenge, you will enhance the security of your Azure Container Apps by integrating a Web Application Firewall (WAF) on an Application Gateway. By using WAF, you can protect your container apps from common web vulnerabilities and attacks such as SQL injection, cross-site scripting, and other OWASP top 10 threats. Additionally, you will provide a Virtual Network (VNet) for your Container Apps environment to securely isolate and control network traffic.

When you host your apps or microservices in Azure Container Apps, you might not always want to publish them directly to the internet. Instead, you might want to expose them through a reverse proxy.

A reverse proxy is a service that sits in front of one or more services, intercepting and directing incoming traffic to the appropriate destination.

Reverse proxies allow you to place services in front of your apps that supports cross-cutting functionality including:
- Routing
- Caching
- Rate limiting
- Load balancing
- Security layers (WAF)
- Request filtering

## Description
- **Provision an Application Gateway with WAF:**  
  - Create an Application Gateway configured with a Web Application Firewall policy.
  - Configure the WAF rules and tuning parameters to protect against common threats.

- **Configure Backend Settings:**  
  - Set up the Application Gateway’s backend pool to point to the FQDN of your Azure Container App.
  - Ensure the HTTP settings and health probes are correctly configured to communicate with your container app.

- **Integrate with Azure Container Apps and Virtual Network:**  
  - Update your container app’s ingress configuration (if necessary) so that it accepts traffic routed via the Application Gateway internally.
  - **Provide a Virtual Network:**  
    - Integrate your Container Apps environment with a Virtual Network.
  - Validate that the Application Gateway properly forwards external requests to your internal container app and that the WAF policy inspects and blocks malicious traffic.

- **Testing and Verification:**  
  - Simulate traffic that would trigger WAF rules (for example, requests containing SQL injection patterns) and verify that the WAF blocks these requests.
  - Check Application Gateway and container app logs to confirm that traffic is being inspected and that the security policies are active.

## Success Criteria
- An Application Gateway with an active Web Application Firewall policy is provisioned.
- The Application Gateway’s backend pool is correctly configured to route traffic to your Azure Container App.
- A Virtual Network is provided and integrated into your Container Apps environment to enable secure network configuration.
- The container app is accessible internally through the Application Gateway, and the WAF is actively inspecting incoming traffic.
- Simulated malicious requests are blocked as per the WAF policy, with evidence available in logs.

## Learning Resources
- [Protect your container apps with WAF on Application Gateway](https://learn.microsoft.com/en-us/azure/container-apps/waf-app-gateway)
- [Provide a virtual network to an Azure Container Apps environment](https://learn.microsoft.com/en-us/azure/container-apps/vnet-custom?tabs=bash&pivots=azure-portal)
- [Azure Application Gateway Overview](https://learn.microsoft.com/en-us/azure/application-gateway/overview)
- [Web Application Firewall in Azure](https://learn.microsoft.com/en-us/azure/web-application-firewall/ag/ag-overview)
- [Azure security baseline for Azure Container Apps](https://learn.microsoft.com/en-us/security/benchmark/azure/baselines/azure-container-apps-security-baseline)