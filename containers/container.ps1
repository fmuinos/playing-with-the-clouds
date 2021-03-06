#ACR_NAME=<registry-name>
$ACR_NAME = "cloudcontainerlab"

$RES_GROUP = $ACR_NAME # Resource Group name

az group create --resource-group $RES_GROUP --location eastus

#{
  #  "id": "/subscriptions/ff247a44-bf2d-423f-ad0c-e4097f9d7fba/resourceGroups/cloud12345",
  #  "location": "eastus",
  #  "managedBy": null,
  #  "name": "cloud12345",
  #  "properties": {
  #    "provisioningState": "Succeeded"
  #  },
  #  "tags": null,
  #  "type": "Microsoft.Resources/resourceGroups"
  #}

az acr create --resource-group $RES_GROUP --name $ACR_NAME --sku Standard --location eastus

az acr build --registry $ACR_NAME --image helloacrtasks:v1 .

az acr run --registry $ACR_NAME --cmd '$Registry/helloacrtasks:v1' /dev/null

# docker login $ACR_NAME.azurecr.io
docker login cloudcontainerlab.azurecr.io 
# list the repositorieslisted in the registry
az acr repository list --name cloudcontainerlab --output table

docker tag hello-world cloudcontainerlab.azurecr.io/hello-world
docker push cloudcontainerlab.azurecr.io/hello-world

# pull the image from the registry
docker pull cloudcontainerlab.azurecr.io/helloacrtasks:v1
# or example
docker pull cloudcontainerlab.azurecr.io/hello-world

# clean up resources
az group delete --name $RES_GROUP --yes

