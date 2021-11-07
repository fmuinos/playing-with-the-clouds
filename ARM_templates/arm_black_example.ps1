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
$templateFile = "ARM_templates/azuredeployblack.json"
New-AzResourceGroupDeployment -Name blanktemplate -ResourceGroupName myResourceGroup -TemplateFile $templateFile

#DeploymentName          : blanktemplate
#ResourceGroupName       : myResourceGroup
#ProvisioningState       : Succeeded
#Timestamp               : 07/11/2021 12:03:50
#Mode                    : Incremental
#TemplateLink            :
#Parameters              :
#Outputs                 :
#DeploymentDebugLogLevel :

# verify deployments via resourcegroup. Find the deploy.

# clean up resources
Remove-AzResourceGroup -Name myResourceGroup
