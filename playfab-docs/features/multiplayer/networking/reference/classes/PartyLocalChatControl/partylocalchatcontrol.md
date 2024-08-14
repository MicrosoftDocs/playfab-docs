---
author: jdeweyMSFT
title: "PartyLocalChatControl"
description: The management class for chat operations related to the local device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyLocalChatControl  

The management class for chat operations related to the local device.  

## Syntax  
  
```cpp  
class PartyLocalChatControl : public PartyChatControl  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetLocalUser](methods/partylocalchatcontrol_getlocaluser.md) | Gets the local user associated with this local chat control. |  
| [SetPermissions](methods/partylocalchatcontrol_setpermissions.md) | Sets the chat permissions between the local chat control and a target chat control. |  
| [GetPermissions](methods/partylocalchatcontrol_getpermissions.md) | Gets the voice communication relationship between the local chat control and a target chat control. |  
| [SendText](methods/partylocalchatcontrol_sendtext.md) | Transmits a chat text string to each specified target chat control. |  
| [SetAudioInput](methods/partylocalchatcontrol_setaudioinput.md) | Configures the preferred microphone or recording device that the chat control will use for audio input. |  
| [GetAudioInput](methods/partylocalchatcontrol_getaudioinput.md) | Provides the preferred microphone or recording device that the chat control has been configured to use for audio input. |  
| [SetAudioOutput](methods/partylocalchatcontrol_setaudiooutput.md) | Configures the preferred speakers or headset device that the chat control will use for audio output. |  
| [GetAudioOutput](methods/partylocalchatcontrol_getaudiooutput.md) | Provides the preferred speakers or headset device that the chat control has been configured to use for audio output. |  
| [PopulateAvailableTextToSpeechProfiles](methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md) | Populates the local chat control's list of supported text-to-speech profiles. |  
| [GetAvailableTextToSpeechProfiles](methods/partylocalchatcontrol_getavailabletexttospeechprofiles.md) | Gets the text-to-speech profiles for this chat control. |  
| [SetTextToSpeechProfile](methods/partylocalchatcontrol_settexttospeechprofile.md) | Configures the profile to use for a specified type of text-to-speech operation. |  
| [GetTextToSpeechProfile](methods/partylocalchatcontrol_gettexttospeechprofile.md) | Gets the profile that was last configured from a successfully completed [SetTextToSpeechProfile()](methods/partylocalchatcontrol_settexttospeechprofile.md) operation for a specified type of text-to-speech operation. |  
| [SynthesizeTextToSpeech](methods/partylocalchatcontrol_synthesizetexttospeech.md) | Generates text-to-speech audio that is used to either displace the microphone audio associated with this chat control or render directly to the chat control's audio output. |  
| [GetLanguage](methods/partylocalchatcontrol_getlanguage.md) | Gets the language associated with this chat control. |  
| [SetTranscriptionOptions](methods/partylocalchatcontrol_settranscriptionoptions.md) | Configures the transcription options associated with voice chat audio for this chat control. |  
| [GetTranscriptionOptions](methods/partylocalchatcontrol_gettranscriptionoptions.md) | Provides the transcription options associated with voice chat audio for this chat control. |  
| [SetTextChatOptions](methods/partylocalchatcontrol_settextchatoptions.md) | Configures the text chat options associated with text chat for this chat control. |  
| [GetTextChatOptions](methods/partylocalchatcontrol_gettextchatoptions.md) | Provides the text chat options associated with text chat for this chat control. |  
| [SetAudioRenderVolume](methods/partylocalchatcontrol_setaudiorendervolume.md) | Configures the volume setting for audio received from a target chat control that will be used for the local chat control. |  
| [GetAudioRenderVolume](methods/partylocalchatcontrol_getaudiorendervolume.md) | Provides the volume setting for audio received from a target chat control that will be used for the local chat control. |  
| [SetAudioInputMuted](methods/partylocalchatcontrol_setaudioinputmuted.md) | Configures whether the user's audio input is in the mute state. |  
| [GetAudioInputMuted](methods/partylocalchatcontrol_getaudioinputmuted.md) | Provides whether the user's audio input is in the mute state. |  
| [SetIncomingAudioMuted](methods/partylocalchatcontrol_setincomingaudiomuted.md) | Configures whether the incoming audio from the target chat control, in relation to the local chat control, is muted. |  
| [GetIncomingAudioMuted](methods/partylocalchatcontrol_getincomingaudiomuted.md) | Provides whether the incoming audio from the target chat control, in relation to the local chat control, has previously been muted. |  
| [SetIncomingTextMuted](methods/partylocalchatcontrol_setincomingtextmuted.md) | Configures whether the incoming text messages from the target chat control, in relation to the local chat control, is muted. |  
| [GetIncomingTextMuted](methods/partylocalchatcontrol_getincomingtextmuted.md) | Provides whether the incoming text messages from the target chat control, in relation to the local chat control, has previously been muted. |  
| [SetVoiceAudioOptions](methods/partylocalchatcontrol_setvoiceaudiooptions.md) | Configures the voice audio options for this chat control. |  
| [GetVoiceAudioOptions](methods/partylocalchatcontrol_getvoiceaudiooptions.md) | Provides the voice audio options associated with this chat control. |  
| [GetLocalChatIndicator](methods/partylocalchatcontrol_getlocalchatindicator.md) | Provides a chat indicator specifying the audio state of the local chat control. |  
| [GetChatIndicator](methods/partylocalchatcontrol_getchatindicator.md) | Provides a chat indicator specifying the audio state of a target chat control in relation to the local chat control. |  
| [ConfigureAudioManipulationCaptureStream](methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md) | Queues an asynchronous operation to configure the audio manipulation capture stream. |  
| [GetAudioManipulationCaptureStream](methods/partylocalchatcontrol_getaudiomanipulationcapturestream.md) | Retrieves the audio manipulation capture stream associated with this chat control. |  
| [ConfigureAudioManipulationRenderStream](methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md) | Queues an asynchronous operation to configure the audio manipulation render stream. |  
| [GetAudioManipulationRenderStream](methods/partylocalchatcontrol_getaudiomanipulationrenderstream.md) | Retrieves the manipulation render stream associated with this chat control. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyChatControl](../PartyChatControl/partychatcontrol.md)  
[PartyChatControl::GetLocal](../PartyChatControl/methods/partychatcontrol_getlocal.md)
  
  
  
