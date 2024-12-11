---
title: Using Cognitive Services
description: Guidance on how to use PlayFab Party Cognitive Services in your Unreal Engine Project.
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, middleware
---

# Introduction to Cognitive Services

The PlayFab Party Cognitive Services Interface includes functions that allow for the configuration and use of the accessibility features provided by PlayFab Party.

These features include:

- Real-time text chat translation
- Real-time voice chat transcription
- Real-time voice chat transcription translation
- Text-to-speech synthesis 

## Pricing
Cognitive Services and other services beyond core VOIP and game networking functionality may have a cost associated with them. Please visit the [Billing for PlayFab Party](../../pricing/meters/meters.md#party) page for more details or reach out to your Microsoft Representative.


## Using the Cognitive Services Interface
To use the Cognitive Services Interface in your game, add the following block of code to your game's Build.cs file.
<pre><code>if (Target.bGenerateProjectFiles || (Target.Type != TargetType.Game && Target.Type != TargetType.Client))
{
	PublicDefinitions.Add("WITH_OSS_PLAYFAB_COGNITIVESERVICES=0");
}
else
{
	PublicDefinitions.Add("WITH_OSS_PLAYFAB_COGNITIVESERVICES=1");

	PublicDependencyModuleNames.Add("OnlineSubsystemPlayFab");
	PrivateDependencyModuleNames.Add("HTTP");
}
</code></pre>

Additionally, you can wrap any game code with **#if WITH_OSS_PLAYFAB_COGNITIVESERVICES** to prevent compilation errors on platforms that do not use Cognitive Services.

## SetTextChatTranslationOptions
SetTextChatTranslationOptions allows chat translation to be toggled on or off.

## SetVoiceChatTranscriptionOptions
SetVoiceChatTranscriptionOptions is required for enabling and configuring voice transcription.

- **bTranscribeSelf** - Transcriptions of the local chat control will be generated and provided to the same local chat control
- **bTranscribeOtherChatControlsWithMatchingLanguages** - Transcriptions of other chat controls with the same language as the local chat control will be generated and provided to the local chat control 
- **bTranscribeOtherChatControlsWithNonMatchingLanguages** - Transcriptions of other chat controls with languages that are different from the local chat control's language will be generated and provided to the local chat control
- **bTranslateToLocalLanguage** - Transcriptions will be translated to the local chat control's language

## SetTextToSpeechOptions
SetTextToSpeechOptions is required for enabling and configuring text to speech.

- **ETextToSpeechType::Narration** - Render audio to the local chat control's audio output
- **ETextToSpeechType::VoiceChat** - Render audio to chat controls which the local chat control is configured to send audio to

## SendTextAsVoice
Generates text to speech audio that is sent to all other clients connected to the PlayFab Party network.
Text as Voice must be enabled via a call to **SetTextToSpeechOptions** before calling **SendTextAsVoice**

## SendChatText
Sends chat text string to all other clients connected to the PlayFab Party network.
