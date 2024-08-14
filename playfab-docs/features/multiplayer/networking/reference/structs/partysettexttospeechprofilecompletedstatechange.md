---
author: jdeweyMSFT
title: "PartySetTextToSpeechProfileCompletedStateChange"
description: "Information specific to the *SetTextToSpeechProfileCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartySetTextToSpeechProfileCompletedStateChange  

Information specific to the *SetTextToSpeechProfileCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartySetTextToSpeechProfileCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartySynthesizeTextToSpeechType type;  
    PartyString profileIdentifier;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
On success, [PartyLocalChatControl::GetTextToSpeechProfile()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_gettexttospeechprofile.md) will return the full profile object corresponding to the profile identifier provided to the [PartyLocalChatControl::SetTextToSpeechProfile()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md) call associated with this state change. On failure, PartyLocalChatControl::GetTextToSpeechProfile() will return null.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`type`** &nbsp; [PartySynthesizeTextToSpeechType](../enums/partysynthesizetexttospeechtype.md)  
  
The type of text-to-speech operation provided to the call associated with this state change.
  
**`profileIdentifier`** &nbsp; [PartyString](../typedefs.md)  
  
The profile identifier provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
## Remarks  
  
At most, one PartySetTextToSpeechProfileCompletedStateChange object will be returned in any state change batch from [PartyManager::StartProcessingStateChanges()](../classes/PartyManager/methods/partymanager_startprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md)
  
  
