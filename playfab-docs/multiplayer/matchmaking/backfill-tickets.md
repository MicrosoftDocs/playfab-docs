---
title: Using server backfill tickets
author: keithrkline
description: Describes how to use backfill tickets
ms.author: kkline
ms.date: 05/10/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, backfill
ms.localizationpriority: medium
---

# Using server backfill tickets

Games hosted on a server sometimes find they need to search for additional
players. Most often this occurs when one or more players disconnect while the
game is in progress. Server backfill tickets allow a game server to search for
additional players which will fit into the game currently being played.

Server backfill tickets differ from regular matchmaking tickets in multiple ways:

1. Matching
    * Backfill tickets cannot match with each other.
    * Backfill tickets are given priority during searching. This reduces
      fragmentation of the player base.
1. Contract
    * Backfill tickets may be created with a `ServerDetails` field. This allows
      the server to indicate how matched players should connect to it.
    * Backfill tickets may be created with team assignments. This allows games
      with teams to maintain their team information.
1. Queue properties
    * Backfill tickets do not trigger [Multiplayer Server allocation](multiplayer-servers.md).
    * Backfill tickets are not reflected in [queue statistics](display-statistics.md), as their players
      are already playing a game and would inaccurately skew wait time.
1. Ownership
    * Backfill tickets are owned by a game server, not a user. Users cannot
      view or interact with backfill tickets in any way.

## Creating a server backfill ticket

The backfill process begins similarly to creating a regular matchmaking ticket,
but with the
[CreateServerBackfillTicket](https://api.playfab.com/documentation/Multiplayer/method/CreateServerBackfillTicket)
call as opposed to a
[CreateServerMatchmakingTicket](xref:titleid.playfabapi.com.multiplayer.matchmaking.createservermatchmakingticket)
call. The game server must supply all member information for the game it is
currently hosting. This is most efficiently done by storing the attributes
returned in the prior match result. These attributes can be retrieved by
calling
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch)
with the `ReturnMemberAttributes` flag. Alternatively the game server may query
the users for attribute information.

In addition to the members, the game server may specify two additional pieces of
information.

### ServerDetails

This structure is identical to the structure returned in a
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch) call,
and allows the server to specify any information required to connect to it. When
the backfill ticket is matched, its
[ServerDetails](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch#serverdetails)
structure will be returned to any players who call
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch) on the
resulting match. All fields in this structure are optional. Titles may only
need a subset of these in order to provide enough information for clients to
connect to the game server.

> [!NOTE] 
> The `IPV4Address` field is not validated and may be used to supply
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
be specified with a TeamId, indicating the team they are currently on. This
membership will be preserved when a Match is returned. If a TeamId is not
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
regular matchmaking tickets operate, except with analagous APIs. The game
server may check the status of its ticket by calling [GetServerBackfillTicket](https://api.playfab.com/documentation/Multiplayer/method/GetServerBackfillTicket).
It may also cancel the ticket by calling [CancelServerBackfillTicket](https://api.playfab.com/documentation/Multiplayer/method/CancelServerBackfillTicket).

> [!NOTE] 
> Clients are not allowed to cancel a backfill ticket they are in.
> Suppose a client was in a 4v4 match, and a player on the opposing team
> dropped. The client could maintain its advantage by continously canceling any
> backfill tickets it was in. To prevent this, only game servers may cancel
> backfill tickets.

## Membership limits and recovering from lost backfill tickets

Similar to regular matchmaking tickets, at any time a user may be in only one
backfill ticket per queue. This limit is tracked separately from the regular
tickets which a client controls.

In the case where a game server creates a backfill ticket and then crashes, any
users in the lost backfill ticket will be unable to be submitted in another
backfill ticket due to the membership limit. A game server will discover this
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
[CancelAllServerBackfillTicketsForPlayer](https://api.playfab.com/documentation/Multiplayer/method/CancelAllServerBackfillTicketsForPlayer),
which removes all backfill tickets the user is in.
[ListServerBackfillTicketsForPlayer](https://api.playfab.com/documentation/Multiplayer/method/ListServerBackfillTicketsForPlayer)
is also provided as a method to discover which backfill tickets a player may be
in.

## Interactions with the Region Selection Rule

The Region Selection rule normally requires that tickets specify an array of
latency measurements for its attribute. A backfill ticket, however, represents
a game already in progress in a particular datacenter. Instead of an array of
latency measurements, the create request must specify a Region in the
[ServerDetails](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch#serverdetails)
structure. For tickets to match with the backfill ticket, they must have an
acceptable ping time to the region specified by the backfill ticket.

## Interactions with the Team Ticket Size Similarity Rule

The Team Ticket Size Similarity Rule enforces that large groups of players are
matched against other large groups of players. However, backfill tickets do not
contain the information of which players joined the game as a group. As such,
the Ticket Size Similarity Rule is ignored when matching backfill tickets.