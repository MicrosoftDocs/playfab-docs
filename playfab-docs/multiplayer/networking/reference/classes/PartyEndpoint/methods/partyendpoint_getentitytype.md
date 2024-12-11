---
author: jdeweyMSFT
title: "PartyEndpoint::GetEntityType"
description: Gets the PlayFab entity type of the user associated with this endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyEndpoint::GetEntityType  

Gets the PlayFab entity type of the user associated with this endpoint.  

## Syntax  
  
```cpp
PartyError GetEntityType(  
    PartyString* entityType  
)  
```  
  
### Parameters  
  
**`entityType`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output, may return nullptr*  
  
The output entity type name string of the user associated with this endpoint, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This returned string is the same value as the one found in the *type* field of a ```PFEntityKey``` structure representing the entity. The value returned from [GetEntityId()](partyendpoint_getentityid.md) would represent the other half of a ```PFEntityKey```. <br /><br /> If this endpoint isn't associated with a user, `entityType` is set to nullptr.   <br /><br /> The memory for the entity type string remains valid for the life of the endpoint, which is until its [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) and/or [PartyDestroyEndpointCompletedStateChange](../../../structs/partydestroyendpointcompletedstatechange.md), depending on the type of destruction that occurred, has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the endpoint have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  
[PartyEndpoint::GetEntityId](partyendpoint_getentityid.md)
  
  
