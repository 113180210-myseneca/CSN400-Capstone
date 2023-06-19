# Checkpoint6 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

#### I. [Part A - Creating Network Resources using Azure CLI](#part-a)
#### II. [Part B - Working in Azure CLI Bash](#part-b)
#### III. [Part C - Network Review Questions](#part-c)
#### IV. [Part D - Creating Virtual Machines](#part-d)

## Part A

### Edited lines in ```_network_config.sh_``` file

    RG_NAME="Student-RG-954525"     
    LOCATION="canadacentral"    
    ID="127"          

    Student_vnet_name="Student-954525-vnet"
    Student_vnet_address="10.37.253.0/24"
    Client_Subnet_name="Virtual-Desktop-Client"
    Client_Subnet_address="10.37.253.0/24"

### Resource list
```bash
az resource list --output table

Name                                              ResourceGroup      Location       Type                                     Status
------------------------------------------------  -----------------  -------------  ---------------------------------------  --------
AzureBastionSubnet                                Bastion_RG         canadacentral  Microsoft.Network/bastionHosts
Bastion-pip                                       Bastion_RG         canadacentral  Microsoft.Network/publicIPAddresses
Bastion-Vnet                                      Bastion_RG         canadacentral  Microsoft.Network/virtualNetworks
NetworkWatcher_canadacentral                      NetworkWatcherRG   canadacentral  Microsoft.Network/networkWatchers
NetworkWatcher_canadaeast                         NetworkWatcherRG   canadaeast     Microsoft.Network/networkWatchers
lr-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
ls-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
wc-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
ws-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
RT-127                                            Student-RG-954525  canadacentral  Microsoft.Network/routeTables
Router-127                                        Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
Server-127                                        Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
Student-954525-vnet                               Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
```
### Resource Group List
```bash
Checking status for Resource Group: Student-RG-954525
exists!
Resource groups:
Name               Location       Status
-----------------  -------------  ---------
Bastion_RG         canadacentral  Succeeded
NetworkWatcherRG   canadacentral  Succeeded
Student-RG-954525  canadacentral  Succeeded
```
#### ***_Question 1_***: In network_config_test.sh what does if ```[[ ! $(az group list -o tsv --query "[?name=='$RG_NAME']") ]]``` do? Explain your answer.

#### ***_Answer_***: The above mentioned script contains a command as follows:
```bash
if [[ ! $(az group list -o tsv --query "[?name=='$RG_NAME']") ]]
```
This checks if the group already exists or not. If you want to check the group list, you can use the following command:
```bash
az group list
```
The command proceeds and responds with respect to if the group exists or not.

#### ***_Question 2_***: Why is it crucial to check if a resource exist before creating it? What bash syntax do you use to test this? How do you check if a vnet exits in vnet_create.sh?

#### ***_Answer_***: It very important to confirm if a particular resource already exists or not as it eliminates disputes and conflicts. You can use the following command to test this:
```bash
if [[ $(az network vnet list -g $RG_NAME -o tsv --query "[?name=='$vnet']") ]]
```
#### ***_Question 3_***: What is the Azure CLI command to create vnet? Give the specific command as per your environment and unique ID configuration. What are the required and what are the optional parameters that you need to pass to it?

#### ***_Answer_***: You can use the following command to create a vnet:
```bash
az network vnet create
```
Specific commands are as follows:
```bash
az network vnet create \
    --name Student-954525-vnet \
    --resource-group Student-RG-954525 \
    --location canadacentral \
    --address-prefixes 10.37.253.0/24
```
The required parameters are:
```bash
    --name
    --resource-group
```
The optional parameters are:
```bash
    --location
    --address-prefixes
    --subnet-name
    --subnet-prefix
```
#### ***_Question 4_***: What is the Azure CLI command to create subnet? Give the specific command as per your environment and unique ID configuration. What are the required and what are the optional parameters that you need to pass to it?

#### ***_Answer_***: The command to create a subnet is:
```bash
az network vnet subnet create
```
```bash
az network vnet subnet create \
    name Virtual-Desktop-Client\
    resource-group Student-RG-954525 \
    vnet-name Student-954525-vnet \
    address-prefix 10.37.253.0/24
```
The required parameters are:
```bash
    --name
    --resource-group
    --vnet-name
    --address-prefix
```
The optional parameters are:
```bash
    --network-security-group
    ----route-table
    --service-endpoints
```

## Part B

#### ***_Question 1_***: List all VNETs using az network vnet list command and send the output in json format to vnet_list.jsonfile

#### ***_Answer_***:
- [Vnet_List File](./outputvnetlist_psharma178.json)

#### ***_Question 2_***: Get the details of your default student vnet using az show command and send the output in json format to student_vnet.json file

#### ***_Answer_***:
- [Student_Vnet File](./outputstudentvnet_psharma178.json)

#### ***_Question 3_***: List all peerings using az network vnet peering list command and send the output in table format to peerings.tblfile

#### ***_Answer_***:
- [Peerings_tbl File](./outputpeerings_psharma178.tbl)

#### ***_Question 4_***: Get the details of your Router-XX subnet SN1 using az show command in json format and query it for details of subnet and rout associations. Only submit the specific property you are asked for. You will need to embed this in your README.md as per instructions.

#### ***_Answer_***:
```bash
az network vnet subnet show --resource-group Student-RG-954525 --vnet-name Router-127 --name SN1 --query "{Subnet
: name, AddressPrefix: addressPrefix, RouteTable: routeTable.id, NetworkSecurityGroup: networkSecurityGroup.id}"
{
  "AddressPrefix": "192.168.127.32/27",
  "NetworkSecurityGroup": null,
  "RouteTable": null,
  "Subnet": "SN1"
}
```
#### ***_Question 5_***: List all routes in RT-xx using az network route-table route list command and send the output in table format to route_list.tblfile

#### ***_Answer_***:
- [Route_List File](./outputroutelist_psharma178.tbl)

#### ***_Question 6_***: Get the details of route between your Router-xx SN1 and Server-xx SN using az network route-table route show and send the output in json format to route_details.json

#### ***_Answer_***:
- [Route_Details File](./outputroutedetails_psharma178.json)

### Resource list
```bash
az resource list --output table

Name                                              ResourceGroup      Location       Type                                     Status
------------------------------------------------  -----------------  -------------  ---------------------------------------  --------
AzureBastionSubnet                                Bastion_RG         canadacentral  Microsoft.Network/bastionHosts
Bastion-pip                                       Bastion_RG         canadacentral  Microsoft.Network/publicIPAddresses
Bastion-Vnet                                      Bastion_RG         canadacentral  Microsoft.Network/virtualNetworks
NetworkWatcher_canadacentral                      NetworkWatcherRG   canadacentral  Microsoft.Network/networkWatchers
NetworkWatcher_canadaeast                         NetworkWatcherRG   canadaeast     Microsoft.Network/networkWatchers
lr-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
ls-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
wc-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
ws-127                                            Student-RG-954525  canadacentral  Microsoft.Network/networkInterfaces
RT-127                                            Student-RG-954525  canadacentral  Microsoft.Network/routeTables
Router-127                                        Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
Server-127                                        Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
Student-954525-vnet                               Student-RG-954525  canadacentral  Microsoft.Network/virtualNetworks
```
