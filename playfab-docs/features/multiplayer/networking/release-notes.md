---
title: PlayFab Party Release Notes
author: v-kciril
description: Release notes for PlayFab Party
ms.author: v-kciril
ms.date: 08/15/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, party, release notes, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party release notes

PlayFab Party is available on [Nuget.org](https://www.nuget.org/profiles/PlayFab)!

## 0.6.0-prerelease

Added support for iOS, Android, and Nintendo Switch platforms. 

For more information, see the following links:

[iOS/Android](https://github.com/PlayFab/PlayFabParty/releases)

[Nintendo Switch](https://github.com/PlayFab/PlayFabPartySwitch/releases)


## 0.5.0-prerelease

*Released July 18, 2019*

### API Changes

#### Accessible Chat
* Added support for text-to-speech narration. (see `PartyLocalChatControl::SetTextToSpeechProfile()`)
* Added more options for controlling when speech-to-text occurs. (see `PartyLocalChatControl::SetTranscriptionOptions()`)
* Added text-to-text translation to the API, although it is not yet supported. ( see `PartyLocalChatControl::SetTextChatOptions()`)
* Reduced text-to-speech bandwidth and memory usage.

#### Network access control
* `PartyNetwork::SetAccessControlList()` and related methods have been removed from the API. Use the new `PartyInvitation` class and related methods to create open invitations or grant access to specific PlayFab users to your Party networks.


## 0.4.6-prerelease

### API Changes

Added new public API `PartyLocalUser::UpdateEntityToken()`.


## 0.2.0-pre-release

*Released April 08, 2019*

### API Changes

* `PartyManager::Initialize` now requires a valid PlayFab Title ID to be passed in.
