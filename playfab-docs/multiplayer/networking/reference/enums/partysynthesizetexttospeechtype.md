---
author: jdeweyMSFT
title: "PartySynthesizeTextToSpeechType"
description: "Types of text-to-speech operations."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartySynthesizeTextToSpeechType  

Types of text-to-speech operations.    

## Syntax  
  
```cpp
enum class PartySynthesizeTextToSpeechType    
{  
    Narration = 0,  
    VoiceChat = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Narration | The audio should be rendered to the local chat control's audio output.<br/><br/> This type is typically used for the "narration" scenario where text-to-speech audio is rendered to the local chat control for arbitrary game-defined scenarios, such as the narration of received text. It may also be used for the "voice auditioning" scenario where a user compares audio between text-to-speech profiles to select the profile they prefer to use in text-to-speech voice chat scenarios. The chat control does not need to be in a network for this functionality. <br /><br /> The audio will never be transcribed, even if transcription is enabled. |  
| VoiceChat | The audio should be rendered to the chat controls to which the local chat control is configured to send audio.<br/><br/> This type is typically used for the "text-to-speech voice chat" scenario where a user elects not to participate in voice chat with their microphone, but still wishes to participate in the voice chat via text-to-speech audio. The audio will be rendered to the chat controls to which the local chat control has been configured to send audio via [PartyLocalChatControl::SetPermissions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setpermissions.md). The chat control does not need to be in a network for a text-to-speech operation of this type to succeed, but it will have no apparent effect because there will be no other chat controls to which the local chat control could be configured to send audio. <br /><br /> Because the audio represents the user's voice, it will be transcribed according to the options specified via [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md). |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_gettexttospeechprofile.md)  
[PartyLocalChatControl::SynthesizeTextToSpeech](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_synthesizetexttospeech.md)
  
  
