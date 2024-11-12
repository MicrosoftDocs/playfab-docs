---
author: jdeweyMSFT
title: "PartyNetwork::ConnectChatControl"
description: Connects the local chat control to the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyNetwork::ConnectChatControl  

Connects the local chat control to the network.  

## Syntax  
  
```cpp
PartyError ConnectChatControl(  
    PartyLocalChatControl* chatControl,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`chatControl`** &nbsp; [PartyLocalChatControl*](../../PartyLocalChatControl/partylocalchatcontrol.md)  
  
The chat control to connect to this network.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to connect the chat control began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
On successful return, this method invalidates the memory for any array previously returned by [GetChatControls()](partynetwork_getchatcontrols.md) or [PartyChatControl::GetNetworks()](../../PartyChatControl/methods/partychatcontrol_getnetworks.md) for `chatControl`, as it synchronously updates those arrays. [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) also invalidates the memory for those arrays.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  

  
  
