---
title: Voice Audio Noise Suppression
description: Information on how Noise Suppression can be incorporated into PlayFab Party Voice Audio.
author: nassosterz-ms
ms.author: aterzakis
ms.date: 05/10/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, chat
---

# Improving voice audio quality with noise suppression

PlayFab Party supports capturing and transmitting microphone audio between players to enable real-time voice chat. Background noise is often captured alongside this microphone audio and can degrade the quality of that player's voice as heard by other players. To improve the quality of player voice audio in noisy environments, you can configure PlayFab Party to dynamically suppress noise captured from player microphones.

## Prerequisites

This walkthrough assumes you have basic familiarity with [voice chat in PlayFab Party](concepts-chat.md).

## Platform support

Noise Suppression isn't available on all platforms. While the methods associated with noise suppression are present in the unified, cross-platform header, they're currently only implemented for Android and iOS. The methods will return errors on other platforms.

### Device model limitations

Noise suppression on PlayFab Party is supported only on Android devices with Advanced SIMD (Neon) enhanced CPUs. Noise suppression can be enabled on Android devices without this support, but voice audio will be transmitted without any noise suppression.

On iOS, noise suppression is supported on all iOS devices.

## How to enable Noise Suppression in your game

### Packaging the model in your game

Noise suppression on PlayFab Party requires an additional file to be packaged in your game. Locate the **PartyNoiseSuppressionModel.fpie** file distributed with the Party library package. Depending on the platform, separate actions need to be taken.

#### Android

Copy the **PartyNoiseSuppressionModel.fpie** file inside the **{game}/src/main/assets/directory**.

#### iOS

Include the PartyNoiseSuppressionModel.fpie in the resources of your game.

### Example: Enabling Noise Suppression for a Local Chat Control

```cpp
PartyError error = localChatControl->SetVoiceAudioOptions(PartyVoiceAudioOptions::NoiseSuppression);
if (PARTY_FAILED(error))
{
    printf("Failed to enable noise suppression for local chat control 0x%p! error = 0x%08x\n", localChatControl, error);
}
```

### Example: Disabling Noise Suppression for a Local Chat Control

```cpp
// to disable noise suppression for a local chat control
PartyError error = localChatControl->SetVoiceAudioOptions(PartyVoiceAudioOptions::None);
if (PARTY_FAILED(error))
{
    printf("Failed to disable noise suppression for local chat control 0x%p! error = 0x%08x\n", localChatControl, error);
}
```

## Performance considerations

Based on internal testing, enabling noise suppression on PlayFab Party does not significantly impact CPU performance nor battery life.

## See also

* [Party overview](index.md)
* [Party Quickstart](quickstart.md)
* [Android specific requirements](android-specific-requirements.md)
* [iOS and macOS specific requirements](apple-specific-requirements.md)
