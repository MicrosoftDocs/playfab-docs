---
title: Managing a build alias and allocating to it
author: joannaleecy
description: Describes how to allocate multiplayer game servers using the build alias feature.
ms.author: raakisad
ms.date: 09/30/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, tournaments, leaderboards, servers, debugging
ms.localizationpriority: medium
---

# Managing a build alias and allocating to it

A build alias is a management layer on top of builds, which allows calls to `RequestMultiplayerServer` to be distributed over multiple builds in a controlled fashion. This can improve the simplicity and reliability of build to build upgrades and several other scenarios listed below. Aliases achieve this by specifying a list of build ids along with the weight of each one. A build's weight sets how likely that build is to be tried first for each allocation request. For example, if Build 1 has a weight of 8 and Build 2 has a weight of 2, Build 1 is tried first for about 80% of requests, so it serves about 80% of them while it has StandingBy servers. If Build 1 runs out of StandingBy servers in a region, those requests go to Build 2 instead, so Build 2 can serve more than 20% of the requests in that region. The regions in each request come first, though, and the weights only decide which build serves a request within a region. For details, see [Fallback to other builds and regions](#fallback-to-other-builds-and-regions).

### Safe deployment that is backwards compatible
This is the most common scenario for a build to build upgrade, where you are updating the game server and retail clients are compatible with both servers.

Clients will reference Alias 1, which would have the following configuration:
- Build 1: Weight = 1

Once Build 2 is created, Alias 1 will be changed to be:
- Build 1: Weight = 8
- Build 2: Weight = 2

You can gradually change the weights until all new server requests are fulfilled by Build 2. At this point the weight for Build 1 is 0 and can be removed from the alias.

A typical use case for an alias is affinitizing them to a client compatibility version and game mode. For example "DeathMatch client 2.2 RETAIL." Aliases allow you to manage this higher-level abstraction while continuously updating the builds that power this experience. Aliases also make it easier for you to roll-back builds if necessary.

### Deployment that is not backwards compatible
In this case you want to update the game server at the same time you are updating game clients, as your current game clients are not compatible with the old server build. Transitioning from one build to another would be done as follows:

Old clients will reference Alias 1, which would have the following:
- Build 1: Weight = 1

Once Build 2 is created, new clients will reference Alias 2, which would have the following:
- Build 2: Weight = 1

In this scenario aliases are used similarly to builds, and their multiplexing functionality is not used. 

### Blast deployment that is backwards compatible

This is similar to the backwards compatible build to build upgrade scenario, but with a more sudden switch in demand behavior. Transitioning from one build to another would be done as follows:

Clients will reference Alias 1, which would have the following:
- Build 1: Weight = 1

Once Build 2 is created, Alias 1 will be changed to be:
- Build 1: Weight = 0
- Build 2: Weight = 1

### Testing a deployment that is backwards compatible
When you want to update the game server, and the client version is compatible with both servers, but you wants to test the second version before deploying it at scale for all players. Testing and transitioning from one build to another could be done as follows:

Clients will reference Alias 1, which would have the following:
- Build 1: Weight = 1

Once Build 2 is created. Testing clients would reference Alias 2, which would have the following:
- Build 2: Weight = 1

Once Build 2 is verified. Alias 1 will be changed to be:
- Build 1: Weight = 8
- Build 2: Weight = 2

Gradually build 2 would be weighted more and absorb all traffic.

## Fallback to other builds and regions

Aliases can make your multiplayer server deployments more resilient, by allowing for fallback across multiple builds. When you request a server from an alias, list every region that gives your players an acceptable experience in `PreferredRegions`, in order of preference. PlayFab Multiplayer Servers (MPS) handles each request as follows:

1. MPS uses the build weights to put the alias's builds in an order for the request. A build with a higher weight is more likely to come first.
1. MPS goes through your regions in the order you listed them. In each region, it tries every build in that order. It skips builds that aren't deployed in the region.
1. MPS allocates a server from the first build that has a StandingBy server. If no build has one in the region, MPS moves on to the next region. If no region has one, the request fails with the `MultiplayerServerTooManyRequests` error.

Region order always comes before build weights. Players get a server in the most preferred region that has capacity, and the weights only decide which build serves them in that region. Use the weights to express your cost and performance preferences between builds, for example between virtual machine (VM) sizes. Adding builds that cover more regions to an alias can only add capacity.

