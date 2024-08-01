---
title: Matchmaking SDK quickstart
author: sardavi
description: Quickstart which demonstrates a matchmaking flow using the SDK
ms.author: kevinasg
ms.date: 12/06/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers, matchmaking
ms.localizationpriority: medium
---

# Matchmaking SDK quickstart
 

This quickstart guide walks you through the entire process for adding matchmaking to your game using the PlayFab Multiplayer SDK.

This tutorial illustrates how to submit a ticket to a specific queue in order to find a game. A queue likely maps to a game mode or multiple game modes (ex.: a capture the flag mode and a king of the hill mode in the same queue).

The matchmaking service handles finding a match amongst tickets in a queue. When a match is found, your title must handle connecting the players together for gameplay.

> [!NOTE]
> The PlayFab Multiplayer SDK also provides APIs for PlayFab Lobbies.
> * For more information on C++ APIs, see the [Lobby SDK quickstart](../lobby/lobby-getting-started.md)
> * For more information on Unity APIs, see the [Quickstart for Unity](../lobby/lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
> * For more information on Unreal APIs, see the [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)


## Prerequisites

You need a [PlayFab account](https://playfab.com) to use PlayFab Matchmaking. For instructions to create an account, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).

## Configure a matchmaking queue in Game Manager

The library matches users together who create tickets for queues that are configured in Game Manager. For details on how to set one up, see [Configuring matchmaking queues](config-queues.md).

## Download and set up the PlayFab Multiplayer SDK

Download the [C/C++ SDK](../lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md) for your platform and integrate the provider header and library files into your build.

> [!NOTE]
> This quick start focuses on using the C/C++ SDK. For Unity and Unreal interfaces, see the following articles:
> * [Quickstart for Unity](../lobby/lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
> * [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)

## Log in a PlayFab entity

To use the PlayFab Lobby SDK, you need to authenticate your client using PlayFab entity keys and entity tokens. Acquire a PlayFab entity key and token pair by logging in with [LoginWithCustomId](/rest/api/playfab/client/authentication/login-with-custom-id) REST API. This API is also available as a C/C++ projection via the [PlayFab REST SDK](/gaming/playfab/sdks/playfab-sdk-intro).

> [!NOTE]
> LoginWithCustomId is a quick way to get started with PlayFab features but is not intended to be the login mechanism you ship with. For login guidance, see [Login basics and best practices](/features/authentication/login/login-basics-best-practices).

## Initialize the PlayFab Multiplayer SDK

Initialize the PlayFab Multiplayer SDK by following these basic steps:

1. Initialize the SDK by calling [PFMultiplayerInitialize](../lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayerinitialize.md)
2. Set the entity key and token used by the library on behalf of your players by calling [PFMultiplayerSetEntityToken](../lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md).

```cpp
static PFMultiplayerHandle g_pfmHandle = nullptr;
...
...
HRESULT hr = S_OK;

// Initialize the PFMultiplayer library.
hr = PFMultiplayerInitialize(titleId, &g_pfmHandle);
if (FAILED(hr))
{
    // handle initialize failure
}

// Set an entity token for a local user. The token is used to authenticate PlayFab operations on behalf of this user. 
// Tokens can expire, and this API token should be called again when this token is refreshed.
hr = PFMultiplayerSetEntityToken(g_pfmHandle, localUserEntity, entityToken);
if (FAILED(hr))
{
    // handle set entity token failure
}
```

## Create a matchmaking ticket

You create a matchmaking ticket using [PFMultiplayerCreateMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreatematchmakingticket.md), in which you specify all local users that should be part of the match and any attributes you want associated with those users.

This function also takes a [PFMatchmakingTicketConfiguration](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingticketconfiguration.md) where you specify which queue the ticket is for, a timeout for the ticket, and any remote users that you want to match into this ticket.

### Matchmaking with a single local user

You can start matchmaking for a single local user with a call to **PFMultiplayerCreateMatchmakingTicket**.

```cpp
const char* yourQueueName = ...; // This is the name of the queue you configured in Game Manager.

PFMatchmakingTicketConfiguration configuration{};
configuration.timeoutInSeconds = 120;
configuration.queueName = yourQueueName;

const char* attributes = "\"{\"color\":\"blue\", \"role\":\"tank\"}\"";

const PFMatchmakingTicket* ticket;
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

### Matchmaking with a group of remote users

To start group matchmaking with remote users, it's helpful to think of one client as the leader. Have the leader create the ticket using **PFMultiplayerCreateMatchmakingTicket**, specifying the other users in the group through the **configuration** parameter. Once the ticket is created, call **GetTicketId** to get the ticket ID. Send this ID to each other user through an external mechanism, such as a networking mesh or a shared PlayFab Lobby, and have each client call **PFMultiplayerJoinMatchmakingTicketFromId** with the ticket ID to join the matchmaking ticket. The ticket status will be **PFMatchmakingTicketStatus::WaitingForPlayers** while waiting for the specified players to join and will change to **PFMatchmakingTicketStatus::WaitingForMatch** once all players have joined the ticket.

```cpp
// Creating the ticket on the leader's client

const char* remoteMemberEntityId1 = ...;
const char* remoteMemberEntityId2 = ...;

std::vector<PFEntityKey> remoteMatchMemberEntityKeys;
remoteMatchMemberEntityKeys.push_back({ remoteMemberEntityId1, "title_player_account" });
remoteMatchMemberEntityKeys.push_back({ remoteMemberEntityId2, "title_player_account" });

const char* yourQueueName = ...; // This is the name of the queue you configured in Game Manager.

PFMatchmakingTicketConfiguration configuration{};
configuration.timeoutInSeconds = 120;
configuration.queueName = yourQueueName;
configuration.membersToMatchWithCount = 2; // number of remote members to match with
configuration.membersToMatchWith = remoteMatchMemberEntityKeys.data();

const char* attributes = "\"{\"color\":\"blue\", \"role\":\"tank\"}\"";

const PFMatchmakingTicket* ticket;
HRESULT hr = PFMultiplayerCreateMatchmakingTicket(
    g_pfmHandle,
    1, // number of local users
    localUserEntity,
    &attributes,
    &configuration,
    nullptr, // optional asyncContext
    &ticket);
RETURN_IF_FAILED(hr);

// Getting the ticket ID

PCSTR ticketId;
hr = PFMatchmakingTicketGetTicketId(ticket, &ticketId);
RETURN_IF_FAILED(hr);
```

```cpp
// Joining the ticket on the other players' clients

const char* attributes = "\"{\"color\":\"blue\", \"role\":\"healer\"}\"";
const char* yourQueueName = ...; // This is the name of the queue you configured in Game Manager.

const PFMatchmakingTicket* ticket;
HRESULT hr = PFMultiplayerJoinMatchmakingTicketFromId(
    g_pfmHandle,
    1, // number of local users
    localUserEntity,
    &attributes,
    ticketId,
    yourQueueName,
    nullptr, // optional asyncContext
    &ticket);
```

### Matchmaking with multiple local users

When matchmaking with multiple local users, instead of passing in one **PFEntityKey** to either the **PFMultiplayerCreateMatchmakingTicket** or the **PFMultiplayerJoinMatchmakingTicketFromId** functions, you need to pass in a list of keys. Similarly, you'll need to pass in a list of attributes for each user. Each list entry position should correspond with each other. Meaning that the first entry in attributes list should be the attributes for the first player in the **PFEntityKey** list.

```cpp
const char* yourQueueName = ...; // This is the name of the queue you configured in Game Manager.

PFMatchmakingTicketConfiguration configuration{};
configuration.timeoutInSeconds = 120;
configuration.queueName = queueName;

std::vector<PFEntityKey> localMatchMemberEntityKeys{ ... };
std::vector<PCSTR> localMatchMemberAttributes{ ... };

const PFMatchmakingTicket* ticket;
HRESULT hr = PFMultiplayerCreateMatchmakingTicket(
    g_pfmHandle,
    static_cast<uint32_t>(localMatchMemberEntityKeys.size())
    localMatchMemberEntityKeys.data(),
    localMatchMemberAttributes.data(),
    &configuration,
    nullptr, // optional asyncContext
    &ticket);
RETURN_IF_FAILED(hr);
```

## Check the status of the matchmaking ticket

You must check for updates to the ticket by calling [PFMultiplayerStartProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) to receive state changes and then calling [PFMultiplayerFinishProcessingMatchmakingStateChanges](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) when you're done processing those state changes.

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

After receiving the **PFMatchmakingStateChangeType::TicketCompleted** state change, call [PFMatchmakingTicketGetMatch](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketgetmatch.md) to get the details of the match. These details will contain the match ID, the users who have been matched together, and the preferred region for the match, and an arrangement string for lobby associated with the match.

Once you've retrieved any information you need out of the **PFMatchmakingMatchDetails** struct, the ticket should be destroyed with [PFMultiplayerDestroyMatchmakingTicket](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerdestroymatchmakingticket.md).

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

Calling this API doesn't guarantee the ticket will be canceled. The ticket could still complete before the cancelation can be processed, or the cancelation request may fail due to networking or service errors. You should still process matchmaking state changes to get the result of the ticket.

### Example using the Matchmaking client SDK
```cpp
HRESULT hr = PFMatchmakingTicketCancel(ticket);
```

## (Optional) Connecting your players together into a Lobby

After your players have matched, they can join up together in a lobby. The **PFMatchmakingMatchDetails** from the matched ticket contains a **lobbyArrangementString** field, which can be used to join the users into the same Lobby.

For more information about how Lobby and Matchmaking interact together, see [Use lobby and matchmaking together](../lobby/lobby-and-matchmaking.md).

For more information about PlayFab Lobbies, see the [PlayFab Lobby Overview](../lobby/index.md).

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

## See also

* [Lobby SDK](../lobby/lobby-getting-started.md)
