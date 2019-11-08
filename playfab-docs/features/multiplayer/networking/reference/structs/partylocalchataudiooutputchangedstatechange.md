---
author: jdeweyMSFT
title: "PartyLocalChatAudioOutputChangedStateChange"
description: "Information specific to the *LocalChatAudioOutputChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyLocalChatAudioOutputChangedStateChange  

Information specific to the *LocalChatAudioOutputChanged* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyLocalChatAudioOutputChangedStateChange {  
    PartyLocalChatControl* localChatControl;  
    PartyAudioOutputState state;  
    PartyError errorDetail;  
} PartyLocalChatAudioOutputChangedStateChange  
```
  
### Members  
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The local chat control which had an audio output state change.
  
**`state`** &nbsp; [PartyAudioOutputState](../enums/partyaudiooutputstate.md)  
  
Indicates the new state of the audio output associated with the chat control.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetAudioOutput](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md)
  
  
