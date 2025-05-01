---
title: Asynchronous Lobby and Matchmaking C++ SDK operations and notifications
description: How the C++ SDK performs asynchronous work and notifies callers of state changes.
author: ScottMunroMS
ms.author: scmunro
ms.date: 11/12/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, lobby, matchmaking, async, state change, notification
---

# Asynchronous operations and notifications

For operations that may be slow or computationally expensive, the PlayFab Lobby and Matchmaking SDK exposes asynchronous
APIs. Asynchronous APIs give you the ability to start expensive or slow operations from your main threads and poll
for the completion of those operations on a thread of your choice. This same polling mechanism is also used to deliver
asynchronous notifications of SDK updates to your title code. This page gives an overview of the PlayFab Lobby and
Matchmaking SDK's asynchronous API patterns and best practices for programming against them.

## Basic API patterns

There are two types of asynchronous API patterns to be aware of in the PlayFab Lobby and Matchmaking SDK:

1. [Asynchronous operations](#asynchronous-operations)
2. [Asynchronous notifications](#asynchronous-notifications)

### Asynchronous operations

It's simple to use the SDK's asynchronous APIs. The general pattern for starting and completing asynchronous
operations is as follows:

1. Make a regular method call to the appropriate asynchronous API of your choosing. Common asynchronous operations
you'll likely make use of include:
    * [PFMultiplayerCreateAndJoinLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandjoinlobby.md).
    * [PFMultiplayerJoinLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerjoinlobby.md).
    * [PFLobbyPostUpdate](playfabmultiplayerreference-cpp/pflobby/functions/pflobbypostupdate.md).
    * [PFMultiplayerCreateMatchmakingTicket](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreatematchmakingticket.md).

2. Check the **HRESULT** return value of the API with the **SUCCEEDED()** or **FAILED()** macros. This synchronously
returned value will tell you whether the operation has successfully started.

> [!WARNING]
> The synchronous return value from an asynchronous API call does **NOT** tell you whether or not the operation
> has completed successfully. For more information on synchronous vs asynchronous errors, check out the SDK's
> [error handling documentation](lobby-and-matchmaking-client-sdk-errors.md#synchronous-vs-asynchronous-errors).

3. Poll for the asynchronous operation's completion by looking for the associated operation's "completion state change"
to be provided by [PFMultiplayerStartProcessingLobbyStateChanges()](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md)
or [PFMultiplayerStartProcessingMatchmakingStateChanges](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md).
An example of the associated "completion state change" for **PFMultiplayerCreateAndJoinLobby()** is
[PFLobbyCreateAndJoinLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateandjoinlobbycompletedstatechange.md).
More detailed information on what "state changes" are and how they work can be found in the
[State Changes](#state-changes) section.

4. Check the completion state change's **result** value to determine whether the operation succeeded or failed.
More detailed information on these error values can be found in the SDK's [error handling documentation](lobby-and-matchmaking-client-sdk-errors.md#synchronous-vs-asynchronous-errors).

### Asynchronous notifications

Some features will generate asynchronous notifications of changes to the Lobby and Matchmaking SDK.

Common notifications include:

1. [Lobby update notifications](playfabmultiplayerreference-cpp/pflobby/structs/pflobbyupdatedstatechange.md).
2. [Lobby disconnect notifications](playfabmultiplayerreference-cpp/pflobby/structs/pflobbydisconnectingstatechange.md).
3. [Matchmaking ticket status change notifications](playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingticketstatuschangedstatechange.md).

These asynchronous notifications will be provided to you by the SDK as "state changes" via
[PFMultiplayerStartProcessingLobbyStateChanges()](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md)
and [PFMultiplayerStartProcessingMatchmakingStateChanges](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md).

More detailed information on what "state changes" are and how they work can be found in the [State Changes](#state-changes)
section.

## State changes

The Lobby and Matchmaking SDK's asynchronous API model is built around the [PFLobbyStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbystatechange.md)
and [PFMatchmakingStateChange](playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingstatechange.md)
structs. **PFLobbyStateChanges** notify you about changes to the lobby subsystem and **PFMatchmakingStateChanges**
notify you about changes to the matchmaking subsystem.

These "state changes" are asynchronous notifications of events from the SDK. These notifications are
queued internally and you process them by calling [PFMultiplayerStartProcessingLobbyStateChanges()](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md)
and [PFMultiplayerStartProcessingMatchmakingStateChanges](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md).
These functions will return all queued state changes (for their respective API subsystem) as lists that you can
iterate through and process individually. Each state change has a corresponding *stateChangeType* field that can be
inspected to determine which specific state change you are being notified about. Once you know which state change you
have been given, you can cast the generic **PFLobbyStateChange** or **PFMatchmakingStateChange** struct to
a more specific type of state change struct to inspect that event's specific data.

Typically, state change processing is implemented as a simple switch statement which delegates each state change to a
handler.

Once the list of state changes has been processed from **PFMultiplayerStartProcessingLobbyStateChanges** or **PFMultiplayerStartProcessingMatchmakingStateChanges**,
it must be returned to [PFMultiplayerFinishProcessingMatchmakingStateChanges()](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md)
or [PFMultiplayerFinishProcessingMatchmakingStateChanges()](playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md),
respectively.

```cpp
//
// Process Lobby state changes
//
uint32_t lobbyStateChangeCount;
const PFLobbyStateChange * const * lobbyStateChanges;
HRESULT hr = PFMultiplayerStartProcessingLobbyStateChanges(m_pfmHandle, &lobbyStateChangeCount, &lobbyStateChanges);
if (FAILED(hr))
{
    return hr;
}

for (uint32_t i = 0; i < lobbyStateChangeCount; ++i)
{
    const PFLobbyStateChange* stateChange = lobbyStateChanges[i];
    switch (stateChange->stateChangeType)
    {
        case PFLobbyStateChangeType::CreateAndJoinLobbyCompleted:
        {
            HandleCreateAndJoinLobbyCompleted(
                static_cast<const PFLobbyCreateAndJoinLobbyCompletedStateChange*>(stateChange));
            break;
        }
        // add other state change handlers here
    }
}

hr = PFMultiplayerFinishProcessingLobbyStateChanges(m_pfmHandle, lobbyStateChangeCount, lobbyStateChanges);
if (FAILED(hr))
{
    return hr;
}

//
// Process Match state changes
//
uint32_t matchStateChangeCount;
const PFMatchmakingStateChange * const * matchStateChanges;
hr = PFMultiplayerStartProcessingMatchmakingStateChanges(m_pfmHandle, &matchStateChangeCount, &matchStateChanges);
if (FAILED(hr))
{
    return hr;
}

for (uint32_t i = 0; i < matchStateChangeCount; ++i)
{
    const PFMatchmakingStateChange* stateChange = matchStateChanges[i];
    switch (stateChange->stateChangeType)
    {
        case PFMatchmakingStateChangeType::TicketStatusChanged:
        {
            HandleMatchmakingTicketStatusChanged(
                static_cast<const PFMatchmakingTicketStatusChangedStateChange*>(stateChange));
            break;
        }
        // add other state change handlers here
    }
}

hr = PFMultiplayerFinishProcessingMatchmakingStateChanges(m_pfmHandle, matchStateChangeCount, matchStateChanges);
if (FAILED(hr))
{
    return hr;
}
```

## Asynchronous operation contexts

Each asynchronous API includes a `void* asyncContext` parameter. This value is a pass-through parameter that will be set
on this API call's associated completion state change once it's provided by **PFMultiplayerStartProcessingLobbyStateChanges()**
or **PFMultiplayerStartProcessingMatchmakingStateChanges()**.

This value gives you a mechanism to attach arbitrary, pointer-sized contexts to your asynchronous API calls. These
contexts can be used in many scenarios including:
1. associating title-specific data with an SDK call
2. tying together multiple asynchronous operations with a shared identifier

These asynchronous contexts are not required for use of the SDK but can make some title logic easier to write.

## Operation queuing

Frequently, when working with asynchronous APIs, multiple asynchronous operations need to run sequentially as part
of a larger asynchronous flow.

In the Lobby and Matchmaking SDK, one example would be creating a lobby and sending invites to your friends for
that lobby. Serialized, this flow would look like:

1. Call **PFMultiplayerCreateAndJoinLobby()** to create and join a PlayFab lobby.
2. Wait for the **PFLobbyCreateAndJoinLobbyCompletedStateChange** to reflect that the lobby was successfully created and joined.
3. Call **PFLobbySendInvite()** for each invited friend.
4. Wait for the **PFLobbySendInviteCompletedStateChange** to reflect that the invite was successfully sent.

For more complicated flows and title logic, this serialized pattern may be appropriate. However, for simpler flows,
the SDK provides an alternative that intends to simplify title code:

Many asynchronous APIs in the SDK support queuing of dependent operations before a previous operation has
fully completed. From the previous example, you can send an invite for a lobby before you've seen that
lobby successfully created.

Effectively, queuing allows you to bundle a collection of asynchronous operations together, kick them off all at once,
and coalesce error handling to a single failure point.

```cpp
PFLobbyHandle newLobby;
HRESULT hr = PFMultiplayerCreateAndJoinLobby(m_pfmHandle, myPlayerEntityId, newLobbyConfiguration, nullptr, nullptr, &newLobby);
if (SUCCEEDED(hr))
{
    for (size_t i = 0; SUCCEEDED(hr) && i < friends.size(); ++i)
    {
        hr = PFLobbySendInvite(m_pfmHandle, myPlayerEntityId, friends[i], nullptr);
    }

    if (SUCCEEDED(hr))
    {
        m_lobby = newLobby;
        Log("Created lobby and invited %zu friends!", friends.size());
    }
    else
    {
        // For the purposes of demonstration, we could have a policy that we shouldn't bother with any lobbies where
        // we couldn't invite all of our friends.
        (void) PFLobbyLeave(newLobby, myPlayerEntityId, nullptr);
    }
}
```

## Controlling asynchronous work

It's sometimes necessary for titles to control where asynchronous work is done to avoid CPU contention between
libraries and the title's core CPU workloads.

The Lobby and Matchmaking SDK lets you control how asynchronous work is run by
[Controlling thread affinity](#controlling-thread-affinity)

### Controlling thread affinity

By default, asynchronous SDK work is done on carefully controlled background threads. Some titles need
coarse-grain control over *where* these background threads are scheduled in order to avoid CPU contention.

For these titles, the Lobby and Matchmaking SDK provides
[PFMultiplayerSetThreadAffinityMask()](playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetthreadaffinitymask.md).
On supported platforms, this allows you to limit which CPU cores will be used for the SDK's background threads.
This way you can guarantee that certain cores are reserved for your own CPU workloads without any contention.
