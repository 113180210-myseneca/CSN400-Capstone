# Checkpoint7 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - Creating & Configuring VMs - Using Portal](#part-a)
2. [Part B - Enable IP_Forwarding - Using Portal](#part-b)
3. [Part C - Basic Connectivity - VM Configuration](#part-c)
4. [Part D - Creating & Configuring VM Images - Using Portal](#part-d)
5. [Part E - Azure Cost Analysis Charts](#part-e)
6. [Part F - Create Customized Azure Dashboard](#part-f)

## Part A
### Question 1
What is the difference between Windows machine NSG and Linux machine NSG rules? Why? Do not give screenshots just describe the difference? Do you need a rule for ssh or rdp? What happens if you delete specific ssh and rdp rules?
### Answer
Depending on the protocols and ports used for remote access, the NSG rules for Windows and Linux computers vary. RDP is commonly used by Windows machines on port 3389, while SSH is used by Linux machines on port 22. SSH access would be disabled by deleting SSH rules, blocking file transfers and remote administration. By deleting RDP rules, remote desktop access would be disabled and desktop remote control would be impossible. In conclusion, the differences are in the protocols and ports, and eliminating particular rules would make the corresponding protocols inaccessible via remote access.

### Question 2
Work from Azure Bash CLI in Portal to get a list of your VM, NSG, NIC, and Disks. You can start with the below commands. Make sure the outputs in table format are embedded in your submission.
### Answer
- az vm list --output table
```
Name    ResourceGroup      Location       Zones
------  -----------------  -------------  -------
LR-127  STUDENT-RG-954525  canadacentral  1
LS-127  STUDENT-RG-954525  canadacentral  1
WC-127  STUDENT-RG-954525  canadacentral  1
WS-127  STUDENT-RG-954525  canadacentral  1
```
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
canadacentral  WS-NSG-127  Succeeded            Student-RG-954525  85183003-6736-4d9b-b522-7f013c87e449
```
- az network nic list --output table
```
EnableAcceleratedNetworking    EnableIPForwarding    Location       MacAddress         Name          NicType    Primary    ProvisioningState    ResourceGroup      ResourceGuid                          VnetEncryptionSupported
-----------------------------  --------------------  -------------  -----------------  ------------  ---------  ---------  -------------------  -----------------  ------------------------------------  -------------------------
False                          False                 canadacentral  00-22-48-3B-D6-7B  lr-127675_z1  Standard   True       Succeeded            Student-RG-954525  4a00ab13-51fc-4a65-a63e-d66f30c29b07  False
False                          False                 canadacentral  00-0D-3A-E9-A4-8C  ls-127298_z1  Standard   True       Succeeded            Student-RG-954525  7c58d67d-2503-4eb0-91f1-a267fc929c3f  False
False                          False                 canadacentral  60-45-BD-5D-27-16  wc-12731_z1   Standard   True       Succeeded            Student-RG-954525  df5352af-1bc4-4dae-8819-9b40599cfa9f  False
False                          False                 canadacentral  60-45-BD-5E-17-BD  ws-127126_z1  Standard   True       Succeeded            Student-RG-954525  ce202cd8-dd9e-4d60-8b22-1fd3b1c821f9  False
```
- az disk list --output table
```
Name                                           ResourceGroup      Location       Zones    Sku           OsType    SizeGb    ProvisioningState
---------------------------------------------  -----------------  -------------  -------  ------------  --------  --------  -------------------
LR-127_disk1_ca3e07771ea54855b23903fd12f527a8  STUDENT-RG-954525  canadacentral  1        Standard_LRS  Linux     64        Succeeded
LS-127_disk1_0b32c4b3529b4fd7af5f01247cb51ac5  STUDENT-RG-954525  canadacentral  1        Standard_LRS  Linux     64        Succeeded
WC-127_disk1_eb2b3a9ff79f4ae3b71bf343bb2a531f  STUDENT-RG-954525  canadacentral  1        Standard_LRS  Windows   127       Succeeded
WS-127_disk1_b720b2d368ea4adea65f3626aa8aea7d  STUDENT-RG-954525  canadacentral  1        Standard_LRS  Windows   127       Succeeded
```

