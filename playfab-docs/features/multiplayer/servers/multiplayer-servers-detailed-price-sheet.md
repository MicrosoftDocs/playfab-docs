---
title: Multiplayer Servers - detailed price sheet
author: lejackso
description: Detailed pricing information for PlayFab Multiplayer Server 2.0 (Thunderhead).
ms.author: lejackso
ms.date: 01/17/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, pricing
ms.localizationpriority: medium
---

# Multiplayer servers - detailed price sheet

PlayFab multiplayer servers operate on most generally available Azure virtual machine sizes and regions. These are the most popular series for game developers providing progressively faster processors:

## Recommended VMs

- The Dav4 and Dasv4 series feature the AMD 2.35Ghz EPYCTM 7452 2nd Generation processor in a multi-threaded configuration with up to 256 MB L3 cache, and each 8 cores have 8 MB of dedicated L3 cache. The Dav4-series sizes offer a combination of vCPU, memory and temporary storage that is suitable for most gaming workloads. The Dasv4 Azure VMs expose up to 96 vCPUs, 384 GBs of RAM, and 768 GBs of SSD-based storage. Furthermore, the Azure Performance Improvement team has tuned Dasv4 VMs to be the most stable, delivering the best price/performance ratio on Azure with no code changes needed.
- The Eav4 and Easv4-series utilize AMD's 2.35Ghz EPYCTM 7452 processor in a multi-threaded configuration with up to 256MB L3 cache, increasing options for running most memory optimized workloads. The Eav4-series and Easv4-series have the same memory and disk configurations as the Ev3 & Esv3-series, and are ideal for memory-intensive applications. 

The Dasv4 is now the recommended SKU for running game servers in Azure. For customers currently on the Dv2, Fsv2 and Dv3 VMs, we highly recommend switching to Dasv4 as it offers the best ratio of price to CPU performance and more memory than the Fsv2. Below is a comparison of the PlayFab Multiplayer Servers 2 core SKUs. Prices are approximate as they vary based on the region selected. 

## VM Comparison Summary

| SKU | CPU | RAM (GB) | Storage (GB) |  ACU |  Approx. Price per ACU vs D2v2|
|----------|------|-----|---------|--------|----------|
|D2av4|AMD EPYCTM 7452| 8 |50 |230-260|-38%|
|E2av4|AMD EPYCTM 7452| 16 |50 |230-260|-19%|
|F2sv2|Intel Xeon® Platinum 8168 (SkyLake)| 4 |16 |195-210|-37%|
|D2v3|Intel Xeon® E5-2673 v3 (Haswell) processor or<pr> E5-2673 v4 (Broadwell)| 8 |50 |160-190|-14%|
|D2v2|Intel Xeon® E5-2673 v3 (Haswell) processor or<pr> E5-2673 v4 (Broadwell)| 8 |100 |210-150|0%|
|A2v2|Various| 4 |20 |100|+51%|

## Alternative VMs

- The Fsv2-series is based on the Intel® Xeon® Platinum 8168 processor. It features a sustained all core Turbo clock speed of 3.4 GHz and a maximum single-core turbo frequency of 3.7 GHz. Intel® AVX-512 instructions are new on Intel Scalable Processors. These instructions provide up to a 2X performance boost to vector processing workloads on both single and double precision floating point operations. In other words, they're really fast for any computational workload. At a lower per-hour list price, the Fsv2-series is the best value in price-performance in the Azure portfolio based on the Azure Compute Unit (ACU) per vCPU.
- The Dv2-series VMs features a  powerful CPU and optimal CPU-to-memory configuration making them suitable for most production workloads. The Dv2-series is about 35% faster than the D-series. Dv2-series runs on the Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with the Intel Turbo Boost Technology 2.0.
- The Av2-series VMs can be deployed on a variety of hardware types and processors. The size is throttled, based upon the hardware, to offer consistent processor performance for the running instance, regardless of the hardware it is deployed on.

> [!NOTE]
> The following prices are *per virtual machine compute hour*.

## <a id="vmhourlyrates"></a>VM Hourly Rates

