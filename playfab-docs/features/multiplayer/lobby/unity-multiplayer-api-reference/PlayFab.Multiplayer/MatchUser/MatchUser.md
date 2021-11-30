---
author: vicodex
title: MatchUser
description: MatchUser
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# MatchUser constructor
## MatchUser (1 of 2)

Initializes a new instance of the [`MatchUser`](../MatchUser.md) struct.

```csharp
public MatchUser(PFEntityKey localUser, string localUserJsonAttributesJSON)
```

| parameter | description |
| --- | --- |
| localUser | The local user to join to the ticket. |
| localUserJsonAttributesJSON | The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |

## See Also 1

* class [PFEntityKey](../PFEntityKey.md)
* struct [MatchUser](../MatchUser.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

---

## MatchUser (2 of 2)

Initializes a new instance of the [`MatchUser`](../MatchUser.md) struct.

```csharp
public MatchUser(PlayFabAuthenticationContext localUser, string localUserJsonAttributesJSON)
```

| parameter | description |
| --- | --- |
| localUser | The local user to join to the ticket. |
| localUserJsonAttributesJSON | The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |

## See Also 2

* struct [MatchUser](../MatchUser.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

