---
title: Asynchronous PlayFab Party operations and notifications
description: How PlayFab Party real-time chat and data communication performs asynchronous work and notifies callers of state changes.
author: ScottMunroMS
ms.author: scmunro
ms.date: 04/11/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, party, multiplayer, networking, async, state change, notification
---

# Asynchronous PlayFab Party operations and notifications

For operations that may be slow or computationally expensive, PlayFab Party exposes asynchronous APIs. Asynchronous APIs 
give titles the ability to start expensive or slow operations from their main threads and poll for the completion of those
operations on a thread of their choice. This same polling mechanism is also used to deliver asynchronous notifications
of PlayFab Party library updates to the title. This page gives an overview of PlayFab Party's asynchronous API patterns
and best practices for programming against them.

## Basic API patterns

There are two types of asynchronous API patterns to be aware of in PlayFab Party:

1. [Asynchronous operations](#asynchronous-operations)
2. [Asynchronous notifications](#asynchronous-notifications)

### Asynchronous operations

It's simple to use PlayFab Party's asynchronous APIs. The general pattern for starting and completing asynchronous 
operations is as follows:

1. Make a regular method call to the appropriate asynchronous API of your choosing. Common asynchronous Party operations
you'll likely make use of include:
    * [PartyManager::CreateNewNetwork](reference/classes/PartyManager/methods/partymanager_createnewnetwork.md).
    * [PartyManager::ConnectToNetwork](reference/classes/PartyManager/methods/partymanager_connecttonetwork.md).
    * [PartyNetwork::AuthenticateLocalUser](reference/classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md).
    * [PartyNetwork::CreateEndpoint](reference/classes/PartyNetwork/methods/partynetwork_createendpoint.md).

2. Check the **PartyError** return value of the API with the **PARTY_SUCCEEDED()** or **PARTY_FAILED()** macros. This 
synchronously returned value will tell you whether the operation has successfully started.

> [!WARNING]
> The synchronous return value from an asynchronous Party API call does **NOT** tell you whether or not the operation
> has completed successfully. More information on [synchronous vs. asynchronous errors](#synchronous-vs-asynchronous-errors)
> is available in a later section.

3. Poll for the asynchronous operation's completion by looking for the associated operation's "completion state change"
to be provided by [PartyManager::StartProcessingStateChanges()](reference/classes/PartyManager/methods/partymanager_startprocessingstatechanges.md). An example of the associated "completion state change" for **PartyManager::CreateNewNetwork()** is
[PartyCreateNewNetworkCompletedStateChange](reference/structs/partycreatenewnetworkcompletedstatechange.md). More
detailed information on what "state changes" are and how they work can be found in the [State Changes](#state-changes)
section below.

4. Check the completion state change **result** and **errorDetail** value to determine whether the operation succeeded
or failed. More detailed information on these error values can be found in the [synchronous vs. asynchronous errors](#synchronous-vs-asynchronous-errors) section below.

### Asynchronous notifications

Some features will send the title asynchronous notifications of changes to the PlayFab Party library.

Common notifications include:

1. [EndpointCreated](reference/structs/partyendpointcreatedstatechange.md) when new endpoints are created on party networks.
2. [ChatControlJoinedNetwork](reference/structs/partychatcontroljoinednetworkstatechange.md) when chat controls join party networks.
3. [LocalChatAudioInputChanged](reference/structs/partylocalchataudioinputchangedstatechange.md) when Party registers that a local chat control's audio input has changed somehow.

These asynchronous notifications will be provided to the title by PlayFab Party as "state changes" via
[PartyManager::StartProcessingStateChanges()](reference/classes/PartyManager/methods/partymanager_startprocessingstatechanges.md).

More detailed information on what "state changes" are and how they work can be found in the
[State Changes](#state-changes) section below.

## State changes

PlayFab Party's asynchronous API model is built around the [PartyStateChange struct](reference/structs/partystatechange.md).

These "state changes" are asynchronous notifications of events from the PlayFab Party library. These notifications are
queued internally and the title processes them by calling
[PartyManager::StartProcessingStateChanges()](reference/classes/PartyManager/methods/partymanager_startprocessingstatechanges.md).
**StartProcessingStateChanges()** will return all queued state changes as a list that the title can iterate through and
process individually. Each state change has a *PartyStateChange::stateChangeType* field that can be inspected to
determine which specific state change the title is being notified about. Once the title knows which state change they
have been given, they can cast the generic **PartyStateChange** struct to a more specific type of state change struct
to inspect that event's specific data.

Typically, state change processing is implemented as a simple switch statement which delegates each state change to a
handler.

Once the list of state changes has been processed, it must be returned to
[PartyManager::FinishProcessingStateChanges()](reference/classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md).

```cpp
uint32_t stateChangeCount;
Party::PartyStateChangeArray stateChanges;
PartyError error = Party::PartyManager::GetSingleton().StartProcessingStateChanges(&stateChangeCount, &stateChanges);
if (PARTY_FAILED(error))
{
    return error;
}

for (uin32_t i = 0; i < stateChangeCount; ++i)
{
    const Party::PartyStateChange* stateChange = stateChanges[i];
    switch (stateChange->stateChangeType)
    {
        case Party::PartyStateChangeType::CreateNewNetworkCompleted:
        {
            auto createNewNetworkStateChange = static_cast<const Party::PartyCreateNewNetworkCompletedStateChange*>(stateChange);
            HandlePartyCreateNewNetworkCompleted(createNewNetworkStateChange);
            break;
        }
        // add other state change handlers here.
    }
}

error = Party::PartyManager::GetSingleton().FinishProcessingStateChanges(stateChangeCount, stateChanges);
if (PARTY_FAILED(error))
{
    return error;
}
```

> [!NOTE]
> For most titles, it is recommended to process all state changes immediately and return them to
> **FinishProcessingStateChanges()** at the same time. For advanced scenarios, it may be appropriate to hold on to
> some state changes for an extended period of time and return them later. This is discussed in more detail below in
> [Holding on to state changes](#holding-on-to-state-changes).

## Synchronous vs asynchronous errors

When using asynchronous PlayFab Party APIs, it's important to note that there are two types of errors you need to
handle:

1. synchronous errors
2. asynchronous errors

"Synchronous errors" are errors provided as the return value of an asynchronous API call and represent failures to start 
an asynchronous operation. These errors are generally due to calling the API with incorrect parameters, calling the API
while the library is in an invalid state, or internal library failures to allocate memory.

"Asynchronous errors" are provided as data in the [state change](#state-changes) associated with the asynchronous
completion of each operation. There are two fields of interest in state change structs which are relevant to error
handling.

1. `result` - a `PartyStateChangeResult` enum value available on all completion state changes. The purpose of this value
is to give titles a broad description of why an operation failed. This value can be used by titles to programmatically
react to and handle asynchronous failures.
2. `errorDetail` - a `PartyError` value available on all completion state changes and some notification state changes.
These error detail values are largely opaque and should not be programmed against. They are primarily intended to be
written in diagnostics -- such as telemetry or error logs -- for the purposes of getting a more detailed understanding
of why an operation failed. These error details can be converted to a human-readable format by calling
[PartyManager::GetErrorMessage()](reference/classes/PartyManager/methods/partymanager_geterrormessage.md). These error
messages are intended to only be looked at by developers. They are not localized or intended for consumption by end
users. Additionally a list of the PlayFab Party SDK's error codes with their error messages are available in our 
[PlayFab Party Error Codes](reference/partyerrors.md) doc.

> [!IMPORTANT]
> When capturing state change failures (e.g. developer logs, telemetry,
> [PlayFab Developer Community](https://community.playfab.com) error reports, etc.) it is *strongly* recommended that you
> capture both the `result` and `errorDetail` values of all relevant state changes as part of your diagnostics. The two
> values together capture more information than either value in isolation.

## Asynchronous operation identifiers

Each asynchronous API includes a `void* asyncIdentifer` parameter. This value is a pass-through parameter that will be 
set on this API call's associated completion state change once it's provided by **StartProcessingStateChanges()**.

The purpose of this value is to give titles a mechanism to attach arbitrary, pointer-sized contexts to their
asynchronous API calls. These contexts can be used in many scenarios including:
1. associating title-specific data with a PlayFab Party API call
2. tying together multiple asynchronous operations with a shared identifier

These asynchronous identifiers are not required for use of PlayFab Party but can make some title logic easier to write.

## Operation queuing

Frequently when working with asynchronous APIs, multiple asynchronous operations need to run one after the other as part
of a larger asynchronous flow.

In PlayFab Party, one example would be joining a Party network and connecting a chat control to it. Serialized, this
flow would look like:

1. Call **PartyManager::ConnectToNetwork()** to connect your device to the party network.
2. Wait for the **PartyConnectToNetworkCompletedStateChange** to reflect that the connection succeeded.
3. Call **PartyNetwork::AuthenticateLocalUser()** to authenticate and join your user to the party network.
4. Wait for the **PartyAuthenticateLocalUserCompletedStateChange** to reflect that the authentication succeeded.
5. Call **PartyNetwork::ConnectChatControl()** to connect your chat control to the party network.
6. Wait for the **PartyConnectChatControlCompletedStateChange** to reflect that your chat control connection succeeded.

For more complicated flows and title logic, this serialized pattern may be appropriate. However, for simpler flows, PlayFab
Party provides an alternative that intends to simplify title code:

Many PlayFab Party APIs which are asynchronous support queuing of dependent operations before a previous operation has
fully completed. From the previous example, you can start authenticating your local user into a party
network before you've successfully completed connecting **and** start connecting your chat control before it's
associated local user has finished authenticating.

Effectively, queuing allows you to bundle a collection of asynchronous operations together, kick them off all at once, 
and coalesce error handling to a single failure point.

```cpp
Party::PartyNetwork* newPartyNetwork;
PartyError err = PartyManager::GetSingleton().ConnectToNetwork(networkDescriptor, nullptr, &newPartyNetwork);
if (PARTY_SUCCEEDED(err))
{
    err = newPartyNetwork->AuthenticateLocalUser(m_localUser, networkInvitation, nullptr);
    if (PARTY_SUCCEEDED(err))
    {
        err = newPartyNetwork->ConnectChatControl(m_chatControl, nullptr);
        if (PARTY_SUCCEEDED(err))
        {
            Log("Connecting chat control to new party network!");
            m_network = newPartyNetwork;

            // After this point, we should log any failures reported in PartyConnectToNetworkCompletedStateChange,
            // PartyAuthenticateLocalUserCompletedStateChange, and PartyConnectChatControlCompletedStateChange for
            // diagnostic purposes, but all final failure logic and any retry logic can be coalesced into
            // PartyConnectChatControlCompletedStateChange.
        }
    }

    // If we experienced any unexpected failures to start the authentice or connect-chat-control operations, queue
    // a leave operation so we don't join the network in a half-state.
    if (PARTY_FAILED(err))
    {
        (void) newPartyNetwork->LeaveNetwork(nullptr);
    }
}
```

## Holding on to state changes

Typically, state changes provided by **StartProcessingStateChanges()** are processed immediately and returned directly
to **FinishProcessingStateChanges()**.

```cpp
uint32_t stateChangeCount;
Party::PartyStateChangeArray stateChanges;
PartyError error = Party::PartyManager::GetSingleton().StartProcessingStateChanges(&stateChangeCount, &stateChanges);
if (PARTY_FAILED(error))
{
    return error;
}


// process the state changes
// ...

error = Party::PartyManager::GetSingleton().FinishProcessingStateChanges(stateChangeCount, stateChanges);
if (PARTY_FAILED(error))
{
    return error;
}
```

This is the recommended flow because it's simple to program against and supports the vast majority of title scenarios.
But for some advanced scenarios, it can be appropriate to hold on to a subset of state changes and return them out of
their original order at a later time. Typically, this is done to extend the lifetime a resource associated with that
state change.

For example, your title may process state changes on your main thread, but process the received endpoint messages on a
background thread that updates title-state based on network updates. Under the typical state change processing flow, this
would require you to copy the endpoint message from the **PartyEndpointMessageReceivedStateChange** into a longer-lived
buffer since the state change's buffer would be reclaimed when the state change was returned to
**FinishProcessingStateChanges()**. By setting aside the **PartyEndpointMessageReceivedStateChange** and deferring its
return until after you've processed the message, you can avoid the need for frequent copies.

```cpp
uint32_t endpointMessageCount = 0;
for (uint32_t i = 0; i < stateChangeCount; ++i)
{
    switch (stateChanges[i]->stateChangeType)
    {
        //
        // ... Process all state change types except for EndpointMessageReceived here...
        //
    }
}

// if there were any endpoint messages in the queue, separate them out, queue them, and return the remaining state
// changes in a separate buffer

// NOTE: this sample uses local std::vectors for brevity, but avoiding heap allocations by reusing vectors or
// using a fixed sized buffer tuned for your game may be appropriate.
std::vector<const Party::PartyStateChange*> nonEndpointStateChanges;
std::vector<const Party::PartyStateChange*> endpointStateChanges;
for (uint32_t i = 0; i < stateChangeCount; ++i)
{
    if (stateChanges[i]->stateChangeType == Party::PartyStateChangeType::EndpointMessageReceived)
    {
        endpointStateChanges.push_back(stateChanges[i]);
    }
    else
    {
        nonEndpointStateChanges.push_back(stateChanges[i]);
    }
}

// Return all non-endpoint message state changes
err = PartyManager::GetSingleton().FinishProcessingStateChanges(
    static_cast<uint32_t>(nonEndpointStates.size()),
    nonEndpointStateChanges.data());

// Title-defined function to queue all endpoint message state changes for later processing.
// QueueEndpointMessagesForLaterProcessing will hold any locks necessary to write to the endpoint message queue
MyGame::QueueEndpointMessagesForLaterProcessing(endpointStateChanges.size(), endpointStateChanges.data());

//
// Elsewhere in another thread/execution context...
//
std::vector<const Party::PartyStateChange*> endpointStateChanges;
// Title-defined function to copy all endpoint message state change pointers that we've so far queued.
// TakeEndpointMessagesOutOfQueue will hold any locks necessary to drain the endpoint message queue.
MyGame::TakeEndpointMessagesOutOfQueue(&endpointStateChanges);

for (const Party::PartyStateChange* stateChange : endpointStateChanges)
{
    auto endpointMessage = static_cast<const Party::PartyEndpointMessageReceivedStateChange*>(stateChange);
    // process the endpoint message
}

err = PartyManager::GetSingleton().FinishProcessingStateChanges(
    static_cast<uint32_t>(endpointStateChanges.size()),
    endpointStateChanges.data());
```

Holding on to state changes can enable titles to have tighter control over some of PlayFab Party's memory and resources,
at the cost of more complex title logic.

## Controlling asynchronous work

It's sometimes necessary for titles to control when and where asynchronous work is done to avoid CPU contention between
libraries like PlayFab Party and their title's core CPU workloads.

PlayFab Party gives titles two options for controlling how asynchronous PlayFab Party work is run:

1. [Controlling thread affinity](#controlling-thread-affinity)
2. [Manually dispatching asynchronous work](#manually-dispatching-asynchronous-work)

### Controlling thread affinity

By default, asynchronous PlayFab Party work is done on carefully controlled background threads. Some titles only need
coarse-grain control over *where* these background threads are scheduled in order to avoid CPU contention.

For these titles, PlayFab Party provides
[PartyManager::SetThreadAffinityMask()](reference/classes/PartyManager/methods/partymanager_setthreadaffinitymask.md).
On supported platforms, this allows titles to limit which CPU cores will be used for PlayFab Party's background threads.
This way titles can guarantee that certain cores are reserved for their own CPU workloads without any contention.

### Manually dispatching asynchronous work

For some titles, just controlling *where* PlayFab Party does its asynchronous work is not enough. They also need to
control *when* PlayFab Party does its asynchronous work. For these titles, PlayFab Party provides
[PartyManager::SetWorkMode()](reference/classes/PartyManager/methods/partymanager_setworkmode.md) and
[PartyManager::DoWork()](reference/classes/PartyManager/methods/partymanager_dowork.md). **PartyWorkMode::Manual**
enables titles to use the PlayFab Party library without *any* background threads. Titles manually drive Party's
asynchronous background work in the execution context of their choosing with direct control over when that work happens.

> [!WARNING]
> Manually dispatching asynchronous Party work is an advanced feature. Even in **PartyWorkMode::Manual**, asynchronous
> Party work must be dispatched periodically and regularly. PlayFab Party may not function correctly if asynchronous
> work is not dispatched in a timely manner.
>
> Please carefully read the documentation for
> [PartyManager::DoWork()](reference/classes/PartyManager/methods/partymanager_dowork.md) for guidance on how to
> correctly dispatch this work.
>
> If manual dispatch is not required, it is recommended to use Party's default asynchronous work configuration or 
> [thread affinity controls](#controlling-thread-affinity) instead.
