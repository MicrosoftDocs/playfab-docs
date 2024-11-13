---
author: vicodex
title: LobbyMemberUpdateSummary
description: LobbyMemberUpdateSummary members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbyMemberUpdateSummary

A collection of hints about an update which has been successfully applied to the lobby on behalf of a member.

```csharp
public class LobbyMemberUpdateSummary
```

## Public Members

| name | description |
| --- | --- |
| [ConnectionStatusUpdated](LobbyMemberUpdateSummary/ConnectionStatusUpdated.md) { get; } | A flag indicating whether the member's connection status has updated. |
| [Member](LobbyMemberUpdateSummary/Member.md) { get; } | The member which performed the update |
| [UpdatedMemberPropertyKeys](LobbyMemberUpdateSummary/UpdatedMemberPropertyKeys.md) { get; } | The member properties which have been updated for `member`. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
