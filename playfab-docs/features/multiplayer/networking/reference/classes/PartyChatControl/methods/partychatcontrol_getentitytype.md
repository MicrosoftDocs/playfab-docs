---
author: jdeweyMSFT
title: "PartyChatControl::GetEntityType"
description: Gets the PlayFab entity type of the user associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyChatControl::GetEntityType  

Gets the PlayFab entity type of the user associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetEntityType(  
    PartyString* entityType  
)  
```  
  
### Parameters  
  
**`entityType`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output entity type name string of the user associated with this chat control, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This returned string is the same value as the one found in the *type* field of a ```PFEntityKey``` structure representing the entity. The value returned from [GetEntityId()](partychatcontrol_getentityid.md) would represent the other half of a ```PFEntityKey```. <br /><br /> The memory for the entity type string remains valid for the life of the chat control, which is until its [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md) and/or [PartyDestroyChatControlCompletedStateChange](../../../structs/partydestroychatcontrolcompletedstatechange.md), depending on the type of destruction that occurred, has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the chat control have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  
[PartyChatControl::GetEntityId](partychatcontrol_getentityid.md)
  
  
