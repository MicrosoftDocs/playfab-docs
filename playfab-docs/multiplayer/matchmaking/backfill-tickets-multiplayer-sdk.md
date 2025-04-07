---
title: Using Server Backfill Tickets - Multiplayer SDK
author: SahilAshar
description: Describes how to use backfill tickets with the Multiplayer SDK
ms.author: rachelwu
ms.date: 02/19/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, backfill
ms.localizationpriority: medium
---
# Using Server Backfill Tickets - Multiplayer SDK

Games hosted on a server sometimes find they need to search for extra
players. Most often this occurs when one or more players disconnect while the
game is in progress. Server backfill tickets allow a game server to search for
extra players which fit into the game currently being played.

Server backfill tickets differ from regular matchmaking tickets in multiple ways:

1. Matching
    * Backfill tickets can't match with each other.
    * Backfill tickets are given priority during searching, reducing
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


## Prerequisites

- Basic familiarity with the PlayFab Multiplayer SDK. For more information, see the [Matchmaking SDK Quickstart](quickstart-client-sdk.md) for more information.
- Define `PFMULTIPLAYER_INCLUDE_SERVER_APIS` before including the matchmaking header. For example:
```cpp
#define PFMULTIPLAYER_INCLUDE_SERVER_APIS
#include <PFMatchmaking.h>
```

## Configure a server backfill ticket

Create and populate a [PFMatchmakingServerBackfillTicketConfiguration](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingserverbackfillticketconfiguration.md) struct with the necessary details:

- **`timeoutInSeconds`**: How long to attempt filling the ticket, in seconds.

- **`queueName`**: The name of a match queue.
  
- **`memberCount`**: The number of members currently in the match.
  
- **`members`**: The [PFMatchmakingMatchMember](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingmatchmember.md) members currently in the match.
  
- **`serverDetails`** (optional): Populate [PFMultiplayerServerDetails](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmultiplayerserverdetails.md) with information about your server (FQDN, IP address, ports, region) that is provided to clients.

> [!NOTE] 
> The `PFMultiplayerServerDetails::ipv4Address` field isn't validated and can be used to supply
> arbitrary connection string information to clients.

```cpp
// Define the server port configuration.
PFMultiplayerPort serverPorts[] = {
    { "portname", 12345, PFMultiplayerProtocolType::Udp }
};

// Populate the server details.
PFMultiplayerServerDetails serverDetails = {};
serverDetails.fqdn = "your.server.fqdn.com";
serverDetails.ipv4Address = "123.234.123.234";
serverDetails.ports = serverPorts;
serverDetails.portCount = sizeof(serverPorts) / sizeof(serverPorts[0]);
serverDetails.region = "EastUS";

// Set up the backfill ticket configuration.
PFMatchmakingServerBackfillTicketConfiguration backfillConfig = {};
backfillConfig.timeoutInSeconds = 60;                 // Try for 60 seconds
backfillConfig.queueName = "YourQueueName";
backfillConfig.memberCount = currentMatchMemberCount; // e.g., 4
backfillConfig.members = currentMatchMembers;         // Pointer to an array of PFMatchmakingMatchMember
backfillConfig.serverDetails = &serverDetails;        // Optional; can be nullptr if not needed
```

## Creating a server backfill ticket
Using [PFMultiplayerCreateServerBackfillTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md) to create a server backfill ticket, we need to pass our game server's entity (as a [PFEntityKey](../lobby/playfabmultiplayerreference-cpp/pfmultiplayer/pfentitykey_clientsdk.md)) along with the backfill configuration we created in the previous step.

```cpp
PFMatchmakingTicketHandle backfillTicket = nullptr;
HRESULT hr = PFMultiplayerCreateServerBackfillTicket(
    multiplayerHandle,            // The handle of the PFMultiplayer API instance.
    &serverEntity,                // PFEntityKey for your game server entity
    &backfillConfig,              // The backfill ticket configuration.
    nullptr,                      // Optional async context
    &backfillTicket               // The resulting ticket object.
);

if (FAILED(hr))
{
    // handle ticket creation failure
}
```

