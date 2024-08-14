---
author: jdeweyMSFT
title: "PartyLocalDevice::DestroyChatControl"
description: Queues an asynchronous operation to destroy a local chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalDevice::DestroyChatControl  

Queues an asynchronous operation to destroy a local chat control.  

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
  
## Remarks  
  
This method queues an asynchronous attempt to destroy a local chat control. A [PartyDestroyChatControlCompletedStateChange](../../../structs/partydestroychatcontrolcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. Before successful completion of the operation, the local chat control will be disconnected from all networks it was previously connected to (each indicated by a [PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)). Memory for the local chat control will remain valid until all state changes referencing the chat control have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalDevice](../partylocaldevice.md)  
[PartyDestroyChatControlCompletedStateChange](../../../structs/partydestroychatcontrolcompletedstatechange.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)  
[PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)
  
  
