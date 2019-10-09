---
author: jdeweyMSFT
title: "PartyLocalDevice::DestroyChatControl"
description: Destroys a local chat control.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyLocalDevice::DestroyChatControl  

Destroys a local chat control.  

## Syntax  
  
```cpp
PartyError DestroyChatControl(  
    PartyLocalChatControl* localChatControl,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localChatControl`** &nbsp; [PartyLocalChatControl*](../../PartyLocalChatControl/partylocalchatcontrol.md)  
  
The local chat control to destroy.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to destroy the chat control began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalDevice](../partylocaldevice.md)  
[PartyDestroyChatControlCompletedStateChange](../../../structs/partydestroychatcontrolcompletedstatechange.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)
  
  
