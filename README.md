# playing-with-the-clouds
Playins with the clouds. Fun in a big way.

**Microsoft AZURE is the cloud selected.**

## Task TODO
- [X] VM
- [X] ARM Templates
- [ ] Containers
- [ ] App service web ASP.NET
- [ ] Enable diagnostics logging
- [ ] Azure functions
- [ ] Cosmos DB API
- [ ] Blob Storate Client
- [ ] Implement Secure Application
- [ ] Key Vaults
- [ ] Managed Identities
- [ ] Microsoft Grapth
- [ ] Integrading CDN
- [ ] Monitoring and loging.
- [ ] Insights web test and alers.
- [ ] API Management and third-party services
- [ ] Develop event grid.
- [ ] Develop event hubs
- [ ] Message based and azure service bus
- [ ] Azure Queues.

## Deploy a new VM. Steps:
1. Create a resource group or use existing resource group.
2. Create a virtual network.if no exist a virtual network selected on is created automatically.
3. Create a virtual NIC. -no necesary with azure portal, powershell, or azure CLI.-
4. Create the virtual machine.

### Create a console via http://shell.azure.com/powershell
Launch the Azure Cloud Shell with:

> http://shell.azure.com/powershell

List the Azure subscriptions:
> az account list

A few accounts are skipped as they don't have 'Enabled' state. Use '--all' to display them.
```
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "004b6f6b-5909-4648-8823-6b797244f27c",
    "id": "bb4e7fa0-a226-476a-a22c-a3d51891a344",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure subscription 1",
    "state": "Enabled",
    "tenantId": "004b6f6b-5909-4648-8823-6b797244f27c",
    "user": {
      "cloudShellID": true,
      "name": "live.com#mmuinos@hotmail.es",
      "type": "user"
    }
  },
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "004b6f6b-5909-4648-8823-6b797244f27c",
    "id": "ff247a44-bf2d-423f-ad0c-e4097f9d7fba",
    "isDefault": false,
    "managedByTenants": [],
    "name": "Laboratory",
    "state": "Enabled",
    "tenantId": "004b6f6b-5909-4648-8823-6b797244f27c",
    "user": {
      "cloudShellID": true,
      "name": "live.com#mmuinos@hotmail.es",
      "type": "user"
    }
  }
]
```
> az account show

> az account set -s laboratory



### Connect with your subscription:
> Connect-AzAccount


### Create a console with Visual Studio Code 

> dotnet new console

Show modules installed:

> Get-Module

Install nuget package:
> dotnet add package Microsoft.Azure.Management.Fluent

if MSOnline module not show import this with:
with a powershell console Administrator:
> Install-Module MSOnline

For install all modules:
> Install-Module -Name Az -AllowClobber -Scope CurrentUser

and:
> Import-Module MSOnline

Create a new file **azureauth.properties** and add the content:
``` 
subscription=<subscription-id>
client=<client-id>
key=<client-secret>
tenant=<tenant-id>
managementURI=https://management.core.windows.net/
baseURL=https://management.azure.com/
authURL=https://login.windows.net/
graphURL=https://graph.windows.net/
```

### Create a Resource Group

> New-AzResourceGroup -ResourceGroupName  "myResourceGroupVM" -Location "EastUS"

#### create a powershell script
A powershell script finish with extension .ps1

Can create a script with ide: PowerShell ISE
