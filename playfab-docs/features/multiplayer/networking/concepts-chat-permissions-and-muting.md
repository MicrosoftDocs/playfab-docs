---
title: PlayFab Party Chat Permissions and Muting
description: How to configure PlayFab Party real-time chat communication permissions and muting.
author: ScottMunroMS
ms.author: scmunro
ms.date: 07/11/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, chat, mute, permissions
---

# PlayFab Party chat permissions and muting

## Overview

PlayFab Party gives you fine-grained control over how your players can communicate with each other's. Rather than
specifying teams or channels, PlayFab Party requires that explicit permissions between each pair of chat controls be
defined. The chat permissions system allows you to control incoming and outgoing voice communication as well as incoming text communication between any pair of chat controls.

## Chat permissions

Communication between chat controls is disabled by default and it is up to the Game to set the right
`PartyChatPermissionOptions` between each pair of chat controls. Chat permissions should reflect the relationship between
each chat control as determined by the scenario you are trying to achieve. For example, in a team versus team scenario,
you might want to set the chat permissions to allow all types of communication between members of the same team, block
audio communication between members of opposing team, and allow receiving text between everyone in the session.

The following example shows how to enable all communication between a local and a remote chat control. The variable
`localChatControlA` is pointing to a valid `PartyLocalChatControl` object while `remoteChatControlB` is pointing to a
valid `PartyChatControl` object representing a chat control on a remote device.

```cpp
PartyChatPermissionOptions allOptions = PartyChatPermissionOptions::SendAudio | PartyChatPermissionOptions::ReceiveAudio | PartyChatPermissionOptions::ReceiveText;
localChatControlA->SetPermissions(remoteChatControlB, allOptions);
```

> [!NOTE]
> Please note that chat permissions only apply locally. In the previous example, full bi-directional communication
> will only happen if `remoteChatControlB` is remotely configured to allow all communication with
> `localChatControlA`

## Muting

Games also have the ability to mute outgoing audio (`PartyLocalChatControl::SetAudioInputMuted()`) as well as
incoming audio from remote chat control (`PartyLocalChatControl::SetIncomingAudioInputMuted()`). The states of
these mutes can be accessed through their respective getters and are also reflected through the chat indicators returned
by `PartyLocalChatControl::GetChatIndicator()` and `PartyLocalChatControl::GetLocalChatIndicator()`.

Mutes are particularly useful to give some form of temporary control to the player without having to change any of the
chat permissions you might have set at the beginning of the gaming session.

## How to configure popular scenarios

### Push-to-talk

Push-to-talk should be implemented using local muting. Call `PartyLocalChatControl::SetAudioInputMuted(false)` to allow
speech and `PartyLocalChatControl::SetAudioInputMuted(true)` to restrict it.

### Teams

Suppose that we have 4 users, A, B, C, and D, each on their own separate device. User A and User B are on team Blue, and
User C and User D are on team Red.

On User A's device:

```cpp
// Enable all communication with teammate B
localChatControlA->SetPermissions(chatControlB, PartyChatPermissionOptions::SendAudio | PartyChatPermissionOptions::ReceiveAudio | PartyChatPermissionOptions::ReceiveText);

// Disable all communication with opponents
localChatControlA->SetPermissions(chatControlC, PartyChatPermissionOptions::None);
localChatControlA->SetPermissions(chatControlD, PartyChatPermissionOptions::None);
```

### Broadcast

Suppose that User A is the leader giving orders and User B, C, and D can only listen.

On User A's device:

```cpp
localChatControlA->SetPermissions(chatControlB, PartyChatPermissionOptions::SendAudio);
localChatControlA->SetPermissions(chatControlC, PartyChatPermissionOptions::SendAudio);
localChatControlA->SetPermissions(chatControlD, PartyChatPermissionOptions::SendAudio);
```

On User B's device:

```cpp
localChatControlB->SetPermissions(chatControlA, PartyChatPermissionOptions::ReceiveAudio | PartyChatPermissionOptions::ReceiveText);
localChatControlB->SetPermissions(chatControlC, PartyChatPermissionOptions::None);
localChatControlB->SetPermissions(chatControlD, PartyChatPermissionOptions::None);
```

On User C's device:

```cpp
localChatControlC->SetPermissions(chatControlA, PartyChatPermissionOptions::ReceiveAudio | PartyChatPermissionOptions::ReceiveText);
localChatControlC->SetPermissions(chatControlB, PartyChatPermissionOptions::None);
localChatControlC->SetPermissions(chatControlD, PartyChatPermissionOptions::None);
```

On User D's device:

```cpp
localChatControlD->SetPermissions(chatControlA, PartyChatPermissionOptions::ReceiveAudio | PartyChatPermissionOptions::ReceiveText);
localChatControlD->SetPermissions(chatControlB, PartyChatPermissionOptions::None);
localChatControlD->SetPermissions(chatControlC, PartyChatPermissionOptions::None);
```