A build with a weight of 0 is never used for allocations, not even as a fallback. To keep a build as a fallback, give it a small nonzero weight instead, for example 1 against 999 for your main build.

If none of the alias's builds is deployed in any of the requested regions, the request fails with the `MultiplayerServerNotFound` error. For ways to avoid both errors, see [Best practices and launch checklist](best-practices.md).

For example, assume an allocation request targeting a build alias ranks EastUS as region #1, and West US as region #2. This build alias provides similar weights to two builds, Build 1 and Build 2.

Assume that Build 1 comes first in the order for a given allocation.

1. Allocation in East US for Build 1 is tried.
2. If #1 fails, allocation in East US for Build 2 is tried.
3. If #2 fails, allocation in WestUS for Build 1 is tried.
4. If #3 fails, allocation in WestUs for Build 2 is tried.

Especially as you gradually upgrade from one build to another, this fallback behavior is optimized so that players get the lowest latency server even if one of the builds is having trouble.


## Manage a build alias with PlayFab REST APIs
> [!Note]
> You can now manage build aliases in Game Manager. To get started, see [Builds overview page](build-overview.md)

1. Create a build alias by using the API.

    API:

    ```
    POST https://titleId.playfabapi.com/MultiplayerServer/CreateBuildAlias
    ```
    Sample body:
    ```
    {
        "AliasName":"TestingAlias",
        "BuildSelectionCriteria":
        [{
            "BuildWeightDistribution":{"9a8a4584-c81a-479c-9ef9-16d3743f7ca7":"1"}
        }]
    }
    ```
    Sample response:
    ```
    {
        "AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6",
        "AliasName":"TestingAlias",
        "BuildSelectionCriteria":
        [{
            "BuildWeightDistribution":{"9a8a4584-c81a-479c-9ef9-16d3743f7ca7":"1"}
        }]
    }
    ```

    **Build Alias Id is provided as part of the response.**

2. Update any parameter of the build alias.

    API:

    ```
    POST https://titleId.playfabapi.com/MultiplayerServer/UpdateBuildAlias
    ```
    Sample body:
    ```
    {
        "AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6",
        "AliasName":"TestingAliasRenamed",
        "BuildSelectionCriteria":
        [{
            "BuildWeightDistribution":{"9a8a4584-c81a-479c-9ef9-16d3743f7ca7":"1",
            "7ac7f347-3d61-9fe9-c974-a18c4854a8a9":"1"}
        }]
    }
    ```
    Sample response:
    ```
    {
        "AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6",
        "AliasName":"TestingAliasRenamed",
        "BuildSelectionCriteria":
        [{
            "BuildWeightDistribution":{"9a8a4584-c81a-479c-9ef9-16d3743f7ca7":"1",
            "7ac7f347-3d61-9fe9-c974-a18c4854a8a9":"1"}
        }]
    }
    ```

3. Delete a build alias.

    API:

    ```
    POST https://titleId.playfabapi.com/MultiplayerServer/DeleteBuildAlias
    ```
    Sample body:
    ```
    {
        "AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6"
    }
    ```

4. List build aliases.

    API:

    ```
    GET https://titleId.playfabapi.com/MultiplayerServer/ListBuildAliases
    ```
    Sample response:
    ```
    [{
        "AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6",
        "AliasName":"TestingAliasRenamed",
        "BuildSelectionCriteria":
        [{
            "BuildWeightDistribution":{"9a8a4584-c81a-479c-9ef9-16d3743f7ca7":"1",
            "7ac7f347-3d61-9fe9-c974-a18c4854a8a9":"1"}
        }]
    }]
    ```

## Allocate using a build alias

To allocate using a build alias one must simply specify the build alias Id in the `RequestMultiplayerServer` call.

API:
```
POST https://titleId.playfabapi.com/MultiplayerServer/RequestMultiplayerServer
```
Sample body:
```
{
    "SessionId":"6a07440c-7bcc-4e23-8b81-4934543ff966",
    "PreferredRegions":["SouthCentralUs"],
    "BuildAliasParams":
        {"AliasId":"97d2b0a5-7c04-4593-8451-66bbb97f94b6"}
}
```
