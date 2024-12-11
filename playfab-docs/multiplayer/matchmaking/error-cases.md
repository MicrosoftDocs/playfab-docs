---
title: Handling common error cases
author: keithrkline
description: Describes how titles should respond to various error cases.
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, errors
ms.localizationpriority: medium
---

# Handling common error cases

PlayFab matchmaking provides a simple interface for entering and leaving matchmaking. Despite this, there are still multiple points where things *may not* go according to plan. Some of the more common error cases are shown below, along with the ways a title should handle them.

This page assumes you're familiar with the general flow of PlayFab matchmaking. For more information, see our [Matchmaking quickstart](quickstart.md) on the
common use of matchmaking.

## Errors on ticket creation

Ticket creation may fail for a number of reasons. In most of these cases, the PlayFab error code identifies something invalid about the submission request. Correcting this allows you to submit successfully.

> [!NOTE]  
> The errors `MatchmakingAttributeInvalid` and `MatchmakingPlayerAttributesInvalid` indicate an issue with the formatting of attributes. For more information, see the section on [Specifying Ticket Attributes](ticket-attributes.md) for the details on how to pass attributes in a ticket.

Other error codes indicate the request is valid, but circumstances outside the request prevent the ticket from being accepted. In particular, these are:

1. `MatchmakingRateLimitExceeded` - This indicates you have been submitting tickets too frequently. For more information, see the section [below](#call-returns-matchmakingratelimitexceeded) for more details.
2. `MatchmakingTicketMembershipLimitExceeded` - This indicates the user is already in another active ticket. Users are restricted from being in more than one ticket within a queue at a time, as they can't play two games at once. For more information, see the more detailed section [below](#creating-or-joining-a-ticket-returns-matchmakingticketmembershiplimitexceeded) on correcting this situation.

If you receive an HTTP error code of 503, retry your request after a brief delay.

## Call returns MatchmakingRateLimitExceeded

Similar to other PlayFab features, PlayFab matchmaking restricts the number of calls you make, according to the limits configured inside the game manager. Receiving the `MatchmakingRateLimitExceeded` error indicates the title has exceeded the limit for this call type.

In matchmaking, this most frequently occurs when polling [GetMatchmakingTicket](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatchmakingticket) to see if a ticket has matched.

To avoid this error either increase your limit, or reduce your call frequency.

> [!NOTE]  
> Although the response has an HTTP status code of 429, the request itself is valid and can still be retried.

## Creating or joining a ticket returns MatchmakingTicketMembershipLimitExceeded

In PlayFab matchmaking, a user can only be in one ticket at a time per queue to avoid a case where a user enters two matches and must decide which ticket to honor. Whichever match isn't honored, it will be short a player, and its players will likely be forced to re-enter matchmaking. The error `MatchmakingTicketMembershipLimitExceeded` is returned if a user is already in one ticket that isn't canceled or matched, but tries to create or join another.

However, sometimes a title or server may lose track of a ticket, either by crashing, restarting, or other unforeseen errors. When this occurs, it leaves an active ticket that neither the user nor title is aware of.

This lost ticket prevents any future tickets from being submitted for this user until it expires. If this happens, there are two options available to resolve the issue:

### Option 1: Clear the ticket from matchmaking

Cancel all of a user's existing tickets. Calling [CancelAllMatchmakingTicketsForPlayer](xref:titleid.playfabapi.com.multiplayer.matchmaking.cancelallmatchmakingticketsforplayer) performs this task. Afterwards matchmaking has no tickets in progress, and be ready for a new ticket to be created.

### Option 2: Find the lost ticket

Find the user's existing ticket and continue using it. Calling
[ListMatchmakingTicketsForPlayer](xref:titleid.playfabapi.com.multiplayer.matchmaking.listmatchmakingticketsforplayer)
 returns all the matchmaking ticket IDs the user is a member of. Calling [GetMatchmakingTicket](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatchmakingticket)
on each ticketId provided allows you to retrieve its state and continue monitoring it until it finds a match.

## Not all players join a multi-user ticket

When creating a multi-user ticket, one of the invited players may fail or refuse to join. In a case like this, the created ticket remains in the WaitingForPlayers status until it expires. Titles should expect this situation to happen from time to time, and set a fairly short timeout within the UI.

After that timeout, the title should cancel the ticket and check that all players have still agreed to play a game together.

## GetMatch returns not found

Once a match is created, the match lives for a period of time and eventually age out. If the match isn't retrieved in time, those users need to resubmit tickets to get matched again. This can be avoided by ensuring matches are retrieved in a timely manner (that is, within a few minutes).

If you're using Matchmaking and Lobby together as described [here](../lobby/lobby-and-matchmaking.md), it's possible that the lobbyArrangementString is valid for a period of time after the match times out here. Make sure you retrieve and use the info from GetMatch before it expires. 

## The ticket is canceled

Tickets may be canceled for multiple reasons. The most common cases are user cancellations and tickets expiring, but the ticket can also be canceled by the server. If you call `GetMatchmakingTicket`, and discover your ticket is canceled, the reason is listed in the `CancellationReason` field. The possible `CancellationReason` responses, along with potential resolutions, are listed below.

| CancellationReason       | Description | Resolution |
|--------------------------|-------------|------------|
| User   | User canceled matchmaking ticket | Intentional. Create a new ticket if desired. |
| Server | Service canceled matchmaking ticket via server API | Intentional. Create a new ticket if desired. |
| Timeout | Ticket expired by reaching GiveUpAfterSeconds | Try again with a new ticket, adjust ticket attributes if necessary. |
| ServerAllocationFailed | Queue allocates server but the allocation request failed | Confirm standby servers available in regions and try again with a new ticket. |
| TicketUnmatchable | Combination of the ticket parameters and the rules for the queue makes this ticket unmatchable | Adjust either the ticket attributes or queue configuration so they're compatible. |
| RetryRequired | Internal transient matchmaking error | Try again with a new ticket, likely due to timing issue that should resolve on next request. |
| Internal | Internal matchmaking service error | Try again with a new ticket. |


## Cancelling a ticket returns an error

Cancelling a ticket isn't guaranteed to succeed. While most errors are self-explanatory, the error `MatchmakingTicketAlreadyCompleted` indicates one of two possibilities:

1. The ticket was already canceled.
2. The ticket was already matched.

When receiving this error, titles should call [GetMatchmakingTicket](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatchmakingticket) to differentiate between these two cases. In the first case, the ticket is already in the desired state, and no further action needs to be taken. The second case indicates that a user's cancellation was too late, and it has already matched. This race condition between a user's cancellation and a match being found is unavoidable, and must be handled by the title.

The title has two options to resolve this--join the match anyway, disregarding the user's cancellation request, or allow the match to begin knowing that a player won't join. Neither option is perfect, but it's important to expect this situation to occur and consciously create a title flow for it. It's also worth noting that players may not join a match for any number of reasons, so a title must handle this case regardless of the race condition mentioned here.
