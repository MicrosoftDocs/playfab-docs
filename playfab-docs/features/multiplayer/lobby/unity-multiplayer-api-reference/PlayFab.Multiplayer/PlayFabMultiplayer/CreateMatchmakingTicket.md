---
author: vicodex
title: PlayFabMultiplayer.CreateMatchmakingTicket
description: PlayFabMultiplayer.CreateMatchmakingTicket
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.CreateMatchmakingTicket

## Method (1 of 3)

Creates a matchmaking ticket for one or more local users.

```csharp
public static MatchmakingTicket CreateMatchmakingTicket(IList<MatchUser> localUsers, 
    string queueName, uint timeoutInSeconds = 120)
```

| parameter | description |
| --- | --- |
| localUsers | The array of local users along with local user attributes to include in the ticket. |
| queueName | The queue to which the ticket belongs. |
| timeoutInSeconds | How long to attempt matchmaking the ticket, in seconds. Defaults to 120 seconds |

## Return Value (1 of 3)

The resulting ticket object.

## Remarks (1 of 3)

The library automatically, and asynchronously, will submit all local users on a ticket to the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be queried at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Creating` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md).

All existing tickets in which a local user is a member will be canceled as part of this operation.

A match can't be found until all remote users specified in the `membersToMatchWith` field of the `configuration` parameter have joined the ticket via [`JoinMatchmakingTicketFromId`](./JoinMatchmakingTicketFromId.md).

---

## Method (2 of 3)

Creates a matchmaking ticket for one or more local users.

```csharp
public static MatchmakingTicket CreateMatchmakingTicket(MatchUser localUser, string queueName, 
    uint timeoutInSeconds = 120)
```

| parameter | description |
| --- | --- |
| localUser | The local user along with local user attributes to include in the ticket. |
| queueName | The queue to which the ticket belongs. |
| timeoutInSeconds | How long to attempt matchmaking the ticket, in seconds. Defaults to 120 seconds |

## Return Value (2 of 3)

The resulting ticket object.

## Remarks (2 of 3)

The library automatically, and asynchronously, will submit all local users on a ticket to the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be queried at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Creating` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md).

All existing tickets in which a local user is a member will be canceled as part of this operation.

A match can't be found until all remote users specified in the `membersToMatchWith` field of the `configuration` parameter have joined the ticket via [`JoinMatchmakingTicketFromId`](./JoinMatchmakingTicketFromId.md).

---

## Method (3 of 3)

Creates a matchmaking ticket for one or more local users.

```csharp
public static MatchmakingTicket CreateMatchmakingTicket(IList<MatchUser> localUsers, 
    string queueName, List<PFEntityKey> membersToMatchWith, uint timeoutInSeconds = 120)
```

| parameter | description |
| --- | --- |
| localUsers | The array of local users along with local user attributes to include in the ticket. |
| queueName | The queue to which the ticket belongs. |
| membersToMatchWith | The other specific users expected to join the ticket. |
| timeoutInSeconds | How long to attempt matchmaking the ticket, in seconds. Defaults to 120 seconds |

## Return Value (3 of 3)

The resulting ticket object.

## Remarks (3 of 3)

The library automatically, and asynchronously, will submit all local users on a ticket to the matchmaking service. Each time the ticket status changes, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. The ticket status can be queried at any time via [`Status`](../MatchmakingTicket/Status.md). The ticket immediately starts in the `MatchmakingTicketStatus.Creating` state.

When the ticket has completed, a [`OnMatchmakingTicketStatusChanged`](./OnMatchmakingTicketStatusChanged.md) will be provided. At that point, a match will have been found or the ticket stopped due to failure. On success, the match that was found can be queried via [`GetMatchDetails`](../MatchmakingTicket/GetMatchDetails.md).

All existing tickets in which a local user is a member will be canceled as part of this operation.

A match can't be found until all remote users specified in the `membersToMatchWith` field of the `configuration` parameter have joined the ticket via [`JoinMatchmakingTicketFromId`](./JoinMatchmakingTicketFromId.md).

## See Also

* class [MatchmakingTicket](../MatchmakingTicket.md)
* struct [MatchUser](../MatchUser.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

