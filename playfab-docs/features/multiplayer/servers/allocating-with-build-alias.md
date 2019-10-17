---
title: Managing a build alias and allocating to it
author: gufabre
description: Describes how to allocate multiplayer game servers using the build alias feature.
ms.author: gufabre
ms.date: 10/16/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, social, tournaments, leaderboards, servers, debugging
ms.localizationpriority: medium
---

# Managing a build alias and allocating to it

## What a build alias is

A build alias is a layer on top of builds, which allows allocation calls to be distributed over multiple builds instead of just one. This is achieved by specifying a list of build Ids along with the weight of each one; where the weight represents the ratio of the allocation calls that should be forwarded to the corresponding build.

Some scenarios where this ability proves to be useful:

1. **Safe deployment that is backwards compatible**
<br>When a customer needs to update the game server, and the client version is compatible with both servers. Transitioning from one build to another would be done as follows:
<br>
<br>Clients will reference Alias 1, which would have the following:
<br>Build 1: Weight 1 [Non-zero]
<br>Once Build 2 is created, Alias 1 will be changed to be:
<br>Build 1: Weight1
<br>Build 2: Weight2
<br>Where the weights will gradually change until Build 2 takes all the traffic. When Weight1 reaches 0, Build1 can be removed from it.
<br>Rollback:
<br>Add Build 1 back to Alias 1, also changing the weights to slowly transition or replacing Build 1 with 2

2. **Deployment that is not backwards compatible**
<br>When a customer needs to update the game server, and the client version is not compatible with the old server. Transitioning from one build to another would be done as follows:
<br>
<br>Old clients will reference Alias 1, which would have the following:
<br>Build 1: Weight 1 [Non-zero]
<br>Once Build 2 is created, new clients will reference Alias 2, which would have the following:
<br>Build 2: Weight 1 [Non-zero]

3. **Blast deployment that is backwards compatible**
<br>When a customer needs to update the game server, and the client version is compatible with both servers, but should be done all at once. Transitioning from one build to another would be done as follows:
<br>
<br>Clients will reference Alias 1, which would have the following:
<br>Build 1: Weight 1 [Non-zero]
<br>Once Build 2 is created, Alias 1 will be changed to be:
<br>Build 1: 0 [Or completely removed]
<br>Build 2: Weight 1 [Non-zero]
<br>Rollback:
<br>Change Alias1 to be:
<br>Build 1: Weight 1 [Non-zero]
<br>Build 2: 0 [Or completely removed]
<br>**Note:** It is the customer's responsibility to provision Build 2 sufficiently to take all the traffic

4. **Testing a deployment that is backwards compatible**
<br> When a customer needs to update the game server, and the client version is compatible with both servers, but the customer wants to test the second version before deploying it to prod. Testing and transitioning from one build to another would be done as follows:
<br>
<br>Clients will reference Alias 1, which would have the following:
<br>Build 1: Weight 1 [Non-zero]
<br>Once Build 2 is created. Testing clients would reference Alias 2, which would have the following:
<br>Build 2: Weight 2 [Non-zero]
<br>Once Build 2 is verified. Alias 1 will be changed to be:
<br>Build 1: Weight1
<br>Build 2: Weight2

## Manage a build alias

**Note: Deleting a build that is listed in a build alias will return a 400 Bad Request**

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
To allocate using a build alias one must simply specify the build alias Id in the allocation call.

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

## Fallback to other builds and regions

Assume an allocation using a build alias for region EastUS with fallback to WestUS is sent.

Assume also that the build alias gives equal weights to Build 1 and Build 2.

Assume that for a given allocation Build 1 is selected.

1. Allocation in East US for Build 1 is tried.
2. If #1 fails, allocation in East US for Build 2 is tried.
3. If #2 fails, allocation in WestUS for Build 1 is tried.
4. If #3 fails, allocation in WestUs for Build 2 is tried.

If all options fail, allocation call will fail.