---
title: PlayFab Multiplayer C++ SDK Release Notes
author: ScottMunroMS
description: Release notes for PlayFab Multiplayer's C++ SDK
ms.author: scmunro
ms.date: 04/29/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, release notes
ms.localizationpriority: medium
---

# PlayFab Multiplayer C++ SDK release notes

## 1.7.14

April 28, 2025

### Bug fixes

- Fixed an issue where the second local user failed to join the lobby created by the first user after a network reconnection.

### Threading Changes
- The SDK is replacing its custom networking threads with a thread pool implementation, which will enable more efficient CPU utilization.

## 1.7.13

April 22, 2025

### Bug fixes

- Fixed an issue on Sony (PlayStation&#174;4 and PlayStation&#174;5) SDK versions where the second local user failed to join the lobby created by the first user after a network reconnection.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.12

April 15, 2025

### Bug fixes
- Fixed a crash that occurred when a network reconnection happened after an unexpected disconnection, following the creation and joining of a multi-user lobby.
- Fixed an issue where calling [PFLobbyPostUpdate](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbypostupdate.md). on a non-existent lobby did not automatically generate a disconnected state change.
- Fixed a crash and exposing `libc++_shared.so` when loading library on Android
- Included `libHttpClient` in the release package on Android. For usage details, see [PlayFab Multiplayer Android getting started](android-specific-requirements.md).
- Fixed an issue with symbol exposure on the Apple platform.

## 1.7.11

April 9, 2025

### Bug fixes

- Fixed a crash on Sony (PlayStation&#174;4 and PlayStation&#174;5) SDK versions that occurred when a network reconnection happened after an unexpected disconnection, following the creation and joining of a multi-user lobby.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.10

March 6, 2025

### Bug fixes

- Fixed an issue where the library could crash if the app suspended at the same time that a local user was being disconnected. This is a GDK-only release.

## 1.7.9

February 11, 2025

### Bug fixes

- Fixed an issue where the library would incorrectly retry some operations associated with the real-time notification service when HTTP 401 was received.
- Fixed a regression introduced in v1.7.8 that assigned the `PFMultiplayerServerDetails::region` value to `PFMultiplayerServerDetails::fqdn`.
- Fixed an issue where the properties associated with a new member weren't immediately available until a subsequent `Updated` state change was provided. Now, as soon as a `MemberAdded` state change is provided to the game, [PFLobbyGetMemberConnectionStatus()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberconnectionstatus.md), [PFLobbyGetMemberPropertyKeys()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberpropertykeys.md), and [PFLobbyGetMemberProperty()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberproperty.md) provide the most up-to-date information associated with the member. In order to preserve compatibility for games that took a dependency on the previous behavior, the first `Updated` state change after the member is added will continue to provide this initial list of property keys as if they were new properties.
- Fixed a couple of issues where the library could crash when [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) was called while cleaning up internal web request resources.
- Fixed an issue for GDK Xbox where the library could crash during suspend while cleaning up internal state associated with the invite listener.
- Fixed an issue for Android where the library could crash when when [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) was called while cleaning up JavaVM attached threads.
- Fixed an issue for macOS where the library was incorrectly symlinked, which could surface as build breaks when integrating the library.

## 1.7.8

November 5, 2024

### Bug fixes

- Fixed an issue where calling [PFMatchmakingTicketCancel](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketcancel.md) for a backfill ticket created with [PFMultiplayerCreateServerBackfillTicket](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md) would fail.
- Fixed an issue where the SDK treated all values in [PFMultiplayerServerDetails](../playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmultiplayerserverdetails.md) as mandatory.
- Fixed an issue where the Sony (PlayStation&#174;4 and PlayStation&#174;5) versions of the SDK didn't correctly handle intermittent HTTP request failures from the Sony (PlayStation&#174;4 and PlayStation&#174;5) HTTP library. Additionally, improved error reporting to provide more detailed information in such cases.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.7

October 25, 2024

### Bug fixes
- Fixed an issue with exposed OpenSSL symbols on the macOS platform. This is a macOS-only release.

## 1.7.6

August 12, 2024

### Bug fixes

- Fixed an issue for GDK Xbox where some events wouldn't be queued after suspending and resuming a title.
- Fixed a crash for GDK Xbox after suspending and resuming a title.
- Updated [PFMultiplayerCreateServerBackfillTicket](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md) to automatically handle failures where a match member is already a member of too many tickets. In this situation, the SDK automatically cancels existing tickets for members of the backfill ticket and retry ticket creation.

## 1.7.5

July 17, 2024

### Bug fixes

- Fixed potential issue with PFMultiplayerUninitialize causing a crash when being used with custom memory hooks on Unix System.

## 1.7.4

June 17, 2024

### Bug fixes

- Fixed an issue where messages received by WebSockets on PlayStation&#174;4 and, PlayStation&#174;5 wouldn't be parsed correctly by the SDK if they contained the `'\0'` character. Failure to parse these messages could lead to PubSub connectivity issues. This is a PlayStation&#174;4 and PlayStation&#174;5 only release.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.3

April 23, 2024

### Bug fixes

- Resolved duplicate class error when Party and Multiplayer are used in the same app. This is an Android only release.

## 1.7.2

March 7, 2024

### Bug fixes

- Fixed an issue where the internal PubSub notification WebSocket was slow to detect and react to disconnections, which could lead to errors to create or join lobbies and matchmaking tickets.
- Fixed an issue where failure of PubSub to establish connection with the SignalR service wouldn't trigger a failed state change and wouldn't allow subsequent Multiplayer API calls to subscribe to PubSub.
- Improved internal diagnostics.

## 1.7.1

February 14, 2024

### New Features

- Added new APIs to enable PlayFab GameServer entities to join and interact with client-owned lobbies:
  - [PFMultiplayerJoinLobbyAsServer](..\playfabmultiplayerreference-cpp\pflobby\functions\pfmultiplayerjoinlobbyasserver.md)
  - [PFLobbyServerPostUpdateAsServer](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbyserverpostupdateasserver.md)
  - [PFLobbyServerLeaveAsServer](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbyserverleaveasserver.md)
  - [PFLobbyGetServer](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetserver.md)
  - [PFLobbyGetServerPropertyKeys](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetserverpropertykeys.md)
  - [PFLobbyGetServerProperty](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetserverproperty.md)
  - [PFLobbyGetServerConnectionStatus](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetserverconnectionstatus.md)

## 1.6.5

November 15, 2023

### New Features

- Added new [PFMatchmakingTicketGetCustomContext](..\playfabmultiplayerreference-cpp\pfmatchmaking\functions\pfmatchmakingticketgetcustomcontext.md) and
[PFMatchmakingTicketSetCustomContext](..\playfabmultiplayerreference-cpp\pfmatchmaking\functions\pfmatchmakingticketsetcustomcontext.md)
APIs to associate a custom context with a matchmaking ticket.

### Bug fixes

- Improved internal diagnostics.

## 1.6.4

August 16, 2023

### Bug fixes

- Fixes a bug where the GDK DLL wasn't being codesigned. This is a GDK-only release.

## 1.6.3

August 14, 2023

### Bug fixes

- Fixed an issue where the library might crash while handling a change notification.
- Added new [PFLobbyMemberCountRemainingSearchKey](..\playfabmultiplayerreference-cpp\pflobby\constants\pflobbysearchkeys.md) constant to make it easier to search for and sort lobbies based on their remaining member counts.

## 1.6.2

July 14, 2023

### Bug fixes

- Fixed an issue where matchmaking operations started by PFMultiplayerJoinMatchmakingTicketFromId timed out prematurely.
- Fixed an issue where PFMatchmakingTicketGetTicketId could provide a null value if called shortly after starting a matchmaking operation. Now, an empty string is provided as expected.
- Fixed an issue where the macOS library was identifying as iOS via web request headers. This identification is primarily used for diagnostics.
- Improved internal diagnostics.

## 1.6.1

June 14, 2023

- On PlayStation&#174;4 and, PlayStation&#174;5, PlayFab Multiplayer cleans up all resources associated with it and reinitialize if the title enters and remains in background mode for more than 10 minutes.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.6.0

June 14, 2023

### New Features

- Added a `membershipLock` field to the [PFLobbySearchResult](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbysearchresult.md) struct to enable reading the lock state of the lobbies provided in search results from [PFMultiplayerFindLobbies()](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerfindlobbies.md).

## 1.5.3

April 25, 2023

### Bug fixes

- Fix a linker error specific to iOS and macOS where HttpClient.framework wouldn't be found during runtime.

## 1.5.2

April 4, 2023

### Bug fixes

- Introduce the PFMultiplayerPal.h header, which provides support for non-MSVC compilers. This header defines SAL and HRESULTs for non-MSVC compiled platforms.

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

- Mitigation to reduce unexpected PubSub disconnections due to background thread contention

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
- On Windows, Xbox, and Android, fixed a bug where the library might attempt web requests before a previously recorded retry-after period expires.
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

- Implemented a new function, [PFLobbyGetMemberConnectionStatus](..\playfabmultiplayerreference-cpp\pflobby\functions\pflobbygetmemberconnectionstatus.md), which can be used to detect whether a user is connected to the PubSub notification service. When a user's connection status changes, you receive a [PFLobbyUpdatedStateChange](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbyupdatedstatechange.md) with a [PFLobbyMemberUpdateSummary](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbymemberupdatesummary.md) where the `connectionStatusUpdated` field is `true`.
- Updated the protocol used to exchange messages with the PubSub notification service from JSON to MessagePack, decreasing the message sizes. This change has no effect on the API surface.

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](..\playfabmultiplayerreference-cpp\pfmultiplayer\functions\pfmultiplayergeterrormessage.md) for several errors related to rate limiting.

## 1.2.0

August 17, 2022

### New features

- The match details now report server details associated with the multiplayer server allocated when a match is found, if the matchmaking queue is configured to allocate multiplayer servers. For more information, see [PFMatchmakingMatchDetails](..\playfabmultiplayerreference-cpp\pfmatchmaking\structs\pfmatchmakingmatchdetails.md).
- A new constant, `PFLobbyAmOwnerSearchKey`, is defined for the `lobby/amOwner` search key. For more information on using search keys, see [PFLobbySearchConfiguration](..\playfabmultiplayerreference-cpp\pflobby\structs\pflobbysearchconfiguration.md).

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](..\playfabmultiplayerreference-cpp\pfmultiplayer\functions\pfmultiplayergeterrormessage.md) for several error codes.
- Fixed a bug where entities weren't unsubscribed from the notification service under some failure conditions.

## 1.1.5

July 13, 2022

### Bug fixes

- Fixed incorrect constant string values for PFLobbyMemberCountSearchKey and PFLobbyAmMemberSearchKey in the PFLobby.h header
- Fixed a bug, which could cause `PFMultiplayerUninitialize()` to block indefinitely if a websocket closes unexpectedly
- Fixed a bug, which caused PubSub notifications to become unusable and Lobby/Matchmaking API operations to stall out indefinitely after an unexpected websocket disconnect

## 1.1.4

June 24, 2022

### Bug fixes

- GDK: Fixed a bug where operations involving network communication would silently fail if performed too soon following suspend/resume.
- Fixed a bug where the SDK crashes when resuming execution after being broken into the debugger for 10+ seconds.

## 1.1.3

June 10, 2022

### New features

- The SDK is now more responsive to unexpected disconnections (detected 2-3x faster than previously).
- Unexpected Lobby disconnections will now result in automatic reconnect attempts - the disconnect is communicated to the client only after these reconnect attempts fail.
- GDK/Win32: Web service failure responses (429, 503, etc.) will now result in automatic retries - a failure is communicated to the client only after these retries fail.

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

- PFMultiplayerGetErrorMessage's API signature changed. Previously this function returned an `HRESULT` and used an output parameter to return the error message string. Now the function returns the string directly.

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
