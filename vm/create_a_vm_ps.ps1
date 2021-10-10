# Define a credential object to store the username and password for the virtual machine
$User = "Domain01\User01"
$PWord = ConvertTo-SecureString -String "P@sSw0rd" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

# check if resource group exist

# create resource group
New-AzResourceGroup -Name myResourceGroup -Location EastUS

# if resource group exist check if vm exist.

# create de vm
New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" `
    -Location "East US" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -Credential $Credential `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389

Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select "IpAddress"

# try to connect.
mstsc /v:publicIpAddress

# delete created resources.
#Remove-AzResourceGroup -Name myResourceGroup

#or Delete resource
#Remove-AzResource `
#  -ResourceGroupName ExampleResourceGroup `
#  -ResourceName ExampleVM `
#  -ResourceType Microsoft.Compute/virtualMachines
