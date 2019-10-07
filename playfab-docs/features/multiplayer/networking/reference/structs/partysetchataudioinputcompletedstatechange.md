---
author: jdeweyMSFT
title: "PartySetChatAudioInputCompletedStateChange"
description: "Information specific to the *SetChatAudioInputCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartySetChatAudioInputCompletedStateChange  

Information specific to the *SetChatAudioInputCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartySetChatAudioInputCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartyAudioDeviceSelectionType audioDeviceSelectionType;  
    PartyString audioDeviceSelectionContext;  
    void* asyncIdentifier;  
} PartySetChatAudioInputCompletedStateChange  
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
  
  
