---
author: vicodex
title: PlayFabMultiplayer.JoinMatchmakingTicketFromId
description: PlayFabMultiplayer.JoinMatchmakingTicketFromId
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.JoinMatchmakingTicketFromId

## Method (1 of 2)

Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name.

```csharp
public static MatchmakingTicket JoinMatchmakingTicketFromId(IList<MatchUser> localUsers, 
    string ticketId, string queueName, IList<PFEntityKey> membersToMatchWith)
```

| parameter | description |
| --- | --- |
| localUsers | The array of local users along with local user attributes to include in the ticket. |
| ticketId | The ID of the ticket to join. |
| queueName | The queue to which the ticket belongs. |
| membersToMatchWith | The other specific users expected to join the ticket. |

## Return Value (1 of 2)

The resulting ticket object.

## Remarks (1 of 2)

The library automatically, and asynchronously, will submit all local users to join the ticket on the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be quered at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Joining` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md).

All existing tickets in which a local user is a member will be canceled as part of this operation.

---

## Method (2 of 2)

Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name.

```csharp
public static MatchmakingTicket JoinMatchmakingTicketFromId(MatchUser localUser, string ticketId, 
    string queueName, IList<PFEntityKey> membersToMatchWith)
```

| parameter | description |
| --- | --- |
| localUser | The local user along with local user attributes to include in the ticket. |
| ticketId | The ID of the ticket to join. |
| queueName | The queue to which the ticket belongs. |
| membersToMatchWith | The other specific users expected to join the ticket. |

## Return Value (2 of 2)

The resulting ticket object.

## Remarks (2 of 2)

The library automatically, and asynchronously, will submit all local users to join the ticket on the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be quered at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Joining` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md).

All existing tickets in which a local user is a member will be canceled as part of this operation.

## See Also

* class [MatchmakingTicket](../MatchmakingTicket.md)
* struct [MatchUser](../MatchUser.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

