---
author: vicodex
title: MatchUser
description: MatchUser constructor
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# MatchUser

## Constructor (1 of 2)

Initializes a new instance of the [`MatchUser`](../MatchUser.md) struct.

```csharp
public MatchUser(PFEntityKey localUser, string localUserJsonAttributesJSON, string teamId = "")
```

| parameter | description |
| --- | --- |
| localUser | The local user to join to the ticket. |
| localUserJsonAttributesJSON | The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |
| teamId | The team ID assigned to this match member. May be empty if the matchmaking queue doesn't use team rules. |

---

## Constructor (2 of 2)

Initializes a new instance of the [`MatchUser`](../MatchUser.md) struct.

```csharp
public MatchUser(PlayFabAuthenticationContext localUser, string localUserJsonAttributesJSON, 
    string teamId = "")
```

| parameter | description |
| --- | --- |
| localUser | The local user to join to the ticket. |
| localUserJsonAttributesJSON | The array of local user attribute strings. There should be one attribute string for each local user. Each attribute string should either be an empty string or a serialized JSON object. For example, `{"player_color":"blue","player_role":"tank"}`. |
| teamId | The team ID assigned to this match member. May be empty if the matchmaking queue doesn't use team rules. |

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* struct [MatchUser](../MatchUser.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

