---
author: jdeweyMSFT
title: "PartyEndpoint::GetEntityId"
description: Gets the PlayFab Entity ID of the user associated with this endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyEndpoint::GetEntityId  

Gets the PlayFab Entity ID of the user associated with this endpoint.  

## Syntax  
  
```cpp
PartyError GetEntityId(  
    PartyString* entityId  
)  
```  
  
### Parameters  
  
**`entityId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output, may return nullptr*  
  
The output Entity ID of the user associated with this endpoint, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The returned string is the same value as the one found in the *ID* field of a ```PFEntityKey``` structure representing the entity. The value returned from [GetEntityType()](partyendpoint_getentitytype.md) would represent the other half of a ```PFEntityKey```. <br /><br /> If this endpoint isn't associated with a user, `entityId` is set to nullptr.   <br /><br /> The memory for the Entity ID string remains valid for the life of the endpoint, which is until its [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) and/or [PartyDestroyEndpointCompletedStateChange](../../../structs/partydestroyendpointcompletedstatechange.md), depending on the type of destruction that occurred, has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the endpoint have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  
[PartyEndpoint::GetEntityType](partyendpoint_getentitytype.md)
  
  
