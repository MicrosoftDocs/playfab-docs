---
title: Multiplayer servers comparison
author: joannaleecy
description: Compare servers for PlayFab Multiplayer Server 2.0.
ms.author: joanlee
ms.date: 01/17/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, pricing
ms.localizationpriority: medium
---

# Multiplayer servers comparison

PlayFab Multiplayer Servers operate on most generally available Azure virtual machine (VM) sizes and regions. Here are some of the more popular series for game developers providing progressively faster processors. For pricing information, see [Multiplayer servers detailed pricing](https://playfab.com/mps-detailed-pricing/).

## Recommended VMs

- The Dav4 and Dasv4 series feature the AMD 2.35Ghz EPYCTM 7452 second generation processor in a multi-threaded configuration with up to 256 MB L3 cache. Each of the eight cores has 8 MB of dedicated L3 cache. The Dav4-series sizes offer a combination of vCPU, memory, and temporary storage that's suitable for most gaming workloads. The Dasv4 Azure VMs expose up to 96 vCPUs, 384 GBs of RAM, and 768 GBs of SSD-based storage. Furthermore, the Azure Performance Improvement team has tuned Dasv4 VMs to be the most stable, delivering the best price/performance ratio on Azure with no code changes needed.
- The Eav4 and Easv4-series utilize AMD's 2.35Ghz EPYCTM 7452 processor in a multi-threaded configuration with up to 256 MB L3 cache, increasing options for running most memory optimized workloads. The Eav4-series and Easv4-series have the same memory and disk configurations as the Ev3 and Esv3-series. They're ideal for memory-intensive applications. 

The Dasv4 is now the recommended SKU for running game servers in Azure. For customers currently on the Dv2, Fsv2, and Dv3 VMs, we highly recommend switching to Dasv4 as it offers the best ratio of price to CPU performance and more memory than the Fsv2.

## VM comparison summary

Comparison of the different PlayFab Multiplayer Servers 2 core SKUs.

| SKU | CPU | RAM (GB) | Storage (GB) |  ACU |  Approx. Price per ACU vs D2v2|
|----------|------|-----|---------|--------|----------|
|D2av4|AMD EPYCTM 7452| 8 |50 |230-260|-38%|
|E2av4|AMD EPYCTM 7452| 16 |50 |230-260|-19%|
|F2sv2|Intel Xeon® Platinum 8168 (SkyLake)| 4 |16 |195-210|-37%|
|D2v3|Intel Xeon® E5-2673 v3 (Haswell) processor or\<pr> E5-2673 v4 (Broadwell)| 8 |50 |160-190|-14%|
|D2v2|Intel Xeon® E5-2673 v3 (Haswell) processor or\<pr> E5-2673 v4 (Broadwell)| 8 |100 |210-150|0%|
|A2v2|Various| 4 |20 |100|+51%|

## Alternative VMs

- The Fsv2-series is based on the Intel® Xeon® Platinum 8168 processor. It features a sustained all core Turbo clock speed of 3.4 GHz and a maximum single-core turbo frequency of 3.7 GHz. Intel® AVX-512 instructions are new on Intel Scalable Processors. These instructions provide up to a 2X performance boost to vector processing workloads on both single and double precision floating point operations. In other words, they're fast for any computational workload. At a lower per-hour list price, the Fsv2-series is the best value in price-performance in the Azure portfolio based on the Azure Compute Unit (ACU) per vCPU.
- The Dv2-series VMs feature a  powerful CPU and optimal CPU-to-memory configuration making them suitable for most production workloads. The Dv2-series is about 35% faster than the D-series. Dv2-series runs on the Intel® Xeon® 8171M 2.1 GHz (Skylake), Intel® Xeon® E5-2673 v4 2.3 GHz (Broadwell), or the Intel® Xeon® E5-2673 v3 2.4 GHz (Haswell) processors with the Intel Turbo Boost Technology 2.0.
- The Av2-series VMs can be deployed on various hardware types and processors. The size is throttled based upon the hardware. This offers consistent processor performance for the running instance regardless of the hardware it's deployed on.

## See also

* [PlayFab Multiplayer Servers detailed pricing](https://playfab.com/mps-detailed-pricing/)
