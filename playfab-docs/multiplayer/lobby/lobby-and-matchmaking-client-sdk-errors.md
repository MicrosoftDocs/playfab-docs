---
title: Handling Lobby and Matchmaking C++ SDK errors
description: Guidance on how errors are surfaced in the C++ SDK and how titles should handle them
author: ScottMunroMS
ms.author: scmunro
ms.date: 11/12/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, lobby, matchmaking, async, state change, notification
---

# Handling Lobby and Matchmaking SDK errors

This page intends to serve as a quick reference for guidance on how the PlayFab Lobby and Matchmaking SDKs
surface errors and how you should handle them.

The following topics are discussed:

- [Synchronous vs asynchronous errors](#synchronous-vs-asynchronous-errors)
- [Error codes and error messages](#error-codes-and-error-messages)

## Synchronous vs asynchronous errors

Many SDK APIs are asynchronous. You start an operation by calling an API like
[PFMultiplayerCreateAndJoinLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandjoinlobby.md)
and later that asynchronous operation completes with a "state change" like [PFLobbyCreateAndJoinLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateandjoinlobbycompletedstatechange.md).

This means, when using asynchronous Lobby and Matchmaking Client APIs, there are two types of errors that you must handle:

1. synchronous errors
2. asynchronous errors

More information on the SDK's async model and state changes can be found on the
[async operations](lobby-and-matchmaking-client-sdk-async.md) doc page.

For synchronous APIs, such as [PFLobbyGetLobbyId](playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetlobbyid.md),
you only need to handle synchronous errors.

### Synchronous errors

"Synchronous errors" are **HRESULTs** provided as the return value of an API call. These errors are generally due to
calling the API with incorrect parameters, calling the API while the library is in an invalid state, or internal library
failures to allocate memory. Any output parameters provided by the API should be considered invalid if the API returns
a synchronous error.

When calling asynchronous APIs (e.g. **PFMultiplayerCreateAndJoinLobby**), the synchronous error value only
represents whether the requested operation was able to start. For information on understanding the result of an
asynchronous operation, see the [Asynchronous errors](#asynchronous-errors) section.

### Asynchronous errors

"Asynchronous errors" are provided as **HRESULTs** in the state change associated with the
asynchronous completion of each operation, the *result* field. These errors are typically more interesting to titles 
than synchronous errors. A non-exhaustive list of some of the types of errors reported asynchronously include:

- service throttling errors
- invalid parameter errors that can't be validated synchronously on the client
- errors interacting with the real-time notification service
- connectivity errors

See the [Error codes and error messages](#error-codes-and-error-messages) section for guidance on getting human-readable 
error messages for both asynchronous and synchronous errors.

## Error codes and error messages

Errors (whether synchronous or asynchronous) are presented by the library in the form of an HRESULT: a four byte
numeric error code. These compact error codes are ideal for recording in telemetry and other diagnostic tools used to
debug unexpected title behavior.

These error codes can be converted to a human-readable message by calling [PFMultiplayerGetErrorMessage](playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
These error messages are intended to only be looked at by developers. They are not localized or intended for consumption
by end users, so are best suited for internal development logs.

Additionally a list of the SDK's error codes with their error messages are available at
[PlayFab Multiplayer SDK Error Codes](playfabmultiplayerreference-cpp/pfmultiplayererrors.md).
