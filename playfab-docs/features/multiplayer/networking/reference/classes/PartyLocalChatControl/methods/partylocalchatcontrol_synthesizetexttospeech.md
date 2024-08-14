---
author: jdeweyMSFT
title: "PartyLocalChatControl::SynthesizeTextToSpeech"
description: Generates text-to-speech audio that is used to either displace the microphone audio associated with this chat control or render directly to the chat control's audio output.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/26/2019
---

# PartyLocalChatControl::SynthesizeTextToSpeech  

Generates text-to-speech audio that is used to either displace the microphone audio associated with this chat control or render directly to the chat control's audio output.  

## Syntax  
  
```cpp
PartyError SynthesizeTextToSpeech(  
    PartySynthesizeTextToSpeechType type,  
    PartyString textToSynthesize,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`type`** &nbsp; [PartySynthesizeTextToSpeechType](../../../enums/partysynthesizetexttospeechtype.md)  
  
The type of text-to-speech operation.  
  
**`textToSynthesize`** &nbsp; [PartyString](../../../typedefs.md)  
  
The text from which to synthesize audio.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to synthesize the text to speech began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
SynthesizeTextToSpeech() cannot be called for a particular `type` until a text-to-speech profile has been configured for the specified `type` via [SetTextToSpeechProfile()](partylocalchatcontrol_settexttospeechprofile.md). <br /><br /> SynthesizeTextToSpeech() can be called immediately after configuring a text-to-speech profile via a call to SetTextToSpeechProfile() with the same `type`. In such a case, the text-to-speech operation will be queued behind the completion of the SetTextToSpeechProfile() operation.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](partylocalchatcontrol_settexttospeechprofile.md)
  
  
