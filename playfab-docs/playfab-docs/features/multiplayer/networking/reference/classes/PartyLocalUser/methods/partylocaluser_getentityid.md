---
author: jdeweyMSFT
title: "PartyLocalUser::GetEntityId"
description: Gets the Entity ID associated with this local user.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyLocalUser::GetEntityId  

Gets the Entity ID associated with this local user.  

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
  
The retrieved Entity ID is identical to the Entity ID provided by the title via [PartyManager::CreateLocalUser()](../../PartyManager/methods/partymanager_createlocaluser.md). <br /><br /> The memory for the Entity ID string remains valid for the life of the local user, which is until its [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the local user have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalUser](../partylocaluser.md)  
[PartyManager::CreateLocalUser](../../PartyManager/methods/partymanager_createlocaluser.md)
  
  
