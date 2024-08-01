---
author: jdeweyMSFT
title: "PartyCreateChatControlCompletedStateChange"
description: "Information specific to the *CreateChatControlCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyCreateChatControlCompletedStateChange  

Information specific to the *CreateChatControlCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyCreateChatControlCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalDevice* localDevice;  
    PartyLocalUser* localUser;  
    PartyString languageCode;  
    void* asyncIdentifier;  
    PartyLocalChatControl* localChatControl;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the chat control creation operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localDevice`** &nbsp; [PartyLocalDevice](../classes/PartyLocalDevice/partylocaldevice.md)*  
  
The local device used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language code provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control that was created.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)
  
  
