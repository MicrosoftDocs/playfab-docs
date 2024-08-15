---
author: vicodex
title: MatchUser.LocalUserJsonAttributesJSON
description: MatchUser.LocalUserJsonAttributesJSON
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchUser.LocalUserJsonAttributesJSON property

The local user attributes as JSON string. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`.

```csharp
public string LocalUserJsonAttributesJSON { get; set; }
```

## See Also

* struct [MatchUser](../MatchUser.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

