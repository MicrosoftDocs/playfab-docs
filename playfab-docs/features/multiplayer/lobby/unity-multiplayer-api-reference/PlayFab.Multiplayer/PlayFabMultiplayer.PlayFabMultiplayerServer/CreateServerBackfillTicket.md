---
author: nassosterz-ms
title: CreateServerBackfillTicket
description: CreateServerBackfillTicket
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.CreateServerBackfillTicket method

Creates a server backfill ticket.

```csharp
public static MatchmakingTicket CreateServerBackfillTicket(PFEntityKey server, string queueName, 
    List<MatchUser> matchMembers, MultiplayerServerDetails serverDetails, 
    uint timeoutInSeconds = 300)
```

| parameter | description |
| --- | --- |
| server | The server entity. |
| queueName | The queue to which the ticket belongs. |
| matchMembers | The members currently in the match. |
| serverDetails | The details about the PlayFab Multiplayer Server that the ticket is for. The server details are optional. If no server details need to be provided to clients on match completion, this value can be null. Similarly, any of the fields in the server details don't need to be provided to clients can be empty or null. |
| timeoutInSeconds | How long to attempt matchmaking the ticket, in seconds. Defaults to 300 seconds. |

## Return Value

The resulting ticket object.

## Remarks

The library automatically, and asynchronously, will submit a server backfill ticket to the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](../PlayFabMultiplayer/OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be queried at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Creating` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](../PlayFabMultiplayer/OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match for the backfill ticket will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md). The `regionPreferences` in regionPreferences will only contain the region that the server is located in.

This function requires that a previous call to [`SetEntityToken`](../PlayFabMultiplayer/SetEntityToken.md) was made to set the game server entity token.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method will return errors on other platforms.

## See Also

* class [MatchmakingTicket](../MatchmakingTicket.md)
* class [PFEntityKey](../PFEntityKey.md)
* struct [MatchUser](../MatchUser.md)
* class [MultiplayerServerDetails](../MultiplayerServerDetails.md)
* class [PlayFabMultiplayerServer](../PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

