---
author: jdeweyMSFT
title: "PartySetChatAudioInputCompletedStateChange"
description: "Information specific to the *SetChatAudioInputCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartySetChatAudioInputCompletedStateChange  

Information specific to the *SetChatAudioInputCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartySetChatAudioInputCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartyAudioDeviceSelectionType audioDeviceSelectionType;  
    PartyString audioDeviceSelectionContext;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the audio input configuration operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`audioDeviceSelectionType`** &nbsp; [PartyAudioDeviceSelectionType](../enums/partyaudiodeviceselectiontype.md)  
  
The audio device selection type provided to the call associated with this state change.
  
**`audioDeviceSelectionContext`** &nbsp; [PartyString](../typedefs.md)  
  
The device context provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetAudioInput](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md)
  
  
