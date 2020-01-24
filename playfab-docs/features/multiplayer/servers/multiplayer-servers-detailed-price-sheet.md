---
title: Multiplayer Servers - detailed price sheet
author: v-thopra
description: Detailed pricing information for PlayFab Multiplayer Server 2.0 (Thunderhead).
ms.author: v-thopra
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, pricing
ms.localizationpriority: medium
---

# Multiplayer servers - detailed price sheet

PlayFab multiplayer servers operate on most generally available Azure virtual machine sizes and regions. These are the most popular series for game developers providing progressively faster processors:

- The Av2-series VMs can be deployed on a variety of hardware types and processors. The size is throttled, based upon the hardware, to offer consistent processor performance for the running instance, regardless of the hardware it is deployed on.
- Dv2-series VMs features a  powerful CPU and optimal CPU-to-memory configuration making them suitable for most production workloads. The Dv2-series is about 35% faster than the D-series. Dv2-series runs on the Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with the Intel Turbo Boost Technology 2.0.
- The Fsv2-series is based on the Intel® Xeon® Platinum 8168 processor. It features a sustained all core Turbo clock speed of 3.4 GHz and a maximum single-core turbo frequency of 3.7 GHz. Intel® AVX-512 instructions are new on Intel Scalable Processors. These instructions provide up to a 2X performance boost to vector processing workloads on both single and double precision floating point operations. In other words, they're really fast for any computational workload. At a lower per-hour list price, the Fsv2-series is the best value in price-performance in the Azure portfolio based on the Azure Compute Unit (ACU) per vCPU.

Unless otherwise specified, the price for a virtual machine is proportional to the number of virtual CPUs and their type. For example, a 4-core virtual machine from the Dv3 series will cost twice as much as a 2-core virtual machine.

> [!NOTE]
> The following prices are *per virtual machine compute hour*.

## Price by virtual machine selection in East US

Av2 Series |Cores|RAM|Storage|Windows|Linux|
|-|-|-|-|-|-|
A1 v2|1|2.00 GiB|10 GiB|$0.065 |$0.043 |
A2 v2|2|4.00 GiB|20 GiB|$0.130 |$0.090 |
A4 v2|4|8.00 GiB|40 GiB|$0.270 |$0.180 |
A8 v2|8|16.00 GiB|80 GiB|$0.570 |$0.38 |

Dv2 Series |Cores|RAM|Storage|Windows|Linux|
|-|-|-|-|-|-|
D1 v2|1|3.50 GiB|50 GiB|$0.126 |$0.073 |
D2 v2|2|7.00 GiB|100 GiB|$0.252 |$0.146 |
D3 v2|4|14.00 GiB|200 GiB|$0.504 |$0.293 |
D4 v2|8|28.00 GiB|400 GiB|$1.008 |$0.585 |

Fv2 Series|Cores|RAM|Storage|Windows|Linux|
|-|-|-|-|-|-|
F2 v2|2|4.00 GiB|16 GiB|$0.163 |$0.085 |
F4 v2|4|8.00 GiB|32 GiB|$0.326 |$0.169 |
F8 v2|8|16.00 GiB|64 GiB|$0.651 |$0.338 |
F16 v2|16|32.00 GiB|128 GiB|$1.302 |$0.677 |


## Windows price by region for 2-core virtual machines

**Note, Dv3 and Fv1 series virtual machines are not currently available for new customers.**

Region|A2v2|D2v3 |D2v2|F2v1|F2v2|
|-|-|-|-|-|-|
East Asia|$0.150|$0.207|$0.277|$0.211|$0.179|
Southeast Asia|$0.150|$0.207|$0.277|$0.211|$0.179|
Australia East|$0.163|$0.226|$0.302|$0.230|$0.196|
Australia SouthEast|$0.163|$0.226|$0.302|$0.230|$0.196|
Brazil South|$0.190|$0.263|$0.353|$0.269|$0.228|
North Europe|$0.136|$0.188|$0.252|$0.192|$0.163|
West Europe|$0.136|$0.188|$0.252|$0.192|$0.163|
France Central|$0.163|$0.226|$0.302|$0.230|$0.196|
Japan East|$0.163|$0.226|$0.302|$0.230|$0.196|
Japan West|$0.163|$0.226|$0.302|$0.230|$0.196|
US Central|$0.136|$0.188|$0.252|$0.192|$0.163|
US East|$0.136|$0.188|$0.252|$0.192|$0.163|
US East 2|$0.136|$0.188|$0.252|$0.192|$0.163|
US North Central|$0.136|$0.188|$0.252|$0.192|$0.163|
US South Central|$0.136|$0.188|$0.252|$0.192|$0.163|
US West|$0.136|$0.188|$0.252|$0.192|$0.163|

## Linux price by region for 2-core virtual machines

Region|A2v2|D2v3 |D2v2|F2v1|F2v2|
|-|-|-|-|-|-|
East Asia|$0.100|$0.106|$0.161|$0.109|$0.094|
Southeast Asia|$0.100|$0.106|$0.161|$0.109|$0.094|
Australia East|$0.109|$0.115|$0.175|$0.119|$0.102|
Australia SouthEast|$0.109|$0.115|$0.175|$0.119|$0.102|
Brazil South|$0.127|$0.134|$0.204|$0.139|$0.119|
North Europe|$0.091|$0.096|$0.146|$0.099|$0.085|
West Europe|$0.091|$0.096|$0.146|$0.099|$0.085|
France Central|$0.109|$0.115|$0.175|$0.119|$0.102|
Japan East|$0.109|$0.115|$0.175|$0.119|$0.102|
Japan West|$0.109|$0.115|$0.175|$0.119|$0.102|
US Central|$0.091|$0.096|$0.146|$0.099|$0.085|
US East|$0.091|$0.096|$0.146|$0.099|$0.085|
US East 2|$0.091|$0.096|$0.146|$0.099|$0.085|
US North Central|$0.091|$0.096|$0.146|$0.099|$0.085|
US South Central|$0.091|$0.096|$0.146|$0.099|$0.085|
US West|$0.091|$0.096|$0.146|$0.099|$0.085|

## Network egress price by zone

Zone | Regions | $/GB of Network Egress
|-|-|-|
Zone 1| Australia Central, Australia Central 2, West US, West US 2, West Central US, East US, North Central US, South Central US, East US 2, Central US, West Europe, North Europe, Canada East, Canada Central, France Central, UK South, UK West | $0.05
Zone 2| East Asia, Southeast Asia, Japan East, Japan West, Australia East, Australia Southeast, Central India, West India, South India, Korea Central, Korea South|  $0.08
Zone 3 |Brazil South | $0.16
