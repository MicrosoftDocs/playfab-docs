---
title: PlayFab Multiplayer C++ SDK Release Notes
author: ScottMunroMS
description: Release notes for PlayFab Multiplayer's C++ SDK
ms.author: scmunro
ms.date: 04/29/2022
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, release notes
ms.localizationpriority: medium
---

# PlayFab Multiplayer C++ SDK release notes

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
