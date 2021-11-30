---
author: vicodex
title: MatchUser struct
description: MatchUser members
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# Struct MatchUser

```csharp
public struct MatchUser
```

## Constructors

| name | description |
| --- | --- |
| [MatchUser](MatchUser/MatchUser.md) | Initializes a new instance of the [`MatchUser`](./MatchUser.md) struct. (2 constructors) |

## Properties

| name | description |
| --- | --- |
| [LocalUser](MatchUser/LocalUser.md) | The local user to join to the ticket. |
| [LocalUserJsonAttributesJSON](MatchUser/LocalUserJsonAttributesJSON.md) | The local user attributes as JSON string. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
