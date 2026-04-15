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
## 1.9.0

March 26, 2026

### New features

- Added [PFLobbyGetRestrictInvitesToLobbyOwner](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetrestrictinvitestolobbyowner.md) to retrieve the lobby’s current policy that indicates whether only the lobby owner can send invites to join the lobby.
- Added the `restrictInvitesToLobbyOwner` field to [PFLobbyArrangedJoinConfiguration](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbyarrangedjoinconfiguration.md), [PFLobbyCreateConfiguration](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateconfiguration.md), and [PFLobbyDataUpdate](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbydataupdate.md) structs to control whether only the lobby owner or any member can send invites to join the lobby. If you're using default initializers for these structs, no code changes are necessary. If you're not using default initializers, be sure to initialize the new fields.

### Bug fixes

- Fixed an issue where the SDK didn't automatically generate a disconnected state change after a connection was lost and the SDK couldn't reestablish the connection.

## 1.8.8

March 23, 2026

### Bug fixes

- Fixed undefined reference to DeriveWorkQueue on Linux.
- Improved Linux linker hardening for PlayFab Multiplayer.

## 1.8.7

February 26, 2026

### Bug fixes

- Fixed an issue where the library might crash after losing a WebSocket connection while paused in a debugger.

## 1.8.6

February 13, 2026

### Bug fixes

- Fixed an issue where, 24 hours after the first lobby or matchmaking attempt, if the library isn't cleaned up, it might fail to create subsequent lobbies, join subsequent lobbies, subscribe to lobby invitations, or create subsequent matchmaking tickets.
- Fixed an issue where PlayFab Lobby service failures could cause the PlayFabMultiplayer library to be unable to create new lobbies until after it called [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) and the library was reinitialized with `PFMultiplayerInitialize`.
- Fixed an issue on non-GDK platforms where the library kept internal process task queue memory allocated after the library was cleaned up by using [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md).
- Fixed an issue where several PubSub service errors were collapsed into one generic HTTP 4XX error message, [0x89236409](../playfabmultiplayerreference-cpp/pfmultiplayererrors.md). Now, the library provides different error codes for different service errors which makes it easier to diagnose and troubleshoot.

## 1.8.5

January 21, 2026

### Bug fixes

- Hid symbols in iOS platform to prevent symbol clashing. This version is an iOS only release.

## 1.8.4

November 5, 2025

### Bug fixes

- Fixed an issue where exposed U symbols caused crashes at runtime on Android. All symbols except the ones provided by Microsoft are hidden. This is an Android-only release.

## 1.8.3

October 10, 2025

### Bug fixes

- Fixed an issue where exposed `libHttpClient` symbols caused symbol clashes on Android. Added an option that allows games that require a specific version of
  `libHttpClient` to supply their own dynamic `libHttpClient` and use the `.dynLHC` package to avoid symbol conflicts. The `.dynLHC` package replaces the `.hideLHC` package from
  version 1.8.2. This is an Android-only release.

## 1.8.2

September 5, 2025

### Bug fixes

- Fixed an issue where exposed `libHttpClient` symbols caused symbol clashes on Android. Added an option that allows games that require a specific version of
  `libHttpClient` to supply their own dynamic `libHttpClient` and use the `.hideLHC` package to avoid symbol conflicts. This is an Android-only release.

### New support

