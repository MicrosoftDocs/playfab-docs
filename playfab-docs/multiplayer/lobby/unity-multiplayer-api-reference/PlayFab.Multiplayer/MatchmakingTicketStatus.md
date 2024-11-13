---
author: vicodex
title: MatchmakingTicketStatus
description: MatchmakingTicketStatus members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchmakingTicketStatus

The possible states for a matchmaking ticket.

```csharp
public enum MatchmakingTicketStatus : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| Creating | `0` | The matchmaking ticket is being created. |
| Joining | `1` | The matchmaking ticket is being joined. |
| WaitingForPlayers | `2` | The matchmaking ticket is waiting for all remote users specified in the `membersToMatchWith` field of its configuration to join the ticket via [`JoinMatchmakingTicketFromId`](./PlayFabMultiplayer/JoinMatchmakingTicketFromId.md). |
| WaitingForMatch | `3` | The matchmaking ticket is waiting for a match to be found. |
| Matched | `4` | The matchmaking ticket has found a match. |
| Canceled | `5` | The matchmaking ticket has been canceled. |
| Failed | `6` | The matchmaking ticket failed to find a match. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

