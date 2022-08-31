---
author: jdeweyMSFT
title: "PartyChatControl::GetEntityId"
description: Gets the PlayFab Entity ID of the user associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyChatControl::GetEntityId  

Gets the PlayFab Entity ID of the user associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetEntityId(  
    PartyString* entityId  
)  
```  
  
### Parameters  
  
**`entityId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output Entity ID.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The memory for the Entity ID string remains valid for the life of the chat control, which is until its [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md) and/or [PartyDestroyChatControlCompletedStateChange](../../../structs/partydestroychatcontrolcompletedstatechange.md), depending on the type of destruction that occurred, has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the chat control have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
