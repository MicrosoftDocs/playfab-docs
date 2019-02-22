---
title: Billing for PlayFab Multiplayer Servers 2.0
author: v-thopra
description: Describes how billing is done for PlayFab's multiplayer server hosting service (Thunderhead), which allows you to operate a dynamically scaling pool of custom game servers in Azure.
ms.author: v-thopra
ms.date: 01/15/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, billing, pricing
ms.localizationpriority: medium
---

# Billing for PlayFab Multiplayer Servers 2.0

Most PlayFab services, including PlayFab Multiplayer Matchmaking, are included with every paid PlayFab tier, as part of our core offering. However, PlayFab Multiplayer Servers is billed on a consumption basis. This document describes that billing plan.

## What comes with your basic PlayFab Core Services package?

A basic allocation of multiplayer server capacity is included with every paid PlayFab tier:

- 100 Av2 virtual machine hours
- 100 Dv2 virtual machine hours

This is typically *not* enough to launch a live game, but it can help you evaluate the service and get started.

To learn more about these different virtual machine please see [Azure VM Sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes).

> [!NOTE]
> Free evaluation capacity is provided per month by the PlayFab tier.  

| *Feature*|Essentials |Indie Studio |Professional | Enterprise
|-|-|-|-|-|
| **Av2 VM Hours** |Not included | 100 Av2 hours | 100 Av2 hours | 100 Av2 hours |
| **Dv2 VM Hours** |Not included | 100 Dv2 hours | 100 Dv2 hours | 100 Dv2 hours |
| **Maximum Av2 Cores** |Not included | 16 Av2 Cores | 16 Av2 Cores | 16 Av2 Cores |
| **Maximum Dv2 Cores** |Not included | 8 Dv2 Cores | 8 Dv2 Cores  | 8 Dv2 Cores |
| **Network Egress** |Not included | 100 GB | 100 GB | 100 GB |
| **Storage** |Not included | 50 GB | 50 GB | 50 GB |

## Consumption pricing for PlayFab Multiplayer Servers

Games that require Multiplayer Servers will need to purchase additional capacity through PlayFab’s consumption pricing plan. Below are the PlayFab resources used to bill for server utilization:

- **Virtual machine instance hours** - The hours of virtual machine time that your game servers are utilizing. Different virtual machine and container selections are priced at different rates. See [Multiplayer Servers detailed price sheet](multiplayer-servers-detailed-price-sheet.md) for more information.
- **Network egress** - The volume of data transmitted by your game servers to the Internet (in gigabytes). Network egress is billed at different rates depending on the originating data center.
- Storage - The storage used by PlayFab (in gigabytes) to host and replicate you game server assets and containers.

A typical monthly bill might be:

| *Line item*| Consumption |Unit |Rate | Sub-total
|-|-|-|-|-|
| Multiplayer Servers - D2v2 - US East | 1000 | VM Hours | $0.252 | $252.00 |
| Multiplayer Servers - D2v2 - US South Central | 1000 | VM Hours | $0.252 | $252.00 |
| Multiplayer Servers - D2v2 - US West | 1000 | VM Hours | $0.252 | $252.00 |
| Multiplayer Servers - D2v2 - West Europe | 1000 | VM Hours | $0.252 | $252.00 |
| Multiplayer Servers - D2v2 - Australia  East | 100 | VM Hours | $0.302 | $30.20 |
| Multiplayer Servers - D2v2 - East Asia |100 | VM Hours | $0.277 | $27.70 |
| Multiplayer Servers - Cloud Storage |10 | GB | $0.10 | $1.00 |
| Multiplayer - Data Egress - Zone 1 |1000 | GB | $0.05 | $50.00 |
| Multiplayer - Data Egress - Zone 2 |100 | GB | $0.08 | $8.00 |
| *Total* | |  |  | $1,124.90 |

## Estimating cost with an example

The primary inputs into your multiplayer server deployment are:

1. The amount of multiplayer activity (total user-minutes).
2. The number of users playing in a single session.
3. Compute, storage, and networking resources are required for a session.
4. Overhead for stand-by sessions.

An example:

| Input|  Definition|
|-|-|
|12 minutes| Average multiplayer gameplay minutes per user per month
|100,000 users| Unique users per month
|4 users| Average users per session

