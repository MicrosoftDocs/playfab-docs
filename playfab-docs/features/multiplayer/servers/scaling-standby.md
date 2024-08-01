---
title: Scaling Standby
author: joannaleecy
description: PlayFab’s scaling capabilities enable developers to adjust game server hosting capacity to meet actual player demand.
ms.author: joanlee
ms.date: 03/22/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, standby, servers, scaling, multiplayer
ms.localizationpriority: medium
---

# Scaling Standby
 PlayFab’s scaling capabilities enable developers to adjust game server hosting capacity to meet actual player demand. These controls help developers efficiently keep game server hosting costs low while maintaining enough capacity to quickly add new players to join multiplayer games with minimal to no waiting.

Scaling game servers is something developers think about after their game is successfully deployed and operating.  The controls demonstrated in this section helps developers define the elasticity of resource scaling while 
maintaining enough capacity to add new players with minimal to no waiting.

Servers in the propping and standing-by states are billed to your title, and you'll want to optimize these processes to reduce cost. Before we get to how you can calculate the standing by target here are some helpful terms to understand. 

## Terminology
Terms you should understand about scaling standby servers.

- **Target Standby** – Also commonly known as Standby Target and Standing by target, it is a value set by the platform that specifies the target number of standby servers to have available to avoid standby pool starvation.
- **Target Standby Floor**– A game developer configurable measure representing the minimum floor quantity of servers kept idle to fulfill demand for new game servers.
- **Actual Standby** – The quantity of standby servers reported by the Multiplayer Servers platform where its values are distinct between when Dynamic Standby is enabled versus when Dynamic Standby is disabled.
- **Pre-propping** - Azure and PlayFab must create the virtual machine, initialize its operating system, and configure its environment. PlayFab drives this pre-propping activity before the virtual machine is assigned to a customer and billed.
- **Propping** - The game servers assets must be loaded, and the game server application itself often needs some time to prepare for players.
- **Standing by** In order to immediately fulfill demand for a multiplayer server, some servers are kept idle ready for players constantly.


## Configuring target standby
You configure standing-by targets on a per build and per region basis. Typically you should set the standing-by level proportionally to the propping time and target allocation rate: 
**Standing by Target = (Propping Time + Server time to standing by) * Target Allocation Rate** 

For example, if a Linux server that takes 100 seconds to prop, and a game that is expected to have up to one server allocated every 5 seconds (0.2 servers/second). A standing by pool of 100 * 0.2 = 20 servers will stably support this build. After 100 seconds, 20 servers will be expended but there will have been time to build another 20. 

When calling the `RequestMultiplayerServer` API, it's important to indicate all of the regions that are acceptable to the player experience. If region #1 doesn't have a standing by server available, then region #2 will be requested and will continue for as many regions as you've configured.

## Scaling benefits

A summary of scaling benefits includes:

| Benefit  | Description  |
|---|---|
| Increase application availability  | Ensures that your game server pool always has the right number of VMs by proactively provisioning capacity |
| Lower compute costs  | Adds instances only when needed to optimize costs  |
| Scale instances across purchase options | Scaling options optimize performance across instance type, region, size and game server build configurations |

## Scaling methods

PlayFab offers multiple mechanisms to scale when and how to scale your servers.  Game developers have the flexibility of:

1. Configuring minimum & maximum thresholds
2. Customizing scale configurations per server build profiles such as (a) instance types, (b) VM size, or (c) regions
3. Managing change effortlessly from the developers’ portal or from the Multiplayer Servers RESTful API
4. Monitor scaling metrics in server & usage charts

The three methods to configure scaling of game servers are:

- Default
- Scheduled
- Dynamic

Each has a unique approach but trigger from a known or unknown state of player demand. The default method scales up to the max servers configured and scales down on sessions completed. In this mechanism, there’s no extra steps required by the developer. This is the simplest method where developers set a max server and standby limit so that PlayFab automatically shrinks and grows VMs by way of player demand.

| Controls  | Player Demand | Approach | Use Case | Yield |
|---|---|---|---|---|
| Default | Unpredictable  | Automatic | Normal game operation | Won't scale fast enough for spikes in traffic |
| Scheduled | Predictable | Planned | Planned event launch | Track schedule changes for shifts in player demand |
| Dynamic   | Unpredictable | Formulative | Sudden traffic spike | |

To fully embrace the breadth of scaling options, the following key concepts and terminology must be understood first.

### Key Concepts

- Scaling mechanisms control the number of standby server availability
- Standby servers are VM allocated servers with no active connected players. These will transition in accepting for player connections in response to RequestMultiplayerServer API call; they transition to a termination state when the game server process exits 
- Scaling mechanisms are uniquely applied at each region of a build
- Each scaling configuration is represented as a region override

## Standby pool starvation

PlayFab’s Multiplayer Servers provides a bank of standby servers. This helps to support immediate fulfillment of requests for more game servers in response to player demand. If the demand for extra servers grows faster than the time necessary to acquire and provision servers from the reserves, the pool of standby servers becomes depleted. The pool of available servers enters a “starvation” state and requests for game servers fail until more servers can be provisioned. The schedule standby and dynamic standby scaling methods automatically activate increased provisioning of game servers to meet player demand.