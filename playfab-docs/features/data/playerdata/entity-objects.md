---
title: Entity objects
author: v-thopra
description: Describes the terminology, concepts, and design of Entities in the PlayFab APIs.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities, accounts
ms.localizationpriority: medium
---

## Entity objects

Entity objects allow you to read and write small **JSON**-serializable objects attached to an entity. All entity types support the same **GetObjects** and **SetObjects** methods.

The examples that are shown below demonstrate setting and reading an **Object** on a **title_player_account**.

```csharp
var data = new Dictionary<string, object>()
{
    {"Health", 100},
    {"Mana", 10000}
};
var dataList = new List<SetObject>()
{
    new SetObject()
    {
        ObjectName = "PlayerData",
        DataObject = data
    },
    // A free-tier customer may store upto 3 objects on each entity
};
PlayFabDataAPI.SetObjects(new SetObjectsRequest()
{
    Entity = new EntityKey {Id = entityId, Type = entityType}, // Saved from GetEntityToken, or a specified key created from a titlePlayerId, CharacterId, etc
    Objects = dataList,
}, (setResult) => {
    Debug.Log(setResult.ProfileVersion);
}, OnPlayFabError);
```

```csharp
var getRequest = new GetObjectsRequest {Entity = new EntityKey {Id = entityId, Type = entityType}};
PlayFabDataAPI.GetObjects(getRequest,
    result => { var objs = result.Objects; },
    OnPlayFabError
);
```
## Game Manager and entities

The Game Manager allows you to manipulate objects and files for players. The player overview has been updated to show both the title player and master player account information.

![Game Manager - Entities - Player overview](media/tutorials/game-manager-entities-player-overview.png)  

In addition, files and objects now have their own sections in the **Players** tab.

![Game Manager - Entities - Player Files and Objects](media/tutorials/game-manager-entities-player-files.png)  
