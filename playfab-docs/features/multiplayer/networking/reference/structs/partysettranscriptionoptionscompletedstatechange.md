---
author: jdeweyMSFT
title: "PartySetTranscriptionOptionsCompletedStateChange"
description: "Information specific to the *SetTranscriptionOptionsCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartySetTranscriptionOptionsCompletedStateChange  

Information specific to the *SetTranscriptionOptionsCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartySetTranscriptionOptionsCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartyVoiceChatTranscriptionOptions options;  
    void* asyncIdentifier;  
} PartySetTranscriptionOptionsCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
On success, internal state has updated to reflect whether transcription operations should be attempted on behalf of ```localChatControl```. Success does not guarantee that transcription operations will complete successfully. Failures to complete transcription operations will be exposed through the ```result``` field of the [PartyStateChangeType::VoiceChatTranscriptionReceived](../enums/partystatechangetype.md) state change.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`options`** &nbsp; [PartyVoiceChatTranscriptionOptions](../enums/partyvoicechattranscriptionoptions.md)  
  
The transcription options provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)
  
  
