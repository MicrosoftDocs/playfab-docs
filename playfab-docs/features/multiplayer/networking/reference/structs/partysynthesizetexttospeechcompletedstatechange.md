---
author: jdeweyMSFT
title: "PartySynthesizeTextToSpeechCompletedStateChange"
description: "Information specific to the *SynthesizeTextToSpeechCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartySynthesizeTextToSpeechCompletedStateChange  

Information specific to the *SynthesizeTextToSpeechCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartySynthesizeTextToSpeechCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartySynthesizeTextToSpeechType type;  
    PartyString textToSynthesize;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`type`** &nbsp; [PartySynthesizeTextToSpeechType](../enums/partysynthesizetexttospeechtype.md)  
  
The type of text-to-speech operation provided to the call associated with this state change.
  
**`textToSynthesize`** &nbsp; [PartyString](../typedefs.md)  
  
The synthesized text provided to the call associated with this state change.
  
If the accompanying result was a success, the audio synthesized for this text has been queued in the audio stream but may not have been transmitted yet.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SynthesizeTextToSpeech](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_synthesizetexttospeech.md)
  
  
