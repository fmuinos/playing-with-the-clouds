# connect to azure account
Connect-AzAccount

# select subscription
Set-AzContext laboratory

# create resource group
New-AzResourceGroup -Name myResourceGroup -Location "Central US"

#ResourceGroupName : myResourceGroup
#Location          : centralus
#ProvisioningState : Succeeded
#Tags              :
#ResourceId        : /subscriptions/ff247a44-bf2d-423f-ad0c-e4097f9d7fba/resourceGroups/myResourceGroup

# deploy template
#$templateFile = "{provide-the-path-to-the-template-file}"
$templateFile = "ARM_templates/azuredeploy.json"
New-AzResourceGroupDeployment -Name blanktemplate -ResourceGroupName myResourceGroup -TemplateFile $templateFile -storageName "labazuredeploy"

#DeploymentName          : blanktemplate
#ResourceGroupName       : myResourceGroup
#ProvisioningState       : Succeeded
#Timestamp               : 07/11/2021 12:31:09
#Mode                    : Incremental
#TemplateLink            :
#Parameters              :
#                          Name             Type                       Value
#                          ===============  =========================  ==========
#                          storageName      String                     labazuredeploy

#Outputs                 :
#DeploymentDebugLogLevel :

# verify deployments via resourcegroup. Find the deploy.

# clean up resources
Remove-AzResourceGroup -Name myResourceGroup