| Recommended | Alternative |
|----------|------|
 |  [Dasv4](#dasv4), [Dav4](#dav4), [Easv4](#easv4), [Eav4](#eav4)  |  [Fsv2](#fsv2), [Fv1](#fv1), [Dsv3](#dsv3), [Dv3](#dv3), [Dsv2](#dsv2) ,[Dv2](#dv2), [Av2](#av2) |

### <a id="av2"></a>Av2
Av2 Standard is the latest generation of A-series virtual machines with similar CPU performance and faster disk. These virtual machines are suitable for development workloads, build servers, code repositories, low-traffic websites and web applications, micro services, early product experiments, and small databases. Like the prior A Standard generation, Av2 virtual machines will include load balancing and auto-scaling at no additional charge.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0396/hour | $0.0594/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.0836/hour | $0.1243/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.1749/hour | $0.2618/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.3663/hour | $0.55/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0473/hour | $0.0715/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1001/hour | $0.1496/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.3146/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.66/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.044/hour | $0.0649/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.0913/hour | $0.1375/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.1925/hour | $0.2882/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4037/hour | $0.605/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0451/hour | $0.0682/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.0957/hour | $0.143/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2013/hour | $0.3014/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4213/hour | $0.6325/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0451/hour | $0.0682/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.0957/hour | $0.143/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2013/hour | $0.3014/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4213/hour | $0.6325/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.055/hour | $0.0836/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1166/hour | $0.1749/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2442/hour | $0.3663/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.5137/hour | $0.77/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0517/hour | $0.077/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1078/hour | $0.1617/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2266/hour | $0.341/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4763/hour | $0.715/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0475/hour | $0.0981/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1003/hour | $0.2013/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2101/hour | $0.4125/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.44/hour | $0.8448/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0671/hour | $0.1012/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1419/hour | $0.2123/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.297/hour | $0.4455/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.6237/hour | $0.935/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.053/hour | $0.1036/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1122/hour | $0.2134/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2343/hour | $0.4367/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4906/hour | $0.8954/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.055/hour | $0.0836/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1166/hour | $0.1749/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2442/hour | $0.3663/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.5137/hour | $0.77/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.055/hour | $0.0836/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1166/hour | $0.1749/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2442/hour | $0.3663/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.5137/hour | $0.77/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0539/hour | $0.0891/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1122/hour | $0.187/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2354/hour | $0.3916/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.495/hour | $0.8228/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0594/hour | $0.0891/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1243/hour | $0.187/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2618/hour | $0.3927/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.55/hour | $0.825/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0594/hour | $0.0891/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1243/hour | $0.187/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2618/hour | $0.3927/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.55/hour | $0.825/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.055/hour | $0.0836/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1166/hour | $0.1749/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2442/hour | $0.3663/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.5137/hour | $0.77/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | A1v2 | 1 | 2 GiB | 10 GiB | $0.0495/hour | $0.0748/hour | 
 | A2v2 | 2 | 4 GiB | 20 GiB | $0.1045/hour | $0.1562/hour | 
 | A4v2 | 4 | 8 GiB | 40 GiB | $0.2178/hour | $0.3278/hour | 
 | A8v2 | 8 | 16 GiB | 80 GiB | $0.4587/hour | $0.6875/hour | 
### <a id="dv2"></a>Dv2
The Dv2-series virtual machines run on the Intel® Xeon® Platinum 8272CL processor (second generation Intel® Xeon® Scalable processors), Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with the Intel Turbo Boost Technology 2.0. The D1-5 v2 sizes offer a balanced combination of vCPU(s), memory, and local disk for most production workloads.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0803/hour | $0.1386/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1606/hour | $0.2772/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3223/hour | $0.5544/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6435/hour | $1.1088/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0627/hour | $0.1287/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1254/hour | $0.2574/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2519/hour | $0.5148/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5038/hour | $1.0296/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.0076/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.077/hour | $0.1386/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.154/hour | $0.2772/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3069/hour | $0.5544/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6149/hour | $1.1088/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.2287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0627/hour | $0.1287/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1254/hour | $0.2574/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2519/hour | $0.5148/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5038/hour | $1.0296/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.0076/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0803/hour | $0.1386/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1606/hour | $0.2772/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3223/hour | $0.5544/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6435/hour | $1.1088/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0803/hour | $0.1386/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1606/hour | $0.2772/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3223/hour | $0.5544/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6435/hour | $1.1088/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.07/hour | $0.1287/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1397/hour | $0.2574/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2794/hour | $0.5148/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5599/hour | $1.0296/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.1187/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.07/hour | $0.1287/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1397/hour | $0.2574/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2794/hour | $0.5148/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5599/hour | $1.0296/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.1187/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0724/hour | $0.1276/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1452/hour | $0.2552/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2893/hour | $0.5115/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5797/hour | $1.0219/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.1583/hour | $2.0438/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0747/hour | $0.1463/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1496/hour | $0.2926/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.2992/hour | $0.5863/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.5984/hour | $1.1726/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.1957/hour | $2.3441/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0965/hour | $0.1617/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1925/hour | $0.3234/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3861/hour | $0.6468/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.7722/hour | $1.2936/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.5444/hour | $2.5861/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0924/hour | $0.143/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1859/hour | $0.2871/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3707/hour | $0.5731/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.7425/hour | $1.1473/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.485/hour | $2.2946/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0756/hour | $0.1265/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1507/hour | $0.2519/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3025/hour | $0.5049/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.605/hour | $1.0098/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.2089/hour | $2.0185/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0942/hour | $0.1452/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1881/hour | $0.2893/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3773/hour | $0.5797/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.7535/hour | $1.1583/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.507/hour | $2.3166/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0844/hour | $0.1353/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1683/hour | $0.2695/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3377/hour | $0.5401/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6754/hour | $1.0802/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.3497/hour | $2.1593/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0924/hour | $0.154/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1848/hour | $0.3091/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3696/hour | $0.6182/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.7403/hour | $1.2353/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.4795/hour | $2.4695/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0856/hour | $0.154/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1714/hour | $0.3091/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3421/hour | $0.6182/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6853/hour | $1.2353/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.3706/hour | $2.4695/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0907/hour | $0.1419/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1815/hour | $0.2827/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.363/hour | $0.5654/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.726/hour | $1.1308/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.4531/hour | $2.2627/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.1122/hour | $0.1496/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.2255/hour | $0.3003/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.4499/hour | $0.6006/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.8998/hour | $1.2001/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.7996/hour | $2.4013/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.1001/hour | $0.1441/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.2002/hour | $0.2893/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.4015/hour | $0.5786/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.8019/hour | $1.1561/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.6049/hour | $2.3122/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.1177/hour | $0.1837/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.2354/hour | $0.3663/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.4708/hour | $0.7337/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.9427/hour | $1.4663/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.8854/hour | $2.9326/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1v2 | 1 | 3.5 GiB | 50 GiB | $0.0868/hour | $0.1595/hour | 
 | D2v2 | 2 | 7 GiB | 100 GiB | $0.1738/hour | $0.319/hour | 
 | D4v2 | 4 | 14 GiB | 200 GiB | $0.3476/hour | $0.638/hour | 
 | D8v2 | 8 | 28 GiB | 400 GiB | $0.6941/hour | $1.2749/hour | 
 | D16v2 | 16 | 56 GiB | 800 GiB | $1.3893/hour | $2.5498/hour | 
### <a id="dsv2"></a>Dsv2
The Dsv2-series virtual machines run on the Intel® Xeon® Platinum 8272CL processor (second generation Intel® Xeon® Scalable processors), Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with the Intel Turbo Boost Technology 2.0 and support Premium SSDs disk storage. The Dsv2-series sizes offer a balanced combination of vCPU(s), memory, and local disk for most production workloads.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0803/hour | $0.1386/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1606/hour | $0.2772/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3223/hour | $0.5544/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6435/hour | $1.1088/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0627/hour | $0.1287/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1254/hour | $0.2574/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2519/hour | $0.5148/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5038/hour | $1.0296/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.0076/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.077/hour | $0.1386/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.154/hour | $0.2772/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3069/hour | $0.5544/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6149/hour | $1.1088/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.2287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0627/hour | $0.1287/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1254/hour | $0.2574/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2519/hour | $0.5148/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5038/hour | $1.0296/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.0076/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0803/hour | $0.1386/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1606/hour | $0.2772/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3223/hour | $0.5544/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6435/hour | $1.1088/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0803/hour | $0.1386/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1606/hour | $0.2772/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3223/hour | $0.5544/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6435/hour | $1.1088/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.287/hour | $2.2176/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.07/hour | $0.1287/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1397/hour | $0.2574/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2794/hour | $0.5148/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5599/hour | $1.0296/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.1187/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.07/hour | $0.1287/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1397/hour | $0.2574/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2794/hour | $0.5148/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5599/hour | $1.0296/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.1187/hour | $2.0592/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0724/hour | $0.1276/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1452/hour | $0.2552/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2893/hour | $0.5115/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5797/hour | $1.0219/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.1583/hour | $2.0438/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0747/hour | $0.1463/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1496/hour | $0.2926/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.2992/hour | $0.5863/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.5984/hour | $1.1726/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.1957/hour | $2.3441/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0965/hour | $0.1617/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1925/hour | $0.3234/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3861/hour | $0.6468/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.7722/hour | $1.2936/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.5444/hour | $2.5861/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0924/hour | $0.143/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1859/hour | $0.2871/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3707/hour | $0.5731/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.7425/hour | $1.1473/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.485/hour | $2.2946/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0756/hour | $0.1265/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1507/hour | $0.2519/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3025/hour | $0.5049/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.605/hour | $1.0098/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.2089/hour | $2.0185/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0942/hour | $0.1452/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1881/hour | $0.2893/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3773/hour | $0.5797/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.7535/hour | $1.1583/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.507/hour | $2.3166/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0844/hour | $0.1353/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1683/hour | $0.2695/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3377/hour | $0.5401/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6754/hour | $1.0802/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.3497/hour | $2.1593/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0924/hour | $0.154/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1848/hour | $0.3091/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3696/hour | $0.6182/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.7403/hour | $1.2353/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.4795/hour | $2.4695/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0856/hour | $0.154/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1714/hour | $0.3091/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3421/hour | $0.6182/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6853/hour | $1.2353/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.3706/hour | $2.4695/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0907/hour | $0.1419/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1815/hour | $0.2827/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.363/hour | $0.5654/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.726/hour | $1.1308/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.4531/hour | $2.2627/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.1122/hour | $0.1496/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.2255/hour | $0.3003/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.4499/hour | $0.6006/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.8998/hour | $1.2001/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.7996/hour | $2.4013/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0/hour | $0.1441/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0/hour | $0.2893/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0/hour | $0.5786/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0/hour | $1.1561/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $0/hour | $2.3122/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.1177/hour | $0.1837/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.2354/hour | $0.3663/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.4708/hour | $0.7337/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.9427/hour | $1.4663/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.8854/hour | $2.9326/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D1sv2 | 1 | 3.5 GiB | 7 GiB | $0.0868/hour | $0.1595/hour | 
 | D2sv2 | 2 | 7 GiB | 14 GiB | $0.1738/hour | $0.319/hour | 
 | D4sv2 | 4 | 14 GiB | 28 GiB | $0.3476/hour | $0.638/hour | 
 | D8sv2 | 8 | 28 GiB | 56 GiB | $0.6941/hour | $1.2749/hour | 
 | D16sv2 | 16 | 56 GiB | 112 GiB | $1.3893/hour | $2.5498/hour | 

### <a id="dv3"></a>Dv3
The Dv3-series virtual machines run on the Intel® Xeon® Platinum 8272CL processor (second generation Intel® Xeon® Scalable processors), Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors in a hyper-threaded configuration. The Dv3-series sizes offer a combination of vCPU(s), memory, and local disk well suited for most production workloads.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1287/hour | $0.2299/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2574/hour | $0.4598/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.5148/hour | $0.9196/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.0296/hour | $1.8392/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.121/hour | $0.2321/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.242/hour | $0.4642/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.484/hour | $0.9295/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.11/hour | $0.2112/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.22/hour | $0.4224/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.44/hour | $0.8448/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.88/hour | $1.6896/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.121/hour | $0.2321/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.242/hour | $0.4642/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.484/hour | $0.9295/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.121/hour | $0.2321/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.242/hour | $0.4642/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.484/hour | $0.9295/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1177/hour | $0.2189/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2354/hour | $0.4378/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.4708/hour | $0.8756/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.9416/hour | $1.7512/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.132/hour | $0.2332/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.264/hour | $0.4664/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.528/hour | $0.9328/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1232/hour | $0.2244/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2464/hour | $0.4488/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.4928/hour | $0.8976/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.9856/hour | $1.7952/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1155/hour | $0.2167/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.231/hour | $0.4334/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.462/hour | $0.8668/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $0.924/hour | $1.7336/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.132/hour | $0.2332/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.264/hour | $0.4664/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.528/hour | $0.9328/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1749/hour | $0.2761/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.3498/hour | $0.5522/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.6996/hour | $1.1044/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.3992/hour | $2.2088/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1397/hour | $0.2409/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2794/hour | $0.4818/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.5588/hour | $0.9636/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1176/hour | $1.9272/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1375/hour | $0.2387/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.275/hour | $0.4774/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.55/hour | $0.9548/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1/hour | $1.9096/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1375/hour | $0.2387/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.275/hour | $0.4774/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.55/hour | $0.9548/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1/hour | $1.9096/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1353/hour | $0.2365/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2706/hour | $0.473/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.5412/hour | $0.946/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.0824/hour | $1.892/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1419/hour | $0.2431/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2838/hour | $0.4862/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.5676/hour | $0.9724/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1352/hour | $1.9448/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.2002/hour | $0.2431/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.4015/hour | $0.4862/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.8019/hour | $0.9724/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.6049/hour | $1.9448/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1452/hour | $0.2464/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.2904/hour | $0.4928/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.5808/hour | $0.9856/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1616/hour | $1.9712/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2v3 | 2 | 8 GiB | 50 GiB | $0.1375/hour | $0.2387/hour | 
 | D4v3 | 4 | 16 GiB | 100 GiB | $0.275/hour | $0.4774/hour | 
 | D8v3 | 8 | 32 GiB | 200 GiB | $0.55/hour | $0.9548/hour | 
 | D16v3 | 16 | 64 GiB | 400 GiB | $1.1/hour | $1.9096/hour | 
### <a id="dsv3"></a>Dsv3
The Dsv3-series support premium storage and run on the Intel® Xeon® Platinum 8272CL processor (second generation Intel® Xeon® Scalable processors), Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with Intel Turbo Boost Technology 2.0 and feature Intel® Hyper-Threading Technology. The Dsv3-series sizes offer a combination of vCPU(s), memory, and temporary storage well suited for most production workloads.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1287/hour | $0.2299/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2574/hour | $0.4598/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.5148/hour | $0.9196/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.0296/hour | $1.8392/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.121/hour | $0.2321/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.242/hour | $0.4642/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.484/hour | $0.9295/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.11/hour | $0.2112/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.22/hour | $0.4224/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.44/hour | $0.8448/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.88/hour | $1.6896/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.121/hour | $0.2321/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.242/hour | $0.4642/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.484/hour | $0.9295/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.121/hour | $0.2321/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.242/hour | $0.4642/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.484/hour | $0.9295/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.968/hour | $1.859/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1177/hour | $0.2189/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2354/hour | $0.4378/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.4708/hour | $0.8756/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.9416/hour | $1.7512/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.132/hour | $0.2332/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.264/hour | $0.4664/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.528/hour | $0.9328/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1232/hour | $0.2244/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2464/hour | $0.4488/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.4928/hour | $0.8976/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.9856/hour | $1.7952/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1155/hour | $0.2167/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.231/hour | $0.4334/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.462/hour | $0.8668/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $0.924/hour | $1.7336/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.132/hour | $0.2332/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.264/hour | $0.4664/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.528/hour | $0.9328/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1749/hour | $0.2761/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.3498/hour | $0.5522/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.6996/hour | $1.1044/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.3992/hour | $2.2088/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1397/hour | $0.2409/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2794/hour | $0.4818/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.5588/hour | $0.9636/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1176/hour | $1.9272/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1375/hour | $0.2387/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.275/hour | $0.4774/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.55/hour | $0.9548/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1/hour | $1.9096/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1375/hour | $0.2387/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.275/hour | $0.4774/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.55/hour | $0.9548/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1/hour | $1.9096/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1353/hour | $0.2365/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2706/hour | $0.473/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.5412/hour | $0.946/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.0824/hour | $1.892/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1419/hour | $0.2431/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2838/hour | $0.4862/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.5676/hour | $0.9724/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1352/hour | $1.9448/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.2002/hour | $0.2431/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.4015/hour | $0.4862/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.8019/hour | $0.9724/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.6049/hour | $1.9448/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1452/hour | $0.2464/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.2904/hour | $0.4928/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.5808/hour | $0.9856/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1616/hour | $1.9712/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2sv3 | 2 | 8 GiB | 16 GiB | $0.1375/hour | $0.2387/hour | 
 | D4sv3 | 4 | 16 GiB | 32 GiB | $0.275/hour | $0.4774/hour | 
 | D8sv3 | 8 | 32 GiB | 64 GiB | $0.55/hour | $0.9548/hour | 
 | D16sv3 | 16 | 64 GiB | 128 GiB | $1.1/hour | $1.9096/hour | 
 
### <a id="fv1"></a>Fv1
The F-series virtual machines feature 2-GiB RAM and 16 GiB of local SSD temporary storage per CPU core and are optimized for compute intensive workloads. The F-series sizes are based Intel® Xeon® Platinum 8272CL processor (second generation Intel® Xeon® Scalable processors), Intel® Xeon® 8171M 2.1GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processor. These virtual machines are suitable for scenarios like batch processing, web servers, analytics, and gaming.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1089/hour | $0.2112/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2189/hour | $0.4213/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4378/hour | $0.8426/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8756/hour | $1.6852/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1089/hour | $0.2112/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2189/hour | $0.4213/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4378/hour | $0.8426/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8756/hour | $1.6852/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1364/hour | $0.2376/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2739/hour | $0.4763/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5478/hour | $0.9526/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.0956/hour | $1.9052/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1089/hour | $0.2112/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2189/hour | $0.4213/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4378/hour | $0.8426/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8756/hour | $1.6852/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1199/hour | $0.2321/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2409/hour | $0.4631/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4818/hour | $0.9262/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.9625/hour | $1.8535/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1089/hour | $0.2112/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2189/hour | $0.4213/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4378/hour | $0.8426/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8756/hour | $1.6852/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1199/hour | $0.2255/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2409/hour | $0.4521/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4818/hour | $0.9042/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.9625/hour | $1.8084/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1199/hour | $0.2255/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2409/hour | $0.4521/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4818/hour | $0.9042/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.9625/hour | $1.8084/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1243/hour | $0.2244/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2486/hour | $0.4488/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4972/hour | $0.8976/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.9955/hour | $1.7952/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1254/hour | $0.2266/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2497/hour | $0.4521/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4994/hour | $0.9042/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.9999/hour | $1.8095/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1111/hour | $0.2123/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2222/hour | $0.4246/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4444/hour | $0.8492/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8888/hour | $1.6984/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1087/hour | $0.2112/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2178/hour | $0.4213/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4345/hour | $0.8426/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.869/hour | $1.6852/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1309/hour | $0.2321/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2629/hour | $0.4653/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5258/hour | $0.9306/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.0505/hour | $1.8601/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1584/hour | $0.2442/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.3157/hour | $0.4884/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.6314/hour | $0.9757/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.2628/hour | $1.9514/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1463/hour | $0.2475/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2937/hour | $0.4961/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5863/hour | $0.9911/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.1726/hour | $1.9822/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.143/hour | $0.2442/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.286/hour | $0.4884/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5731/hour | $0.9779/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.1462/hour | $1.9547/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.143/hour | $0.2442/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.286/hour | $0.4884/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5731/hour | $0.9779/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.1462/hour | $1.9547/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1122/hour | $0.2035/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2244/hour | $0.407/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.4488/hour | $0.814/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $0.8976/hour | $1.6269/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1386/hour | $0.2398/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2772/hour | $0.4796/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5544/hour | $0.9592/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1386/hour | $0.2398/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2772/hour | $0.4796/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5544/hour | $0.9592/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1584/hour | $0.2849/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.3179/hour | $0.5698/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.6358/hour | $1.1396/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.2705/hour | $2.2792/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2v1 | 2 | 4 GiB | 32 GiB | $0.1265/hour | $0.2277/hour | 
 | F4v1 | 4 | 8 GiB | 64 GiB | $0.2541/hour | $0.4565/hour | 
 | F8v1 | 8 | 16 GiB | 128 GiB | $0.5082/hour | $0.913/hour | 
 | F16v1 | 16 | 32 GiB | 256 GiB | $1.0164/hour | $1.826/hour | 
### <a id="fsv2"></a>Fsv2
The Fsv2-series virtual machines provide 2-GiB of RAM and 8 GB of local temporary storage (SSD) per vCPU(s) and are optimized for compute intensive workloads. The Fsv2-series VMs are hyper-threaded and based on the Intel® Xeon® Platinum 8272CL (second generation Intel® Xeon® Scalable processors), or the Intel Xeon® Platinum 8168 (Skylake) processor. These virtual machines are ideal for scenarios like batch processing, web servers, analytics, and gaming.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.0931/hour | $0.1793/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.1859/hour | $0.3586/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.3718/hour | $0.7161/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.7447/hour | $1.4322/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.0931/hour | $0.1793/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.1859/hour | $0.3586/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.3718/hour | $0.7161/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.7447/hour | $1.4322/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1166/hour | $0.2178/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2332/hour | $0.4356/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4664/hour | $0.8712/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.9328/hour | $1.7424/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.0931/hour | $0.1793/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.1859/hour | $0.3586/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.3718/hour | $0.7161/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.7447/hour | $1.4322/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1122/hour | $0.2134/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2244/hour | $0.4268/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4488/hour | $0.8536/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8976/hour | $1.7072/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.0935/hour | $0.1947/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.187/hour | $0.3894/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.374/hour | $0.7788/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.748/hour | $1.5576/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1122/hour | $0.2134/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2244/hour | $0.4268/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4488/hour | $0.8536/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8976/hour | $1.7072/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1122/hour | $0.2134/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2244/hour | $0.4268/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4488/hour | $0.8536/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8976/hour | $1.7072/hour | 
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1067/hour | $0.2035/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2134/hour | $0.407/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4268/hour | $0.814/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8536/hour | $1.6291/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1111/hour | $0.2123/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2222/hour | $0.4246/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4444/hour | $0.8492/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8888/hour | $1.6984/hour | 
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.0935/hour | $0.1947/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.187/hour | $0.3894/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.374/hour | $0.7788/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.748/hour | $1.5576/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1122/hour | $0.2134/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2244/hour | $0.4268/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4488/hour | $0.8536/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8976/hour | $1.7072/hour | 
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1441/hour | $0.2453/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2882/hour | $0.4906/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.5764/hour | $0.9812/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $1.1528/hour | $1.9624/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1254/hour | $0.2266/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2508/hour | $0.4532/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.5016/hour | $0.9064/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $1.0021/hour | $1.8117/hour | 
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1221/hour | $0.2233/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2442/hour | $0.4466/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4884/hour | $0.8932/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.9768/hour | $1.7864/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1221/hour | $0.2233/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2453/hour | $0.4477/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4895/hour | $0.8943/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.9801/hour | $1.7897/hour | 
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1177/hour | $0.2189/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2354/hour | $0.4378/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4708/hour | $0.8756/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.9416/hour | $1.7512/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1287/hour | $0.2299/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2585/hour | $0.4609/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.5159/hour | $0.9207/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $1.0318/hour | $1.8414/hour | 
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1188/hour | $0.22/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2376/hour | $0.44/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4752/hour | $0.88/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.9504/hour | $1.76/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | F2sv2 | 2 | 4 GiB | 16 GiB | $0.1078/hour | $0.1936/hour | 
 | F4sv2 | 4 | 8 GiB | 32 GiB | $0.2156/hour | $0.3883/hour | 
 | F8sv2 | 8 | 16 GiB | 64 GiB | $0.4312/hour | $0.7766/hour | 
 | F16sv2 | 16 | 32 GiB | 128 GiB | $0.8624/hour | $1.5521/hour | 
### <a id="dav4"></a>Dav4
The Das v4-series VMs support Premium SSD disk storage and are based on the 2.35Ghz AMD EPYCTM 7452 processor, which can achieve up to 3.35GHz. The Das v4 VM sizes offer a combination of vCPUs, memory and temporary storage able to meet the requirements associated with most production workloads.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1232/hour | $0.2244/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2464/hour | $0.4488/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4928/hour | $0.8976/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.9856/hour | $1.7952/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1056/hour | $0.2068/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2112/hour | $0.4136/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4224/hour | $0.8272/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1188/hour | $0.22/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2387/hour | $0.4411/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4774/hour | $0.8822/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.9548/hour | $1.7644/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1265/hour | $0.2277/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.253/hour | $0.4554/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.5071/hour | $0.9119/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.0142/hour | $1.8238/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1265/hour | $0.2277/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.253/hour | $0.4554/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.5071/hour | $0.9119/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.0142/hour | $1.8238/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1177/hour | $0.2189/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2354/hour | $0.4378/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.4708/hour | $0.8756/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.9416/hour | $1.7512/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1265/hour | $0.2277/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.253/hour | $0.4554/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.506/hour | $0.9108/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.012/hour | $1.8216/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.0684/hour | $0.1808/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.1356/hour | $0.3606/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.2714/hour | $0.7212/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $0.5426/hour | $1.4422/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1683/hour | $0.2695/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.3366/hour | $0.539/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.6732/hour | $1.078/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.3464/hour | $2.156/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.132/hour | $0.2332/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.264/hour | $0.4664/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.528/hour | $0.9328/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1298/hour | $0.231/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2596/hour | $0.462/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.5192/hour | $0.924/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.0384/hour | $1.848/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1364/hour | $0.2376/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2728/hour | $0.4752/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.5456/hour | $0.9504/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.0912/hour | $1.9008/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.1452/hour | $0.2464/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.2904/hour | $0.4928/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.5808/hour | $0.9856/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.1616/hour | $1.9712/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2av4 | 2 | 8 GiB | 50 GiB | $0.132/hour | $0.2332/hour | 
 | D4av4 | 4 | 16 GiB | 100 GiB | $0.264/hour | $0.4664/hour | 
 | D8av4 | 8 | 32 GiB | 200 GiB | $0.528/hour | $0.9328/hour | 
 | D16av4 | 16 | 64 GiB | 400 GiB | $1.056/hour | $1.8656/hour | 
### <a id="dasv4"></a>Dasv4
The Da v4-series VMs are based on the 2.35Ghz AMD EPYCTM 7452 processor, which can achieve up to 3.35GHz. The Dav4 VM sizes offer a combination of vCPU(s), memory and temporary storage able to meet the requirements associated with most production workloads. Data disk storage is billed separately from virtual machines. To use Premium SSD disk storage, select the Das v4 VMs.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1232/hour | $0.2244/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2464/hour | $0.4488/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4928/hour | $0.8976/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.9856/hour | $1.7952/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1056/hour | $0.2068/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2112/hour | $0.4136/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4224/hour | $0.8272/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.8448/hour | $1.6544/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1188/hour | $0.22/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2387/hour | $0.4411/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4774/hour | $0.8822/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.9548/hour | $1.7644/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1265/hour | $0.2277/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.253/hour | $0.4554/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.5071/hour | $0.9119/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.0142/hour | $1.8238/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1265/hour | $0.2277/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.253/hour | $0.4554/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.5071/hour | $0.9119/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.0142/hour | $1.8238/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1177/hour | $0.2189/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2354/hour | $0.4378/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.4708/hour | $0.8756/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.9416/hour | $1.7512/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1265/hour | $0.2277/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.253/hour | $0.4554/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.506/hour | $0.9108/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.012/hour | $1.8216/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.0684/hour | $0.1808/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.1356/hour | $0.3606/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.2714/hour | $0.7212/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $0.5426/hour | $1.4422/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1683/hour | $0.2695/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.3366/hour | $0.539/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.6732/hour | $1.078/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.3464/hour | $2.156/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.132/hour | $0.2332/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.264/hour | $0.4664/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.528/hour | $0.9328/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.056/hour | $1.8656/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1298/hour | $0.231/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2596/hour | $0.462/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.5192/hour | $0.924/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.0384/hour | $1.848/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1364/hour | $0.2376/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2728/hour | $0.4752/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.5456/hour | $0.9504/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.0912/hour | $1.9008/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.1452/hour | $0.2464/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.2904/hour | $0.4928/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.5808/hour | $0.9856/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.1616/hour | $1.9712/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | D2asv4 | 2 | 8 GiB | 16 GiB | $0.132/hour | $0.2332/hour | 
 | D4asv4 | 4 | 16 GiB | 32 GiB | $0.264/hour | $0.4664/hour | 
 | D8asv4 | 8 | 32 GiB | 64 GiB | $0.528/hour | $0.9328/hour | 
 | D16asv4 | 16 | 64 GiB | 128 GiB | $1.056/hour | $1.8656/hour | 

### <a id="eav4"></a>Eav4
The Ea v4-series VMs are based on the 2.35Ghz AMD EPYCTM 7452 processor, which can achieve up to 3.35GHz. The Ea v4-series VMs are ideal for memory-intensive enterprise applications. Data disk storage is billed separately from virtual machines. 
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1386/hour | $0.2398/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.2772/hour | $0.4796/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.5544/hour | $0.9592/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1386/hour | $0.2398/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.2772/hour | $0.4796/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.5544/hour | $0.9592/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.154/hour | $0.2552/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.308/hour | $0.5104/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.616/hour | $1.0208/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.232/hour | $2.0416/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1386/hour | $0.2398/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.2772/hour | $0.4796/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.5544/hour | $0.9592/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1562/hour | $0.2574/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3135/hour | $0.5159/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.627/hour | $1.0318/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.2529/hour | $2.0625/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1661/hour | $0.2673/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3322/hour | $0.5346/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6655/hour | $1.0703/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.331/hour | $2.1406/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1661/hour | $0.2673/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3322/hour | $0.5346/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6655/hour | $1.0703/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.331/hour | $2.1406/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1551/hour | $0.2563/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3102/hour | $0.5126/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6204/hour | $1.0252/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.2408/hour | $2.0504/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1672/hour | $0.2684/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3344/hour | $0.5368/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6688/hour | $1.0736/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.088/hour | $0.2004/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.1748/hour | $0.3996/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.3496/hour | $0.7994/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $0.6992/hour | $1.5986/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.2211/hour | $0.3223/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.4422/hour | $0.6446/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.8844/hour | $1.2892/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.7688/hour | $2.5784/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1661/hour | $0.2673/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3322/hour | $0.5346/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6644/hour | $1.0692/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.3288/hour | $2.1384/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1672/hour | $0.2684/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3344/hour | $0.5368/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6688/hour | $1.0736/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1672/hour | $0.2684/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3344/hour | $0.5368/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6688/hour | $1.0736/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1837/hour | $0.2849/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3674/hour | $0.5698/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.7348/hour | $1.1396/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.4696/hour | $2.2792/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2av4 | 2 | 16 GiB | 50 GiB | $0.1672/hour | $0.2684/hour | 
 | E4av4 | 4 | 32 GiB | 100 GiB | $0.3344/hour | $0.5368/hour | 
 | E8av4 | 8 | 64 GiB | 200 GiB | $0.6688/hour | $1.0736/hour | 
 | E16av4 | 16 | 128 GiB | 400 GiB | $1.3376/hour | $2.1472/hour | 
### <a id="easv4"></a>Easv4
The Eas v4-series VMs support Premium SSD disk storage and are based on the 2.35Ghz AMD EPYCTM 7452 processor, which can achieve up to 3.35GHz. The Eas v4-series VMs are ideal for memory-intensive enterprise applications.
 
[back to top](#vmhourlyrates)
#### US East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1386/hour | $0.2398/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.2772/hour | $0.4796/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.5544/hour | $0.9592/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US East 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1386/hour | $0.2398/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.2772/hour | $0.4796/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.5544/hour | $0.9592/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.154/hour | $0.2552/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.308/hour | $0.5104/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.616/hour | $1.0208/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.232/hour | $2.0416/hour | 
 
[back to top](#vmhourlyrates)
#### US West 2
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1386/hour | $0.2398/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.2772/hour | $0.4796/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.5544/hour | $0.9592/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.1088/hour | $1.9184/hour | 
 
[back to top](#vmhourlyrates)
#### US Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1562/hour | $0.2574/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3135/hour | $0.5159/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.627/hour | $1.0318/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.2529/hour | $2.0625/hour | 
 
[back to top](#vmhourlyrates)
#### US North Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1661/hour | $0.2673/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3322/hour | $0.5346/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6655/hour | $1.0703/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.331/hour | $2.1406/hour | 
 
[back to top](#vmhourlyrates)
#### US South Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1661/hour | $0.2673/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3322/hour | $0.5346/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6655/hour | $1.0703/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.331/hour | $2.1406/hour | 
 
[back to top](#vmhourlyrates)
#### US West Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### North Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1551/hour | $0.2563/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3102/hour | $0.5126/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6204/hour | $1.0252/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.2408/hour | $2.0504/hour | 
 
[back to top](#vmhourlyrates)
#### West Europe
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1672/hour | $0.2684/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3344/hour | $0.5368/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6688/hour | $1.0736/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### France Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### India Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.088/hour | $0.2004/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.1748/hour | $0.3996/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.3496/hour | $0.7994/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $0.6992/hour | $1.5986/hour | 
 
[back to top](#vmhourlyrates)
#### UAE North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Brazil South
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.2211/hour | $0.3223/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.4422/hour | $0.6446/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.8844/hour | $1.2892/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.7688/hour | $2.5784/hour | 
 
[back to top](#vmhourlyrates)
#### South Africa North
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Australia East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1661/hour | $0.2673/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3322/hour | $0.5346/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6644/hour | $1.0692/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.3288/hour | $2.1384/hour | 
 
[back to top](#vmhourlyrates)
#### Australia South East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### Korea Central
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1672/hour | $0.2684/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3344/hour | $0.5368/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6688/hour | $1.0736/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### Japan East
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1672/hour | $0.2684/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3344/hour | $0.5368/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6688/hour | $1.0736/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.3376/hour | $2.1472/hour | 
 
[back to top](#vmhourlyrates)
#### Japan West
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 
[back to top](#vmhourlyrates)
#### East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1837/hour | $0.2849/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3674/hour | $0.5698/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.7348/hour | $1.1396/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.4696/hour | $2.2792/hour | 
 
[back to top](#vmhourlyrates)
#### South East Asia
| Instance | vCPU | RAM | Storage |  Linux |  Windows |
|----------|------|-----|---------|--------|----------|
 | E2asv4 | 2 | 16 GiB | 32 GiB | $0.1672/hour | $0.2684/hour | 
 | E4asv4 | 4 | 32 GiB | 64 GiB | $0.3344/hour | $0.5368/hour | 
 | E8asv4 | 8 | 64 GiB | 128 GiB | $0.6688/hour | $1.0736/hour | 
 | E16asv4 | 16 | 128 GiB | 256 GiB | $1.3376/hour | $2.1472/hour | 

## Network egress price by zone

Zone | Regions | $/GB of Network Egress
|-|-|-|
Zone 1| US East, West, Central, North Europe, West Europe, France Central | $0.05
Zone 2| East Asia, South East Asia, Australia East, Australia South East|  $0.08
Zone 3 |UAE North, India Central, South Africa North, Brazil South | $0.20
