# Checkpoint10 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A – Route Table Updates](#part-a)
2. [Part B – Port Forwarding Basic Connectivity](#part-b)
3. [Part C – Logging & Isolating Masqueraded Packets](#part-c)
4. [Part D - Azure Cost Analysis Charts](#part-d)

## Part A

- Route Tables
```
az network route-table list --output table 
```
```
DisableBgpRoutePropagation    Location       Name       ProvisioningState    ResourceGroup      ResourceGuid
----------------------------  -------------  ---------  -------------------  -----------------  ------------------------------------
False                         canadacentral  RT-127     Succeeded            Student-RG-954525  ef7428a9-0106-4a10-b87a-7b7cb502b2b1
False                         canadacentral  RT-EX-127  Succeeded            Student-RG-954525  007ee627-5724-4e88-b201-7627c60f3f6f
```

- Routes
```
 az network route-table route list --resource-group Student-RG-954525 --route-table-name RT-EX-127 --output table 
```
```
AddressPrefix      HasBgpOverride    Name          NextHopIpAddress    NextHopType       ProvisioningState    ResourceGroup
-----------------  ----------------  ------------  ------------------  ----------------  -------------------  -----------------
192.168.105.32/27  False             Route-to-Hub  192.168.99.36       VirtualAppliance  Succeeded            Student-RG-954525
```

- Associated Subnets
```
az network vnet subnet list --resource-group Student-RG-954525 --vnet-name Router-127 --output table
```
```
AddressPrefix       Name    PrivateEndpointNetworkPolicies    PrivateLinkServiceNetworkPolicies    ProvisioningState    ResourceGroup
------------------  ------  --------------------------------  -----------------------------------  -------------------  -----------------
192.168.127.64/27   SN2     Disabled                          Enabled                              Succeeded            Student-RG-954525
192.168.127.96/27   SN3     Disabled                          Enabled                              Succeeded            Student-RG-954525
192.168.127.128/27  SN4     Disabled                          Enabled                              Succeeded            Student-RG-954525
192.168.127.32/27   SN1     Disabled                          Enabled                              Succeeded            Student-RG-954525
```

## Part D

- Azure Cost Analysis Charts

| No. | Scope | Chart Type | VIEW Type |  Date Range | Group By | Granularity| Example |
|-|-|-|-|-|-|-|-|
|1|Student-RG-954525| Column (Stacked) | DailyCosts | Last 7 Days | Resource | Daily | ![daily-cost-barchar](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/bfd21cc7-c04a-48a2-8841-1eea70213ed4)
|2|Student-RG-954525| Column (Stacked) | DailyCosts | Last 7 Days | Service | Daily | ![daily-cost-service-barchart](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/569747d3-7ca0-4bd8-820d-333fdfc5534a)
|3|Student-RG-954525| Area| AccumulatedCosts | Last 7 Days | Resource | Accumulated | ![accumulated-resource-barchart](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/d1189ae1-d04e-4a5c-9f2e-8ba7237889dc)
|4|Student-RG-954525| Pie Chart | NA | Last Month | Service Name | NA | ![service-name-piechart (2)](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/121d57a1-52bb-404e-b0e6-e5f0c7291da6)
|5|Student-RG-954525| Pie Chart | NA | Last Month | Service Family | NA | ![service-family-piechart (2)](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/78b43fe5-e73f-45ba-9118-316f5bba60f4)
|6|Student-RG-954525| Pie Chart | NA | Last Month | Product | NA | ![product-piechart (2)](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/93fdbe5b-cf92-4ea6-b3d9-24f9f6eae211)

- Customized Azure Dashboard

![Customized Azure Dashboard (2)](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/b28fda05-00d6-4107-844d-f1033a46f8d2)