- Added support for 16-KB page sizes to satisfy the new [Android page size requirements](https://developer.android.com/guide/practices/page-sizes).

## 1.8.1

August 20, 2025

### Bug fixes

- Switch: Fixed a crash that occurred during thread initialization.

## 1.8.0

June 11, 2025

### New features

- Added new [PFMultiplayerConnectToLobby](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerconnecttolobby.md) function.
- Added a `lobbyId` field to the [PFLobbyInviteReceivedStateChange](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbyinvitereceivedstatechange.md) struct to support joining using just the lobby ID.

### Bug fixes
- Fixed bug where PubSub connection failures could cause library to crash.

## 1.7.16

May 7, 2025

### Bug fixes

- Fixed an issue where exposed symbols caused symbol clashes on the Android platform. This version supports only Android.

## 1.7.15

May 2, 2025

### Bug fixes

- Fixed an issue where the Info.plist file for iOS and macOS was missing required fields, ensuring compliance with Apple's requirements.

## 1.7.14

April 28, 2025

### Bug fixes

- Fixed an issue where the second local user failed to join the lobby created by the first user after a network reconnection.

### Threading changes
- The SDK replaces its custom networking threads with a thread pool implementation, which enables more efficient CPU utilization.

## 1.7.13

April 22, 2025

### Bug fixes

- Fixed an issue on Sony (PlayStation&#174;4 and PlayStation&#174;5) SDK versions where the second local user failed to join the lobby created by the first user after a network reconnection.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.12

April 15, 2025

### Bug fixes
- Fixed a crash that occurred when a network reconnection happened after an unexpected disconnection, following the creation and joining of a multi-user lobby.
- Fixed an issue where calling [PFLobbyPostUpdate](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbypostupdate.md) on a non-existent lobby didn't automatically generate a disconnected state change.
- Fixed a crash and exposure of `libc++_shared.so` when loading library on Android.
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

- Fixed an issue where the library could crash if the app suspended at the same time that a local user was disconnecting. This fix is for a GDK-only release.

## 1.7.9

February 11, 2025

### Bug fixes

- Fixed an issue where the library incorrectly retried some operations associated with the real-time message service when it received HTTP 401.
- Fixed a regression introduced in version 1.7.8 that assigned the `PFMultiplayerServerDetails::region` value to `PFMultiplayerServerDetails::fqdn`.
- Fixed an issue where the properties associated with a new member weren't immediately available until a subsequent `Updated` state change. Now, as soon as a `MemberAdded` state change is provided to the game, [PFLobbyGetMemberConnectionStatus()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberconnectionstatus.md), [PFLobbyGetMemberPropertyKeys()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberpropertykeys.md), and [PFLobbyGetMemberProperty()](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberproperty.md) provide the most up-to-date information associated with the member. To preserve compatibility for games that took a dependency on the previous behavior, the first `Updated` state change after the member is added continues to provide this initial list of property keys as if they were new properties.
- Fixed a couple of issues where the library could crash when [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) was called while cleaning up internal web request resources.
- Fixed an issue for GDK Xbox where the library could crash during suspend while cleaning up internal state associated with the invite listener.
- Fixed an issue for Android where the library could crash when when [PFMultiplayerUninitialize()](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) was called while cleaning up JavaVM attached threads.
- Fixed an issue for macOS where the library was incorrectly symlinked, which could surface as build breaks when integrating the library.

## 1.7.8

November 5, 2024

### Bug fixes

- Fixed an issue where calling [PFMatchmakingTicketCancel](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketcancel.md) for a backfill ticket created with [PFMultiplayerCreateServerBackfillTicket](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md) failed.
- Fixed an issue where the SDK treated all values in [PFMultiplayerServerDetails](../playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmultiplayerserverdetails.md) as mandatory.
- Fixed an issue where the Sony (PlayStation®4 and PlayStation®5) versions of the SDK didn't correctly handle intermittent HTTP request failures from the Sony (PlayStation®4 and PlayStation®5) HTTP library. Additionally, improved error reporting now provides more detailed information for these cases.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.7

October 25, 2024

### Bug fixes
- Fixed an issue with exposed OpenSSL symbols on the macOS platform. This release supports only macOS.

## 1.7.6

August 12, 2024

### Bug fixes

- Fixed an issue for GDK Xbox where some events weren't queued after suspending and resuming a title.
- Fixed a crash for GDK Xbox after suspending and resuming a title.
- Updated [PFMultiplayerCreateServerBackfillTicket](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md) to automatically handle failures when a match member is already a member of too many tickets. In this situation, the SDK automatically cancels existing tickets for members of the backfill ticket and retries ticket creation.

## 1.7.5

July 17, 2024

### Bug fixes

- Fixed potential issue with PFMultiplayerUninitialize causing a crash when used with custom memory hooks on Unix System.

## 1.7.4

June 17, 2024

### Bug fixes

- Fixed an issue where the SDK didn't correctly parse messages received by WebSockets on PlayStation®4 and PlayStation®5 if the messages contained the `'\0'` character. Failure to parse these messages could lead to PubSub connectivity problems. This fix applies only to PlayStation®4 and PlayStation®5.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.3

April 23, 2024

### Bug fixes

- Resolved duplicate class error when Party and Multiplayer are used in the same app. This fix applies only to Android.

## 1.7.2

March 7, 2024

### Bug fixes

- Fixed an issue where the internal PubSub notification WebSocket was slow to detect and react to disconnections. This problem could lead to errors when creating or joining lobbies and matchmaking tickets.
- Fixed an issue where failure of PubSub to establish connection with the SignalR service didn't trigger a failed state change and didn't allow subsequent Multiplayer API calls to subscribe to PubSub.
- Improved internal diagnostics.

## 1.7.1

February 14, 2024

### New features

- Added new APIs that enable PlayFab GameServer entities to join and interact with client-owned lobbies:
  - [PFMultiplayerJoinLobbyAsServer](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerjoinlobbyasserver.md)
  - [PFLobbyServerPostUpdateAsServer](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverpostupdateasserver.md)
  - [PFLobbyServerLeaveAsServer](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverleaveasserver.md)
  - [PFLobbyGetServer](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetserver.md)
  - [PFLobbyGetServerPropertyKeys](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetserverpropertykeys.md)
  - [PFLobbyGetServerProperty](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetserverproperty.md)
  - [PFLobbyGetServerConnectionStatus](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetserverconnectionstatus.md)

## 1.6.5

November 15, 2023

### New features

- Added new [PFMatchmakingTicketGetCustomContext](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketgetcustomcontext.md) and
[PFMatchmakingTicketSetCustomContext](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmatchmakingticketsetcustomcontext.md)
APIs to associate a custom context with a matchmaking ticket.

### Bug fixes

- Improved internal diagnostics.

## 1.6.4

August 16, 2023

### Bug fixes

- Fixed a bug where the GDK DLL wasn't being code-signed. This fix is for a GDK-only release.

## 1.6.3

August 14, 2023

### Bug fixes

- Fixed an issue where the library might crash while handling a change notification.
- Added new [PFLobbyMemberCountRemainingSearchKey](../playfabmultiplayerreference-cpp/pflobby/constants/pflobbysearchkeys.md) constant to make it easier to search for and sort lobbies based on their remaining member counts.

## 1.6.2

July 14, 2023

### Bug fixes

- Fixed an issue where matchmaking operations started by `PFMultiplayerJoinMatchmakingTicketFromId` timed out prematurely.
- Fixed an issue where `PFMatchmakingTicketGetTicketId` could return a null value if called shortly after starting a matchmaking operation. Now, it returns an empty string as expected.
- Fixed an issue where the macOS library identified as iOS through web request headers. This identification is primarily used for diagnostics.
- Improved internal diagnostics.

## 1.6.1

June 14, 2023

- On PlayStation&#174;4 and PlayStation&#174;5, PlayFab Multiplayer cleans up all resources associated with it and reinitializes if the title enters and remains in background mode for more than 10 minutes.

'PlayStation' is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.6.0

June 14, 2023

### New features

- Added a `membershipLock` field to the [PFLobbySearchResult](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbysearchresult.md) struct so you can read the lock state of the lobbies provided in search results from [PFMultiplayerFindLobbies()](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerfindlobbies.md).

## 1.5.3

April 25, 2023

### Bug fixes

- Fixed a linker error specific to iOS and macOS where HttpClient.framework wasn't found during runtime.

## 1.5.2

April 4, 2023

### Bug fixes

- Introduced the `PFMultiplayerPal.h` header, which provides support for non-MSVC compilers. This header defines SAL and HRESULTs for non-MSVC compiled platforms.

## 1.5.1

March 20, 2023

### New features

- PlayFab Multiplayer v1.5.1 brings support for Linux and Windows Subsystem for Linux (WSL).

## 1.5.0

March 16, 2023

### New features

- Added new APIs and support for server-owned lobbies:
    - [PFMultiplayerCreateAndClaimServerLobby](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandclaimserverlobby.md)
    - [PFMultiplayerClaimServerLobby](../playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerclaimserverlobby.md)
    - [PFLobbyServerPostUpdate](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverpostupdate.md)
    - [PFLobbyServerDeleteLobby](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverdeletelobby.md)
- Added new support for creating matchmaking server backfill tickets with [PFMultiplayerCreateServerBackfillTicket](../playfabmultiplayerreference-cpp/pfmatchmaking/functions/pfmultiplayercreateserverbackfillticket.md).
- Added new [PFLobbyMembershipLockSearchKey](../playfabmultiplayerreference-cpp/pflobby/constants/pflobbysearchkeys.md) constant to make it easier to search for only locked or unlocked lobbies when calling `PFMultiplayerFindLobbies()`.

For more information on using server-owned lobbies, see [Game servers and lobbies](../lobby-server-overview.md).

### Bug fixes

- Added a fix that reduces unexpected PubSub disconnections due to background thread contention.

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

- Fixed a bug where the library spawned unnecessary, short-lived threads.
- On Windows, Xbox, and Android, fixed a bug where the library might attempt web requests before a previously recorded retry-after period expires.
- Improved the error message if a web server can't be reached.

## 1.4.0

October 11, 2022

### New features

- PlayFab Multiplayer version 1.4.0 adds support for Android.

## 1.3.1

September 20, 2022

### Bug fixes

- Fixed a bug that caused WebSocket resources to leak memory when calling [PFMultiplayerUninitialize](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayeruninitialize.md) or when the library internally handled app suspension on Xbox consoles.

## 1.3.0

September 9, 2022

### New features

- Added a new function, [PFLobbyGetMemberConnectionStatus](../playfabmultiplayerreference-cpp/pflobby/functions/pflobbygetmemberconnectionstatus.md), which you can use to detect whether a user is connected to the PubSub notification service. When a user's connection status changes, you receive a [PFLobbyUpdatedStateChange](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbyupdatedstatechange.md) with a [PFLobbyMemberUpdateSummary](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbymemberupdatesummary.md) where the `connectionStatusUpdated` field is `true`.
- Updated the protocol used to exchange messages with the PubSub notification service from JSON to MessagePack, which decreases the message sizes. This change has no effect on the API surface.

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayergeterrormessage.md) for several errors related to rate limiting.

## 1.2.0

August 17, 2022

### New features

- The match details now report server details associated with the multiplayer server allocated when a match is found, if the matchmaking queue is configured to allocate multiplayer servers. For more information, see [PFMatchmakingMatchDetails](../playfabmultiplayerreference-cpp/pfmatchmaking/structs/pfmatchmakingmatchdetails.md).
- A new constant, `PFLobbyAmOwnerSearchKey`, is defined for the `lobby/amOwner` search key. For more information on using search keys, see [PFLobbySearchConfiguration](../playfabmultiplayerreference-cpp/pflobby/structs/pflobbysearchconfiguration.md).

### Bug fixes

- Improved the message reported by [PFMultiplayerGetErrorCode](../playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayergeterrormessage.md) for several error codes.
- Fixed a bug where the notification service didn't unsubscribe entities under some failure conditions.

## 1.1.5

July 13, 2022

### Bug fixes

- Fixed incorrect constant string values for `PFLobbyMemberCountSearchKey` and `PFLobbyAmMemberSearchKey` in the PFLobby.h header.
- Fixed a bug that could cause `PFMultiplayerUninitialize()` to block indefinitely if a WebSocket closes unexpectedly.
- Fixed a bug that caused PubSub notifications to become unusable and Lobby/Matchmaking API operations to stall out indefinitely after an unexpected WebSocket disconnect.

## 1.1.4

June 24, 2022

### Bug fixes

- GDK: Fixed a bug where operations involving network communication silently failed if the operations started too soon after suspend or resume.
- Fixed a bug where the SDK crashes when resuming execution after being broken into the debugger for more than 10 seconds.

## 1.1.3

June 10, 2022

### New features

- The SDK is now more responsive to unexpected disconnections (detects them 2-3 times faster than previously).
- Unexpected Lobby disconnections now result in automatic reconnect attempts. The client learns about the disconnect only after these reconnect attempts fail.
- GDK/Win32: Web service failure responses (429, 503, and similar responses) now trigger automatic retries. The client learns about the failure only after these retries fail.

### Bug fixes

- Fixed a bug where matchmaking failed after 10 consecutive matches.
- Fixed a bug where `GetErrorMessage(...)` didn't provide error messages related to matchmaking.
- Fixed a bug where two fields in the `LobbySearchResult` struct weren't correctly populated (`maxMemberCount` and `currentMemberCount`).
- Fixed various bugs related to behavior and reliability following suspend and resume.

## 1.1.1

April 13, 2022

### Bug fixes

- Switch: Provides a new PAL header required to build against PlayFab Multiplayer.

## 1.1.0

March 4, 2022

### API changes

- Changed `PFMultiplayerGetErrorMessage`'s API signature. Previously, this function returned an `HRESULT` and used an output parameter to return the error message string. Now, the function returns the string directly.

### New features

- GDK: Added support for automatically handling suspend and resume on Xbox.

### Bug fixes

- Fixed a bug where the API ignored initial member data passed to `PFMultiplayerJoinLobby` if the player was rejoining a lobby.

## 1.0.0
November 23, 2021

PlayFab Multiplayer is now available in preview. For an overview of Matchmaking and Lobby features, check out:

* [PlayFab Lobby Overview](../index.md)
* [PlayFab Multiplayer Lobby Quickstart](../lobby-getting-started.md)
* [PlayFab Matchmaking Overview](../../matchmaking/index.md)
* [PlayFab Multiplayer Matchmaking Quickstart](../../matchmaking/quickstart-client-sdk.md)
