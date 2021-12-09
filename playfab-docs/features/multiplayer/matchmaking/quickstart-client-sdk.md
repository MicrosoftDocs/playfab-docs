---
title: Matchmaking quickstart - client SDK
author: sardavi
description: Quickstart which demonstrates a matchmaking flow using the client SDK
ms.author: sardavi
ms.date: 12/06/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, servers, matchmaking
ms.localizationpriority: medium
---

# Matchmaking Client SDK quickstart

> [!IMPORTANT]
> This feature is in **private preview** for limited, Microsoft managed partners.

This quickstart guide walks you through the entire process for integrating the matchmaking feature in your title code.

This tutorial illustrates how to submit a ticket to a specific queue in order to find a game. A queue likely maps to a game mode or multiple game modes (ex.: a capture the flag mode and a king of the hill mode in the same queue).

The matchmaking service handles finding a match amongst tickets in a queue. When a match is found, your title must handle connecting the players together for gameplay.

## Prerequisites

You need a PlayFab account to access Lobby and Matchmaking features.

Create/sign in to your [PlayFab account](https://playfab.com). For instructions, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).

## Configure a matchmaking queue in Game Manager

The library matches users together who create tickets for queues that are configured in Game Manager. For details on how to set one up, see [Configuring matchmaking queues](config-queues.md).

## Download and set up the PlayFab Multiplayer Client SDK

Like the PlayFab Core SDKs, we have Multiplayer SDKs for different platforms and game engines. Select and download the one that you need. 

For download links, see [Multiplayer SDKs](../lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md).

For Unity and Unreal set up instructions, see the following articles.
* [Quickstart for Unity](../lobby/lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
* [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)

## Initialize PlayFab Multiplayer Client SDK

Now that you've finished the setup, you're ready to make your first API call and use more Multiplayer features, such as Matchmaking.

To start making Multiplayer API calls, you also need the PlayFab Entity Token. Get it via REST calls ([GetEntityToken](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken)) or by using the PlayFab Core SDK.

Once you have the entity token, initialize the Multiplayer library using [PFMultiplayerInitialize](../lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayerinitialize.md) and call [PFMultiplayerSetEntityToken](../lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md) to set the entity token for your local users.

### Example using the Matchmaking client SDK

```cpp
static PFMultiplayerHandle g_pfmHandle = nullptr;
...
...
HRESULT hr = PFMultiplayerInitialize(titleId, &g_pfmHandle);
RETURN_IF_FAILED(hr);

hr = PFMultiplayerSetEntityToken(g_pfmHandle, localUserEntity, entityToken);
RETURN_IF_FAILED(hr);
```

## Create a matchmaking ticket

A user creates a matchmaking ticket using [PFMultiplayerCreateMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreatematchmakingticket.md) where you will pass in the local user and any attributes you want associated with that user.

This function also takes a [PFMatchmakingTicketConfiguration](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingticketconfiguration.md) where you specify which queue the ticket is for, a timeout for the ticket, and any remote users that you want to match into this ticket.

### Example using the Matchmaking client SDK

This example creates a matchmaking ticket for a single existing local user and two remote users.

```cpp
const char* remoteMemberEntityId1 = ...;
const char* remoteMemberEntityId2 = ...;

std::vector<PFEntityKey> remoteMatchMemberEntityKeys;
remoteMatchMemberEntityKeys.push_back({ remoteMemberEntityId1, "title_player_account" });
remoteMatchMemberEntityKeys.push_back({ remoteMemberEntityId2, "title_player_account" });

const char* yourQueueName = ...; // This is the name of the queue you configured in Game Manager.

PFMatchmakingTicketConfiguration configuration{};
configuration.timeoutInSeconds = 120;
configuration.queueName = queueName;
configuration.membersToMatchWithCount = 2;
configuration.membersToMatchWith = remoteMatchMemberEntityKeys.data();

const PFMatchmakingTicket* ticket;
const char* attributes = "\"{\"color\":\"blue\", \"role\":\"tank\"}\"";
HRESULT hr = PFMultiplayerCreateMatchmakingTicket(
    g_pfmHandle,
    1, // number of local users
    localUserEntity,
    &attributes,
    &configuration,
    nullptr, // optional asyncContext
    &ticket);
RETURN_IF_FAILED(hr);
```

## Check the status of the matchmaking ticket

You must poll for updates to the ticket by calling [PFMultiplayerStartProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) to receive state changes and then calling [PFMultiplayerFinishProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) when you are done processing those state changes.

The SDK will return a **TicketStatusChanged** state change any time the status of the ticket changes and a **TicketCompleted** state change when matchmaking has completed.

### Example using the Matchmaking client SDK

```cpp
HRESULT hrTicketError = S_OK;

uint32_t stateChangeCount;
const PFMatchmakingStateChange * const * stateChanges;
hr = PFMultiplayerStartProcessingMatchmakingStateChanges(g_pfmHandle, &stateChangeCount, &stateChanges);
RETURN_IF_FAILED(hr);

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
RETURN_IF_FAILED(hr);

// Now that we've returned the state change(s), bail out if we detected ticket failure.
RETURN_IF_FAILED(hrTicketError);
```

## Get the match

After receiving the **PFMatchmakingStateChangeType::TicketCompleted** state change, call [PFMatchmakingTicketGetMatch](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketgetmatch.md) to get the details of the match. This will contain the match id, the users who have been matched together, and the preferred region for the match, and an arrangement string for lobby associated with the match.

Once you have retrieved any information you need out of the **PFMatchmakingMatchDetails** struct, the ticket should be destroyed with [PFMultiplayerDestroyMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerdestroymatchmakingticket.md).

### Example using the Matchmaking client SDK

```cpp
const PFMatchmakingMatchDetails* match;
HREULT hr = PFMatchmakingTicketGetMatch(ticket, &match);
RETURN_IF_FAILED(hr);

std::string matchId = match->matchId;
std::string lobbyArrangementString = match->lobbyArrangementString;

PFMultiplayerDestroyMatchmakingTicket(g_pfmHandle, ticket);
```

## Cancelling a matchmaking ticket

If for some reason your client wants to cancel the matchmaking process prior to the timeout set in the ```PFMatchmakingTicketConfiguration```, call [PFMatchmakingTicketCancel](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketcancel.md) with the ticket handle.

Calling this doesn't guarantee the ticket will be canceled. The ticket could still complete before the cancelation can be processed, or the cancelation request may fail due to networking or service errors. You should still process matchmaking state changes to get the result of the ticket.

### Example using the Matchmaking client SDK
```cpp
HRESULT hr = PFMatchmakingTicketCancel(ticket);
```

## (Optional) Connecting your players together into a Lobby

Once your players have matched, you will want to have them join each other. The **PFMatchmakingMatchDetails** from the matched ticket contains a **lobbyArrangementString** field which can be used to join the users into the same Lobby.

For more information about how Lobby and Matchmaking interact together, see [Use lobby and matchmaking together](../lobby/lobby-and-matchmaking.md).

For more information about interacting with lobbies, see [Lobby Documentation](../lobby/index.md).

### Example using the Matchmaking client SDK

```cpp
const PFMatchmakingMatchDetails* match;
HREULT hr = PFMatchmakingTicketGetMatch(ticket, &match);
RETURN_IF_FAILED(hr);

std::string matchId = match->matchId;
std::string lobbyArrangementString = match->lobbyArrangementString;

PFMultiplayerDestroyMatchmakingTicket(g_pfmHandle, ticket);

PFLobbyHandle lobby;
RETURN_IF_FAILED_HR(PFMultiplayerJoinArrangedLobby(
    m_pfmHandle,
    &joiningUser,
    lobbyArrangementString,
    &joinConfig,
    nullptr, // optional asyncContext
    &lobby));
```

## Conclusion

Using this quickstart, you should now have a successful matchmaking flow in your game. In addition, you should consider the following:

* How your title handles group formation.
* What your title displays while users are waiting for a match.
* How to handle failures and retries.
