# Checkpoint8 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - Creating & Configuring VMs - Using Azure CLI Scripts](#part-a)
2. [Part B - Basic Connectivity - Linux VMs Firewall Setting](#part-b)
3. [Part C - Azure Cost Analysis Charts](#part-c)

## Part A

### Question 1 
Get a list of your VM, NSG, NIC, and Disks using Azure CLI in table format. Do not include screenshots, just embed the output in table format in your submission.
### Answer
- az vm list --output table
```
Name    ResourceGroup      Location       Zones
------  -----------------  -------------  -------
LR-127  STUDENT-RG-954525  canadacentral
LS-127  STUDENT-RG-954525  canadacentral
WC-127  STUDENT-RG-954525  canadacentral
WS-127  STUDENT-RG-954525  canadacentral
```

-az network nsg list --output table
```
Location       Name        ProvisioningState    ResourceGroup      ResourceGuid
-------------  ----------  -------------------  -----------------  ------------------------------------
canadacentral  LR-127-nsg  Succeeded            Student-RG-954525  706736ec-94f2-4796-b5a1-f25ed2d8c57d
canadacentral  LR-NSG-127  Succeeded            Student-RG-954525  6c4bd731-733e-461e-a271-b0f86cb7dbb2
canadacentral  LS-127-nsg  Succeeded            Student-RG-954525  5d9d7eaa-d811-439f-bf01-5577781ae929
canadacentral  LS-NSG-127  Succeeded            Student-RG-954525  d07fdd97-f1c9-4a97-b192-2f34b3050b07
canadacentral  WC-127-nsg  Succeeded            Student-RG-954525  bcc68d06-90c2-44d0-95a9-5e5cd92709c5
canadacentral  WC-NSG-127  Succeeded            Student-RG-954525  470fc083-558b-462d-bf89-f38ce711dfa4
canadacentral  WS-127-nsg  Succeeded            Student-RG-954525  128b3efc-5ec0-44a7-8750-a646cbbff1d4
canadacentral  WS-NSG-127  Succeeded            Student-RG-954525  85183003-6736-4d9b-b522-7f013c87e449
```

-az network nic list --output table
```
EnableAcceleratedNetworking    EnableIPForwarding    Location       MacAddress         Name    NicType    Primary    ProvisioningState    ResourceGroup      ResourceGuid                          VnetEncryptionSupported
-----------------------------  --------------------  -------------  -----------------  ------  ---------  ---------  -------------------  -----------------  ------------------------------------  -------------------------
False                          True                  canadacentral  00-0D-3A-0C-34-45  lr-127  Standard   True       Succeeded            Student-RG-954525  ddb557e2-260e-4327-bc15-aaf74a40f46a  False
False                          False                 canadacentral  00-22-48-AF-51-24  ls-127  Standard   True       Succeeded            Student-RG-954525  083e7c06-04ae-4be6-a095-8b2d33b1a677  False
False                          False                 canadacentral  00-22-48-AF-53-01  wc-127  Standard   True       Succeeded            Student-RG-954525  a551094f-4158-4a34-a4f6-cee7017a880c  False
False                          False                 canadacentral  00-22-48-3E-9C-70  ws-127  Standard   True       Succeeded            Student-RG-954525  98f15bf0-f00b-4a95-83c5-52a6f901d437  False
```

-az disk list --output table
```
az disk list --output table
Name                                              ResourceGroup      Location       Zones    Sku              OsType    SizeGb    ProvisioningState
------------------------------------------------  -----------------  -------------  -------  ---------------  --------  --------  -------------------
LR-127_disk1_8ed65053c1f8450e8d17fd7ef646641a     STUDENT-RG-954525  canadacentral           StandardSSD_LRS  Linux     64        Succeeded
LS-127_OsDisk_1_5f90ad63fcbc47faa2787ae2ebc349e6  STUDENT-RG-954525  canadacentral           StandardSSD_LRS  Linux     64        Succeeded
WC-127_disk1_028a607bca2b43f788f3fb08e736a5a8     STUDENT-RG-954525  canadacentral           StandardSSD_LRS  Windows   127       Succeeded
WS-127_disk1_d3ae56ff4bd54ac08507a507698b9774     STUDENT-RG-954525  canadacentral           StandardSSD_LRS  Windows   127       Succeeded
```

### Question 2
Why are you creating NIC separate from VM? What happens when you delete a VM, is that attached NIC automatically deleted? Why?
### Answer
For network configuration flexibility, isolation, and live migration, NICs are generated separately from VMs. The virtualization platform and configuration determine whether a NIC is automatically erased when a VM is deleted. It can be manually erased, left available for reuse, or deleted properly. For correct information, go to the relevant platform documentation.

### Question 3
When you created VMs from Portal can you use an existing NIC? Do you consider this a limitation in working from Portal for VM creation?
### Answer
You can choose to use an existing NIC when creating VMs from the Azure portal. You can reuse previous network setups thanks to this feature's versatility. Working through the portal does not have this restriction because it has a user-friendly interface and allows you to tailor VM deployments to your needs.

### Question 4
What rules did we add to Network Security Groups (NSG)? What does each rule do?
### Answer
- AllowVnetInBound- This network setting permits incoming traffic from resources connected to the same Virtual Network (VNet).

- AllowAzureLoadBalancerInBound- Permits network traffic from Azure Load Balancer to enter.

- DenyAllInBound- Blocks all inbound connections and denies all incoming network traffic.

- AllowVnetOutBound- Allows network traffic to leave the same Virtual Network (VNet) and reach resources there.

- AllowInternetOutBound- Allows network traffic to leave the local area network and travel to the internet.

- DenyAllOutBound- Blocks all outgoing connections and denies all outgoing network traffic.

### Question 5
Run a command in CLI that lists all your Custom Images. Change the output format to table format and embed the answer in your submission.
### Answer
```
Name              ResourceGroup      Location
----------------  -----------------  -------------
lr-127-ver-0.0.1  STUDENT-RG-954525  canadacentral
ls-127-ver-0.0.1  STUDENT-RG-954525  canadacentral
wc-127-ver-0.0.1  STUDENT-RG-954525  canadacentral
ws-127-ver-0.0.1  STUDENT-RG-954525  canadacentral
```

### Question 6
Delete your VMs using the proper script after your work is completed. Run a command in CLI that lists all your VMs.
### Answer 
- az vm list --output table
(empty)

### Question 7
Get a list of your VM, NSG, NIC, and Disks using Azure CLI in table format. Which ones are empty? Do not include screenshots, just embed the output in table format in your submission.
### Answer
- az vm list --output table
(empty)

- az network nic list --output table
(empty)

- az disk list --output table
(empty)
- az network nsg list --output table
```
Location       Name        ProvisioningState    ResourceGroup      ResourceGuid
-------------  ----------  -------------------  -----------------  ------------------------------------
canadacentral  LR-127-nsg  Succeeded            Student-RG-954525  706736ec-94f2-4796-b5a1-f25ed2d8c57d
canadacentral  LR-NSG-127  Succeeded            Student-RG-954525  6c4bd731-733e-461e-a271-b0f86cb7dbb2
canadacentral  LS-127-nsg  Succeeded            Student-RG-954525  5d9d7eaa-d811-439f-bf01-5577781ae929
canadacentral  LS-NSG-127  Succeeded            Student-RG-954525  d07fdd97-f1c9-4a97-b192-2f34b3050b07
canadacentral  WC-127-nsg  Succeeded            Student-RG-954525  bcc68d06-90c2-44d0-95a9-5e5cd92709c5
canadacentral  WC-NSG-127  Succeeded            Student-RG-954525  470fc083-558b-462d-bf89-f38ce711dfa4
canadacentral  WS-127-nsg  Succeeded            Student-RG-954525  128b3efc-5ec0-44a7-8750-a646cbbff1d4
```

## Part B

### Question 1
Run commands that show the status of the Apache server and MariDB server in your LS-xx. Embed the output as a bash snippet.
### Answer 
- systemctl status apache2
```
Unit apache2.service could not be found.
```
- systemctl status mariadb
```
Unit mariadb.service could not be found.
```

### Question 2
Run a command in LR-xx that show iptables chains. What is the default setting? How could you improve these settings to be less vulnerable to attacks?
### Answer
Th default setting for all three chains (INPUT,OUTPUT,FORWARD) is ACCEPT.
Improvement in setting:
- Set the default settings for the INPUT and FORWARD chains to DROP.
- Only allow required services and ports.
- Use the --state option to provide stateful packet inspection.
- Enable packet rejection and lost logging.
- Implement connection and rate limitations.

### Question 3
Run a command that shows the hostname in LR-XX and LX-XX and embed the output in your submission.
### Answer 
- hostname
```
LR-127.CSN4002234.com
```
- hostname
```
LS-127.CSN4002234.com
```
