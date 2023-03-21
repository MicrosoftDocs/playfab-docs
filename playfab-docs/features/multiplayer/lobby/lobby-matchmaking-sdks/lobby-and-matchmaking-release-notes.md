---
title: PlayFab Multiplayer C++ SDK Release Notes
author: ScottMunroMS
description: Release notes for PlayFab Multiplayer's C++ SDK
ms.author: scmunro
ms.date: 04/29/2022
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, release notes
ms.localizationpriority: medium
---

# PlayFab Multiplayer C++ SDK release notes

## 1.5.1

March 20, 2023

### New features

- PlayFab Multiplayer v1.5.1 brings support for Linux and Windows Subsystem for Linux (WSL).

## 1.5.0

March 16, 2023

### New Features

- Added new APIs and support for server-owned lobbies:
    - [PFMultiplayerCreateAndClaimServerLobby](..\playfabmultiplayerreference-cpp\pflobby\functions\pfmultiplayercreateandclaimserverlobby.md)
    - [PFMultiplayerClaimServerLobby](..\playfabmultiplayerreference-cpp\pflobby\functions\pfmultiplayerclaimserverlobby.md)
    - [PFLobbyServerPostUpdate](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbyserverpostupdate.md)
    - [PFLobbyServerDeleteLobby](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbyserverdeletelobby.md)
- Added new support for creating matchmaking server backfill tickets with [PFMultiplayerCreateServerBackfillTicket](..\playfabmultiplayerreference-cpp\pfmatchmaking\functions\pfmultiplayercreateserverbackfillticket.md).
- Added new [PFLobbyMembershipLockSearchKey](..\playfabmultiplayerreference-cpp\pflobby\constants\pflobbysearchkeys.md) constant to make it easier to search for only locked or unlocked lobbies when calling PFMultiplayerFindLobbies().

For more information on using server-owned lobbies, see [Game servers and lobbies](../lobby-server-overview.md).

### Bug fixes

- Mitigation to reduce unexpected PubSub disconnects due to background thread contention

## 1.4.3

November 15, 2022

### New features

- PlayFab Multiplayer v1.4.3 brings support for iOS and macOS.

## 1.4.2

October 26, 2022

### Bug fixes

- Fixed a bug where PubSub reconnects could cause future PubSub unsubscribe requests to fail.

## 1.4.1

October 25, 2022

### Bug fixes

- Fixed a bug where unnecessary, short-lived threads would spawn.
- On Windows, Xbox, and Android, fixed a bug where the library may attempt web requests before a previously recorded retry-after period had expired.
- Improve the error message if a web server can’t be reached.

## 1.4.0

October 11, 2022

### New features

- PlayFab Multiplayer v1.4.0 brings support for Android.

## 1.3.1

September 20, 2022

### Bug fixes

- Fixed a bug that caused websocket resources to leak memory when [PFMultiplayerUninitialize](..\playfabmultiplayerreference-cpp\pfmultiplayer\functions\pfmultiplayeruninitialize.md) was called or when the library internally handled app suspension on Xbox consoles.

## 1.3.0

September 9, 2022

### New features

- Implemented a new function, [PFLobbyGetMemberConnectionStatus](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetmemberconnectionstatus.md), which can be used to detect whether a user is connected to the PubSub notification service. When a user's connection status changes, you'll receive a [PFLobbyUpdatedStateChange](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbyupdatedstatechange.md) with a [PFLobbyMemberUpdateSummary](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbymemberupdatesummary.md) where the `connectionStatusUpdated` field is `true`.
- Updated the protocol used to exchange messages with the PubSub notification service from JSON to MessagePack, decreasing the message sizes. This has no impact on the API surface.

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](..\playfabmultiplayerreference-cpp\pfmultiplayer\functions\pfmultiplayergeterrormessage.md) for several errors related to rate limiting.

## 1.2.0

August 17, 2022

### New features

- The match details now report server details associated with the multiplayer server allocated when a match is found, if the matchmaking queue has been configured to allocate multiplayer servers. For more information, see [PFMatchmakingMatchDetails](..\playfabmultiplayerreference-cpp\pfmatchmaking\structs\pfmatchmakingmatchdetails.md).
- A new constant, `PFLobbyAmOwnerSearchKey`, is defined for the `lobby/amOwner` search key. For more information on using search keys, see [PFLobbySearchConfiguration](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbysearchconfiguration.md).

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](..\playfabmultiplayerreference-cpp\pfmultiplayer\functions\pfmultiplayergeterrormessage.md) for several error codes.
- Fixed a bug where entities weren't unsubscribed from the notification service under some failure conditions.

## 1.1.5

July 13, 2022

### Bug fixes

- Fixed incorrect constant string values for PFLobbyMemberCountSearchKey and PFLobbyAmMemberSearchKey in the PFLobby.h header
- Fixed bug which could cause `PFMultiplayerUninitialize()` to block indefinitely if a websocket had previously closed unexpectedly
- Fixed bug which caused PubSub notifications to become unusable and Lobby/Matchmaking API operations to stall out indefinitely after an unexpected websocket disconnect

## 1.1.4

June 24, 2022

### Bug fixes

- GDK: Fixed a bug where operations involving network communication would silently fail if performed too soon following suspend/resume.
- Fixed a bug where the SDK crashes when resuming execution after being broken into the debugger for 10+ seconds.

## 1.1.3

June 10, 2022

### New features

- The SDK is now more responsive to unexpected disconnections (detected 2-3x faster than previously).
- Unexpected Lobby disconnections will now result in automatic reconnect attempts - the disconnect is communicated to the client only after these reconnect attempts have failed.
- GDK/Win32: Web service failure responses (429s, 503s, etc.) will now result in automatic retries - a failure is communicated to the client only after these retries have failed.

### Bug fixes

- Fixed a bug where matchmaking failed after 10 consecutive matches.
- Fixed a bug where GetErrorMessage(...) functionality didn't provide error messages related to matchmaking.
- Fixed a bug where two fields in the LobbySearchResult struct weren't correctly populated (maxMemberCount and currentMemberCount).
- Fixed various bugs related to behavior/reliability following suspend/resume.

## 1.1.1

April 13, 2022

### Bug fixes

- Switch: Provides a new PAL header required to build against PlayFab Multiplayer.

## 1.1.0

March 4, 2022

### API changes

- PFMultiplayerGetErrorMessage's API signature has changed. Previously this function returned an `HRESULT` and used an output parameter to return the error message string. Now the function returns the string directly.

### New features

- GDK: Added support for automatically handling suspend and resume on Xbox.

### Bug fixes

- Fixed a bug where using initial member data passed to `PFMultiplayerJoinLobby` would be ignored if the player was rejoining a lobby.

## 1.0.0
November 23, 2021

PlayFab Multiplayer is now available in private preview. For an overview of Matchmaking and Lobby features, check out:

* [PlayFab Lobby Overview](../index.md)
* [PlayFab Multiplayer Lobby Quickstart](../lobby-getting-started.md)
* [PlayFab Matchmaking Overview](../../matchmaking/index.md)
* [PlayFab Multiplayer Matchmaking Quickstart](../../matchmaking/quickstart-client-sdk.md)
