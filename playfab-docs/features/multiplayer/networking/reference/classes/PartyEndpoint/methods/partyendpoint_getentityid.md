---
author: jdeweyMSFT
title: "PartyEndpoint::GetEntityId"
description: Gets the PlayFab Entity ID of the user associated with this endpoint.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*output, may return nullptr*  
  
The output Entity ID of ther user associated with this endpoint, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If this endpoint is not associated with a user, `entityId` is set to nullptr. <br /><br /> The memory for the Entity ID string remains valid for the life of the endpoint, which is until its [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) and/or [PartyDestroyEndpointCompletedStateChange](../../../structs/partydestroyendpointcompletedstatechange.md), depending on the type of destruction that occurred, has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the endpoint have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  

  
  