## Check the status of the matchmaking ticket
You must check for updates to the ticket by calling [PFMultiplayerStartProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) to receive state changes and then calling [PFMultiplayerFinishProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) when you're done processing those state changes.

The SDK returns a **TicketStatusChanged** state change any time the status of the ticket changes and a **TicketCompleted** state change when matchmaking has completed.

```cpp
HRESULT hrTicketError = S_OK;

uint32_t stateChangeCount;
const PFMatchmakingStateChange * const * stateChanges;
HRESULT hr = PFMultiplayerStartProcessingMatchmakingStateChanges(g_pfmHandle, &stateChangeCount, &stateChanges);
if (FAILED(hr))  
{  
    return;  
}  

for (uint32_t i = 0; i < stateChangeCount; ++i)
{
    const PFMatchmakingStateChange& stateChange = *stateChanges[i];

    switch (stateChange.stateChangeType)
    {
        case PFMatchmakingStateChangeType::TicketStatusChanged:
        {
            const auto& ticketStatusChanged = static_cast<const PFMatchmakingTicketStatusChangedStateChange&>(stateChange);

            PFMatchmakingTicketStatus status;
            if (SUCCEEDED(PFMatchmakingTicketGetStatus(ticketStatusChanged.ticket, &status)))
            {
                printf("Ticket status is now: %i.\n", status);
            }

            break;
        }
        case PFMatchmakingStateChangeType::TicketCompleted:
        {
            const auto& ticketCompleted = static_cast<const PFMatchmakingTicketCompletedStateChange&>(stateChange);

            printf("PFMatchmaking completed with Result 0x%08x.\n", ticketCompleted.result);

            if (FAILED(ticketCompleted.result))
            {
                // On failure, we must record the HRESULT so we can return the state change(s) and then bail
                // out of this function.
                hrTicketError = ticketCompleted.result;
            }

            break;
        }
    }
}

hr = PFMultiplayerFinishProcessingMatchmakingStateChanges(g_pfmHandle, stateChangeCount, stateChanges);
if (FAILED(hr))  
{  
    return;  
}  

// Now that we've returned the state change(s), bail out if we detected ticket failure.
if (FAILED(hrTicketError))  
{  
    return;  
}  
```

## Get the match

After receiving the **PFMatchmakingStateChangeType::TicketCompleted** state change, call [PFMatchmakingTicketGetMatch](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketgetmatch.md) to get the details of the match. These details contain the match ID, the users who have been matched together, and the preferred region for the match, and an arrangement string for lobby associated with the match.

Once you retrieve any information you need out of the **PFMatchmakingMatchDetails** struct, the ticket should be destroyed with [PFMultiplayerDestroyMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerdestroymatchmakingticket.md).

```cpp
const PFMatchmakingMatchDetails* match;
HREULT hr = PFMatchmakingTicketGetMatch(ticket, &match);
if (FAILED(hr))  
{  
    return;  
}  

std::string matchId = match->matchId;
std::string lobbyArrangementString = match->lobbyArrangementString;

PFMultiplayerDestroyMatchmakingTicket(g_pfmHandle, ticket);
```

## Cancelling a ticket

If you would like to cancel the matchmaking process before the time-out set in the `PFMatchmakingServerBackfillTicketConfiguration`, call [PFMatchmakingTicketCancel](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketcancel.md) with the ticket handle.

Calling this API doesn't guarantee the ticket is cancelled. The ticket could still complete before the cancellation can be processed, or the cancellation request can fail due to networking or service errors. You can still process matchmaking state changes to get the result of the ticket if you'd like to confirm the ticket cancellation is complete prior to moving on. Otherwise, you can immediately call [PFMultiplayerDestroyMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerdestroymatchmakingticket.md).

```cpp
HRESULT hr = PFMatchmakingTicketCancel(ticket);

PFMultiplayerDestroyMatchmakingTicket(g_pfmHandle, ticket);
```
