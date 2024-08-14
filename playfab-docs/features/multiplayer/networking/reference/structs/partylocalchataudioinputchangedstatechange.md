---
author: jdeweyMSFT
title: "PartyLocalChatAudioInputChangedStateChange"
description: "Information specific to the *LocalChatAudioInputChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyLocalChatAudioInputChangedStateChange  

Information specific to the *LocalChatAudioInputChanged* type of state change.  

## Syntax  
  
```cpp
struct PartyLocalChatAudioInputChangedStateChange : PartyStateChange {  
    PartyLocalChatControl* localChatControl;  
    PartyAudioInputState state;  
    PartyError errorDetail;  
}  
```
  
### Members  
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The local chat control which had an audio input state change.
  
**`state`** &nbsp; [PartyAudioInputState](../enums/partyaudioinputstate.md)  
  
Indicates the new state of the audio input associated with the chat control.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetAudioInput](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md)
  
  
