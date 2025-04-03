# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$LOG_ANALYTICS_WORKSPACE="aca-workshop-logs"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-http-scale-container-app"

# Deploy container app with HTTP scaling
az containerapp create `
  --name $CONTAINERAPP `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINERAPPS_ENVIRONMENT `
  --image 'mcr.microsoft.com/dotnet/samples:aspnetapp' `
  --target-port 8080 `
  --ingress "external" `
  --min-replicas  0 `
  --max-replicas 10 `
  --scale-rule-name my-http-scale-rule `
  --scale-rule-type 'http' `
  --scale-rule-http-concurrency 5 `
  --query 'properties.configuration.ingress.fqdn'
  
  # Simulate load to trigger autoscaling with bash shell.
  seq 1 100 | xargs -Iname -P10 curl "<YOUR_CONTAINER_APP_FQDN>"

  # Simulate load to trigger autoscaling with powershell.
  $url="<YOUR_CONTAINER_APP_FQDN>"
  $Runspace = [runspacefactory]::CreateRunspacePool(1,10)
  $Runspace.Open()
  1..100 | % {
      $ps = [powershell]::Create()
      $ps.RunspacePool = $Runspace
      [void]$ps.AddCommand("Invoke-WebRequest").AddParameter("UseBasicParsing",$true).AddParameter("Uri",$url)
      [void]$ps.BeginInvoke()
  }