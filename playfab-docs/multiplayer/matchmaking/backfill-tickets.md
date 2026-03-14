---
title: Using Server Backfill Tickets - REST API
author: keithrkline
description: Describes how to use backfill tickets with the REST API
ms.author: kkline
ms.date: 05/10/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, backfill
ms.localizationpriority: medium
---

# Using server backfill tickets - REST API

> [!NOTE]
> We highly recommend you consider using the Multiplayer SDKs as it includes real-time message support that reduces the need for polling, improving the matchmaking experience and reducing delays. [Using Server Backfill Tickets - Multiplayer SDK](backfill-tickets-multiplayer-sdk.md)

Games hosted on a server sometimes find they need to search for extra
players. Most often this occurs when one or more players disconnect while the
game is in progress. Server backfill tickets allow a game server to search for
extra players which fit into the game currently being played.

Server backfill tickets differ from regular matchmaking tickets in multiple ways:

1. Matching
    * Backfill tickets can't match with each other.
    * Backfill tickets are given priority during searching. This reduces
      fragmentation of the player base.
1. Contract
    * Backfill tickets can be created with a `ServerDetails` field. This allows
      the server to indicate how matched players should connect to it.
    * Backfill tickets can be created with team assignments. This allows games
      with teams to maintain their team information.
1. Queue properties
    * Backfill tickets don't trigger [Multiplayer Server allocation](multiplayer-servers.md).
    * Backfill tickets aren't reflected in [queue statistics](display-statistics.md), as their players
      are already playing a game and would inaccurately skew wait time.
1. Ownership
    * Backfill tickets are owned by a game server, not a user. Users can't
      view or interact with backfill tickets in any way.

## Creating a server backfill ticket

The backfill process begins similarly to creating a regular matchmaking ticket,
but with the
[CreateServerBackfillTicket](/rest/api/playfab/multiplayer/matchmaking/create-server-backfill-ticket)
call as opposed to a
[CreateServerMatchmakingTicket](xref:titleid.playfabapi.com.multiplayer.matchmaking.createservermatchmakingticket)
call. The game server must supply all member information for the game it's
currently hosting. This is most efficiently done by storing the attributes
returned in the prior match result. These attributes can be retrieved by
calling
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch)
with the `ReturnMemberAttributes` flag. Alternatively the game server can query
the users for attribute information.

In addition to the members, the game server can specify two additional pieces of
information.

### ServerDetails

This structure is identical to the structure returned in a
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch) call,
and allows the server to specify any information required to connect to it. When
the backfill ticket is matched, its
[ServerDetails](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch#serverdetails)
structure is returned to any players who call
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch) on the
resulting match. All fields in this structure are optional. Titles might only
need a subset of these in order to provide enough information for clients to
connect to the game server.

> [!NOTE] 
> The `IPV4Address` field isn't validated and can be used to supply
> arbitrary connection string information to clients.

```json
{
  "ServerDetails": {
    "IPV4Address": "123.234.123.234",
    "Ports": [
      {
        "Port": {
          "Name": "portname",
          "Num": 12345,
          "Protocol": "UDP"
        }
      }
    ],
    "Region": "EastUS"
  }
}
```
### Team Assignments

If the backfill ticket is submitted to a queue with teams, each member may also
be specified with a TeamId, indicating the team they're currently on. This
membership is preserved when a Match is returned. If a TeamId isn't
specified for a user, it may be placed on any team.

```json
{
  "Members": [
    {
      "TeamId": "red",
      "Entity": {
        "Id": "6570DE3537DC9DF6",
        "Type": "title_player_account",
        "TypeString": "title_player_account"
      },
      "Attributes": {
        "DataObject": {
          "Skill": 25
        }
      }
    }
  ]
}
```

## Interacting with a backfill ticket

Once created, a backfill ticket begins searching for regular matchmaking tickets
which meet the rule criteria. The flow for backfill tickets is identical to how
regular matchmaking tickets operate, except with analogous APIs. The game
server may check the status of its ticket by calling [GetServerBackfillTicket](/rest/api/playfab/multiplayer/matchmaking/create-server-backfill-ticket).
It may also cancel the ticket by calling [CancelServerBackfillTicket](/rest/api/playfab/multiplayer/matchmaking/cancel-server-backfill-ticket?view=playfab-rest).

> [!NOTE] 
> Clients are not allowed to cancel a backfill ticket they are in.
> Suppose a client was in a 4v4 match, and a player on the opposing team
> dropped. The client could maintain its advantage by continuously canceling any
> backfill tickets it was in. To prevent this, only game servers may cancel
> backfill tickets.

## Membership limits and recovering from lost backfill tickets

Similar to regular matchmaking tickets, at any time a user may be in only one
backfill ticket per queue. This limit is tracked separately from the regular
tickets which a client controls.

In the case where a game server creates a backfill ticket and then crashes, any
users in the lost backfill ticket will be unable to be submitted in another
backfill ticket due to the membership limit. A game server discovers this
by receiving the error `MatchmakingTicketMembershipLimitExceeded`, along with a
list of users indicating which have outstanding backfill tickets in an
`errorDetails` body.

```json
{
    "code": 400,
    "status": "BadRequest",
    "error": "MatchmakingTicketMembershipLimitExceeded",
    "errorCode": 2055,
    "errorMessage": "User is a member of too many backfill tickets.",
    "errorDetails": {
        "UsersExceedingMembershipLimit": [
            "title_player_account!562D72A5B184F612"
        ]
    }
}
```

The game server can recover a user from this situation by calling
[CancelAllServerBackfillTicketsForPlayer](/rest/api/playfab/multiplayer/matchmaking/cancel-all-server-backfill-tickets-for-player),
which removes all backfill tickets the user is in.
[ListServerBackfillTicketsForPlayer](/rest/api/playfab/multiplayer/matchmaking/list-server-backfill-tickets-for-player)
is also provided as a method to discover which backfill tickets a player may be
in.

## Interactions with the Region Selection Rule

The Region Selection rule normally requires that tickets specify an array of
latency measurements for its attribute. A backfill ticket, however, represents
a game already in progress in a particular datacenter. Instead of an array of
latency measurements, the created request must specify a Region in the
[ServerDetails](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch#serverdetails)
structure. For tickets to match with the backfill ticket, they must have an
acceptable ping time to the region specified by the backfill ticket.

## Interactions with the Team Ticket Size Similarity Rule

The Team Ticket Size Similarity Rule enforces that large groups of players are
matched against other large groups of players. However, backfill tickets don't
contain the information of which players joined the game as a group. As such,
the Ticket Size Similarity Rule is ignored when matching backfill tickets.