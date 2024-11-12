---
title: Troubleshooting Voice Chat
description: Tips for troubleshooting PlayFab Party real-time chat and data communication.
author: ScottMunroMS
ms.author: scmunro
ms.date: 8/21/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking
---

# Troubleshooting Voice Chat

If two players are trying to chat together and one or both of them can't hear each other, try these troubleshooting steps.

## Check the chat indicators

PlayFab Party's chat indicators can be used to troubleshoot audio problems.

Use `PartyLocalChatControl::GetLocalChatIndicator()` to inspect the instantaneous audio state of the local chat control. A healthy chat control should return either `PartyLocalChatControlChatIndicator::Silent` or `PartyLocalChatControlChatIndicator::Talking` depending on whether the library is detecting voice from the microphone input.

- If `PartyLocalChatControlChatIndicator::AudioInputMuted` is returned, the chat control's outbound audio stream was previously muted via a call to `PartyLocalChatControl::SetAudioInputMuted(true)` and the mute must be disabled by calling `PartyLocalChatControl::SetAudioInputMuted(false)`

- If `PartyLocalChatControlChatIndicator::NoAudioInput` is returned, either the local chat control's audio input was never set by calling `PartyLocalChatControl::SetAudioInputMuted()` or the audio input failed to initialize. Continue to the next [section](#verify-that-the-audio-device-is-successfully-initialized) for tips on diagnosing audio input initialization failures.

Use `PartyLocalChatControl::GetChatIndicator()` to inspect the audio input state of a remote chat control, relative to a local chat control.

- If `PartyChatControlChatIndicator::Silent` is returned while you were expecting to hear audio this might means that there is a problem with the remote audio device or that the chat permissions on the remote device are not configured to send audio to this chat control. Continue to the following [section](#verify-that-the-chat-controls-have-the-right-chat-permissions) if this sounds like what you are experiencing.

- If `PartyChatControlChatIndicator::Talking` is returned but you can't still hear any audio, there might be a problem with the local audio output device. Continue to the next [section](#verify-that-the-audio-device-is-successfully-initialized) to learn how to check if an audio device is healthy.

- If `PartyChatControlChatIndicator::IncomingVoiceDisabled` is returned, this means that the local chat control has not had its chat permissions configured to allow audio from the remote chat control. Continue to the [chat permission](#verify-that-the-chat-controls-have-the-right-chat-permissions) section.

- If `PartyChatControlChatIndicator::IncomingCommunicationsMuted` is returned, this means that incoming audio has been muted via a previous call to `PartyLocalChatControl::SetIncomingAudioMuted()`. Call `PartyLocalChatControl::SetIncomingAudioMuted()` to unmute the remote chat control.

## Verify that the audio device is successfully initialized

Shortly after calling `PartyLocalChatControl::SetAudioInput()` or `PartyLocalChatControl::SetAudioOutput()` you will receive a `PartyLocalChatAudioInputChangedStateChange` or a `PartyLocalChatAudioOutputChangedStateChange`. Both of these state changes will contain information that may help you troubleshoot any issue related to audio devices. These state changes contain a `PartyAudioInputState` field and a `PartyAudioOutputState` field that will give you information on the state of the audio device. If the state of the audio device is anything other than `Initialized`, this means that PlayFab Party was unable to use the desired audio device. The `errorDetail` field on the state change can also be used to get further information on the situation. Call `PartyManager::GetErrorMessage()` to get the human readable form of the error detail.

> [!NOTE]
> By default, chat controls will not be associated with any audio device. Be sure to call `PartyLocalChatControl::SetAudioInput()` and `PartyLocalChatControl::SetAudioOutput()` on all of your chat controls.

## Verify that the chat controls have the right chat permissions

Use `PartyLocalChatControl::GetPermissions()` to look up the `PartyChatPermissionOptions` between two chat controls. For example, if a user Alice is unable to hear another user Bob, you will want to make sure that Alice has the permission to receive audio from Bob and that Bob has the permission to send audio to Alice.

On Alice's device:
```cpp
PartyChatPermissionOptions chatPermissions;
PartyError error = localChatControlAlice->GetPermissions(remoteChatControlBob, &chatPermissions);
if (PARTY_SUCCEEDED(error))
{
    if (static_cast<bool>(chatPermissions & PartyChatPermissionOptions::ReceiveAudio))
    {
        printf("Alice can receive audio from Bob!");
    }
}
```

On Bob's device:
```cpp
PartyChatPermissionOptions chatPermissions;
PartyError error = localChatControlBob->GetPermissions(remoteChatControlAlice, &chatPermissions);
if (PARTY_SUCCEEDED(error))
{
    if (static_cast<bool>(chatPermissions & PartyChatPermissionOptions::SendAudio))
    {
        printf("Bob can send audio to Alice!");
    }
}
```

## Check default device vs. default communication device in Windows

A frequent point of confusion for audio on Windows is around the concepts of default device and default communications device. Windows supports both concepts, and they can be different devices. PlayFab Party, by design, uses the default communications device in the Windows version of the library when ``AudioDeviceSelectionType::SystemDefault`` is passed to ``PartyLocalChatControl::SetAudioInput`` or ``PartyLocalChatControl::SetAudioOutput``. Troubleshooting and testing should always be performed in relation to the default communications device.
