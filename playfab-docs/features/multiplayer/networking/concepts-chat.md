---
title: Understanding How PlayFab Party chat works
description: Information on how PlayFab Party real-time chat communication behaves and can be used.
author: AlexAtXbox
ms.author: alstonge
ms.date: 7/22/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
---

# Understanding how PlayFab Party chat works

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android are available now. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

With PlayFab Party you can easily add voice and text communication to your game.

PlayFab Party chat is:

* **Flexible**: Gives you full control of how you want your player to communicate.
* **Powerful**: Uses hardware codec acceleration on supported platforms.
* **Accessible**: Powered by Azure Cognitive Services, speech-to-text, text-to-speech and translation features are built-in and easy to enable.
* **Efficient**: Having your chat system tightly integrated with your networking layer means voice data get sent where it needs to go in the most efficient way possible.

## Chat basics

To add voice and text communication to your game you will first need to create a `PartyLocalChatControl` object. This
`PartyLocalChatControl` object will act as the management object for chat operations related to a specific local user,
allowing you to choose the input and output device, mute state, and accessibility preferences. Each local user can
have no more than one chat control. For a local chat control to communicate with another chat control, the following
requirements must be met:

1. The two chat controls must be in the same network.
2. The [chat permissions](concepts-chat-permissions-and-muting.md) between the two chat controls must allow
audio and/or text communication to flow.

With your local chat control in-hand you are now ready to have it connect to a network by calling `PartyNetwork::ConnectChatControl()`.
Upon connection, other devices in the network will be notified that your chat control has joined the network with a
`PartyChatControlJoinedNetworkStateChange` state change. You will also receive a `PartyChatControlJoinedNetworkStateChange`
for every other chat control already in the network and will immediately be able to communicate with them.

## Audio Inputs and Outputs

PlayFab Party allows you to choose which audio device(s) will get used by your chat control with the `PartyLocalChatControl::SetAudioInput()`
and `PartyLocalChatControl::SetAudioOutput()` methods. Use the `PartyAudioDeviceSelectionType` enum to change the behavior
of these methods:

### `PartyAudioDeviceSelectionType::None`

When this audio device selection type is chosen, the chat control won't use any audio device. This is the default.

### `PartyAudioDeviceSelectionType::SystemDefault`

When this audio device selection type is chosen, the chat control will attempt to use the system's default communication device.
On Windows, the player can change this device at any time through the Windows Sound Control Panel and Party will respond to those changes
automatically. This selection type is not supported on Xbox One and generally not recommended if you have more than one
local user participating in chat simultaneously.

### `PartyAudioDeviceSelectionType::PlatformUserDefault`

When this audio device selection type is chosen, `PartyLocalChatControl::SetAudioInput()` and `PartyLocalChatControl::SetAudioOutput()`
require that the `audioDeviceSelectionContext` parameter be set to a platform user ID. Party then attempts to
use the platform default communication device associated with that user. On Xbox One, the `audioDeviceSelectionContext`
should be the Xbox User ID associated with the user currently tied to the chat control.

### `PartyAudioDeviceSelectionType::Manual`

When this audio device selection type is chosen, `PartyLocalChatControl::SetAudioInput()` and `PartyLocalChatControl::SetAudioOutpu()t`
will use the `audioDeviceSelectionContext` parameter as a valid audio device identifier and will attempt to use any device
matching that identifier. Refer to the following table to see what kind of identifier is supported by PlayFab Party:

| **Platform** | **What to Use** |
|:-------------|:----------------|
| Windows 7    | [`IMMDevice`](https://docs.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid)
| Windows 10   | [`IMMDevice`](https://docs.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid) or [`Windows.Media.Devices`](https://docs.microsoft.com/uwp/api/windows.media.devices.mediadevice)
| Xbox One     | Please refer to the Xbox One XDK documentation

> [!NOTE]
> We strongly recommend using `PartyAudioDeviceSelectionType::PlatformUserDefault` on Xbox One and `PartyAudioDeviceSelectionType::SystemDefault` on Windows platforms.

## Chat permissions and muting

PlayFab Party gives you fine-grained control over how your players can communicate with each other. Rather than
specifying teams or channels, PlayFab Party requires explicitly defining the permissions between each pair of chat controls.
To learn more about chat permissions, muting and how to build common chat scenario, please refer to the
[chat permission overview](concepts-chat-permissions-and-muting.md) page.

## Text chat and translation

PlayFab Party also allows you to send and receive text chat from other chat controls. While the `PartyLocalChatControl::SendText()`
method will allow you to send text messages to an arbitrary number of chat controls, you can rest assured that only the
chat controls with the appropriate `PartyChatPermissionOptions::ReceiveText` chat permission receive the messages.

Text chat translation can also be enabled by calling `PartyLocalChatControl::SetTextChatOptions()`. By setting the
`PartyTextChatOptions::TranslateToLocalLanguage` option PlayFab Party will translate incoming text message to the local
chat control's language. The chat control's language can optionally be configured during chat control creation and can be
accessed by calling `PartyLocalChatControl::GetLanguage()`. Translation will also be applied to incoming speech-to-text transcription.

## Accessible Chat

Powered by Azure Speech Services, PlayFab Party can transcribe player voice chat and synthesize speech from text.
This functionality has several uses but was primarily designed as an accessibility aide. We recommend tying activation
of this capability to an ease-of-access player setting. For more guidance on how to use the accessibility features provided
by PlayFab Party, please refer to the [text-to-speech guideline](party-text-to-speech-ux-guidelines.md) and the [speech-to-text guideline](party-speech-to-text-ux-guidelines.md).

## Next steps
- [Find out more about PlayFab Party chat permissions and muting](concepts-chat-permissions-and-muting.md)
