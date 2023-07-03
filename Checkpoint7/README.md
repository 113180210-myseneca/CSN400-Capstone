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
## Part B
### Question 1
Check the status of ip-forwarding using the command az network nic ip-config show with output format as json. Include only the command not output including the --query you used in your submission.
### Answer
```
az network nic show -n lr-127675_z1 -g $RG --query "enableIPForwarding" -o json
```

### Question 2
When your output format is json, which property shows the status of the ip-forwarding attribute? Embed only the property that shows the status of ip-forwarding.
### Answer
```
enableIPForwarding
```

## Part C
### Question 1
In configuring your Linux VMs, for the step "Remove the firewalld service", which command will you be using?
### Answer
```
sudo systemctl stop firewalld
```

### Question 2
In configuring your Linux VMs, what command do you use to check the status of iptabels?
### Answer
sudo iptables -L

### Question 3
How can you make iptables service start automatically after reboot on CenOS/RHEL8? 👉 Hint: RHEL7: How to disable Firewalld and use Iptables instead
### Answer
1. Disable firewalld
2. Install iptables-services
3. Enable, start iptables
4. Save iptables rules

### Question 4
Run a command in LR-xx that shows all iptables chains with their order number. What is the default setting? Include both the command and its output in your submission. How could you improve these settings to be less vulnerable to attacks?
### Answer
- sudo iptables -L --line-numbers
```
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
2    ACCEPT     icmp --  anywhere             anywhere
3    ACCEPT     all  --  anywhere             anywhere
4    ACCEPT     tcp  --  anywhere             anywhere             state NEW tcp dpt:ssh
5    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
num  target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
```
To strengthen security and adjust the settings:

1. Decide on DROP as the default policy.
2. Establish clear guidelines for permitted traffic.
3. Put stateful packet filtering into practise.
4. To make sure the firewall rules adhere to security requirements, examine and update them frequently.

### Question 5
Run a command that shows the hostname in LR-XX and LX-XX. Embed the output in your submission.
### Answer
- sudo hostnamectl
```
Static hostname: LS-127
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 453c95589ac44adfa31654d4a34fb87f
           Boot ID: 0043bb8c8028492aa68a26d691dfb83d
    Virtualization: microsoft
  Operating System: Red Hat Enterprise Linux 8.7 (Ootpa)
       CPE OS Name: cpe:/o:redhat:enterprise_linux:8::baseos
            Kernel: Linux 4.18.0-425.13.1.el8_7.x86_64
      Architecture: x86-64
```

## Part D
### Question 1
Run a command in CLI that lists all your Custom Images. Hint: az image list .... Change the output format to table format and embed the answer in your submission.
### Answer
- az image list --output table
```
HyperVGeneration    Location       Name              ProvisioningState    ResourceGroup
------------------  -------------  ----------------  -------------------  -----------------
V2                  canadacentral  lr-127-ver-0.0.1  Succeeded            STUDENT-RG-954525
V2                  canadacentral  ls-127-ver-0.0.1  Succeeded            STUDENT-RG-954525
V2                  canadacentral  wc-127-ver-0.0.1  Succeeded            STUDENT-RG-954525
V2                  canadacentral  ws-127-ver-0.0.1  Succeeded            STUDENT-RG-954525
```

### Question 2
Delete your VMs after your work is completed. Run a command in CLI that lists all your VMs. Hint: az vm list .... Change the output format to table format and embed the answer in your submission.
### Answer
- az vm list --output table
"no output"

### Question 3
Recreate all VMs from your images, and establish basic connectivity. How long the entire process took? How can you do this more efficiently?
### Answer
We can do this more efficiently by:
1. Utilise automation tools like Azure CLI scripts or Azure Resource Manager (ARM) templates.
2. When deploying numerous identical VMs, take into account using Azure Virtual Machine Scale Sets.
3. To reduce time while creating VMs, create custom images of configured VMs.
4. Automate the installation and configuration of applications using provisioning scripts or cloud-init.

## Part E
| No. | Scope | Chart Type | VIEW Type |  Date Range | Group By | Granularity| Example |
|-|-|-|-|-|-|-|-|
|1|Student-RG-xxxxxx| Column (Stacked) | DailyCosts | Last 7 Days | Resource | Daily | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/e5fde731-f1e7-4db3-9b10-85ac81ef1eff)
|2|Student-RG-xxxxxx| Column (Stacked) | DailyCosts | Last 7 Days | Service | Daily | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/3214f5a2-7ce5-49a9-a22a-972876dbf108)
|3|Student-RG-xxxxxx| Area| AccumulatedCosts | Last 7 Days | Resource | Accumulated | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/80631cc5-a6f6-476b-b492-077c3913ad68)|
|4|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Service Name | NA | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/80631cc5-a6f6-476b-b492-077c3913ad68) |
|5|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Service Family | NA | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/80631cc5-a6f6-476b-b492-077c3913ad68) |
|6|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Product | NA | ![image](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/75d0bdf9-7422-4eb4-9dab-c7fdac53baf9) |
