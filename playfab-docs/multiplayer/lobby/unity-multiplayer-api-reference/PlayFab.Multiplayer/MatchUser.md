---
author: vicodex
title: MatchUser struct
description: MatchUser members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchUser structure

A member of a match result.

```csharp
public struct MatchUser
```

## Public Members

| name | description |
| --- | --- |
| [MatchUser](MatchUser/MatchUser.md)(…) | Initializes a new instance of the [`MatchUser`](./MatchUser.md) struct. (2 constructors) |
| [LocalUser](MatchUser/LocalUser.md) { get; set; } | The local user to join to the ticket. |
| [LocalUserJsonAttributesJSON](MatchUser/LocalUserJsonAttributesJSON.md) { get; set; } | The local user attributes as JSON string. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |
| [TeamId](MatchUser/TeamId.md) { get; set; } | The team ID assigned to this match member. May be empty if the matchmaking queue doesn't use team rules. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
