---
author: jdeweyMSFT
title: "PartyNetwork::DisconnectChatControl"
description: Disconnects the local chat control from the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyNetwork::DisconnectChatControl  

Disconnects the local chat control from the network.  

## Syntax  
  
```cpp
PartyError DisconnectChatControl(  
    PartyLocalChatControl* chatControl,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`chatControl`** &nbsp; [PartyLocalChatControl*](../../PartyLocalChatControl/partylocalchatcontrol.md)  
  
The chat control to disconnect from this network.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to disconnect the chat control began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  

  
  
