---
author: jdeweyMSFT
title: "PartyDestroyChatControlCompletedStateChange"
description: "Information specific to the *DestroyChatControlCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyDestroyChatControlCompletedStateChange  

Information specific to the *DestroyChatControlCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyDestroyChatControlCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalDevice* localDevice;  
    PartyLocalChatControl* localChatControl;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the chat control destruction operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localDevice`** &nbsp; [PartyLocalDevice](../classes/PartyLocalDevice/partylocaldevice.md)*  
  
The local device used in the call associated with this state change.
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control that was destroyed.
  
The memory remains valid until this state change is returned.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::DestroyChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md)
  
  