```
  12 User Minutes          100,000 Users        1 Session                  Session Minutes
------------------    × -----------------  ×   ------------   =  300,000  -----------------  
     User⁄Month               Month             4 Users                        Month
```

At 100,000 users, each averaging 12 user minutes per month, this comes out to 1.2 million user minutes. Dividing this number by the average users per session (4) results in 300,000 total session minutes used.

In this example we are packing 3 servers on a **2-core D2_v3** virtual machine:

| Input |Definition |
|-|-|
| 3 Servers|Servers per virtual machine |
|D2_v3 |Virtual machine size|

```
300,000 Server Minutes       1 D2_v3 VM        100,000 D2_v3 VM Minutes 
----------------------- x    ------------ =    ------------------------
         Month                3 Servers                Month
```

Since we are running 3 servers on our **D2_v3 VM**, we can divide the total session minutes used (300,000) by the number of servers (3) to figure out approximately how many **D2_v3 VM** minutes (100,000) have been used this month.

Traditional multiplayer server hosting may require you to pay for significant overhead capacity, to handle natural variation in player activity.

It is common for games to have higher levels of concurrency during the weekends and holiday that require you to "pre-pay" for more servers than necessary, as shown below.

![Multiplayer demand](media/tutorials/multiplayer-demand.png)

PlayFab Multiplayer Server builds will naturally scale with your player base: servers are transitioned to the active state by calling **RequestMultiplayerServer**, and are later recycled when your game server terminates (typically the end of a “multiplayer round”).

However, delivering this dynamic scaling with minimal allocation latency requires some overhead, which originates from 2 key sources:

1. **Standing by servers** - Players do not want to wait for servers, and PlayFab targets a 3 second response time for fulfilling a server request. PlayFab will maintain a set of standing-by servers to ensure that servers are immediately available. As this standing-by pool is consumed by new allocations, PlayFab initializes new standing-by sessions. The amount of standing-by sessions required is dependent on how fast new sessions are requested during peak utilization, and how quickly they can be created and initialized.

2. **Virtual machine fragmentation** - If you configure multiple sessions to be hosted on a single virtual machine, sometimes there may be extra standing-by capacity due to fragmentation. In our example of 3 sessions per virtual machine, a virtual machine at times may have only 1 active session, and the remaining two “spaces” will be added to the standing-by pool. Until the active session is terminated, the virtual machine *must stay online* - even if the additional standing-by capacity is not needed.

> [!NOTE]
> Typically, these sources of overhead increase the required compute-hours by *20%*.

### Calculating networking

Network egress can be a substantial expense, especially for large multiplayer sessions with many simultaneous connected players (32+). During development and testing, run your server locally to get an estimate of its network utilization during play.

| Input| Definition |
| -| - |
|1  | Megabytes per second transmitted from the server during active play|

```
300,000 Session Minutes × 60 Seconds/Minute × 1 MBPS/Session   = 18,000,000 MB
```

In this example, assume that testing shows that a multiplayer session sends 1 MB of data per second of active play.

Since we earlier calculated 300,000 server minutes used in a month, we can estimate that 300,000 users x 60 MB per minute equals 18,000,000 MB of data sent per month.

### Storage costs

Cloud storage for your uploaded assets and containers is the last billed resources for PlayFab multiplayer servers, and generally the cheapest element. The peak total file size of what you've uploaded over a month is summed and charged at $.10 per GB per month.

At 100,000 users, each averaging 12 user minutes per month, this comes out to 1.2 million user minutes. Dividing this number by the average users per session (4) results in 300,000 total session minutes used.

## How to pay

PlayFab offers three pathways for billing.

- **Billing through credit card.**
- **Billing through PlayFab invoicing.** This is ideal for many professional projects, but requires you to contact our [customer services group](https://playfab.com/contact/) to get set up.
- **Billing through Azure & Microsoft Enterprise Agreements.** This is ideal for organizations that may have a volume deal with **Azure** or another **Microsoft** product line. Please contact our [customer services group](https://playfab.com/contact/) or your **Azure** solutions specialist to learn more.

In all three options you will receive a detailed analysis of your multiplayer server activity in Game Manager. However - for **Azure/EA** customers - the final invoicing through **Azure** is simplified, and will show these high level line-items denominated in dollars:

- PlayFab Essential Services
- PlayFab Multiplayer Servers