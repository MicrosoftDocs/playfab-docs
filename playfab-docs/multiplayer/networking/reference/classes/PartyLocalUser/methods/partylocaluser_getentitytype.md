---
author: jdeweyMSFT
title: "PartyLocalUser::GetEntityType"
description: Gets the PlayFab entity type associated with this local user.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyLocalUser::GetEntityType  

Gets the PlayFab entity type associated with this local user.  

## Syntax  
  
```cpp
PartyError GetEntityType(  
    PartyString* entityType  
)  
```  
  
### Parameters  
  
**`entityType`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output entity type name string of the user.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The retrieved PlayFab entity type string will be "title_player_account" for users created via [PartyManager::CreateLocalUser()](../../PartyManager/methods/partymanager_createlocaluser.md), or the entity type provided by the caller for users created via [PartyManager::CreateLocalUserWithEntityType()](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md). This is also the same value as the one found in the *type* field of a ```PFEntityKey``` structure representing the entity. The value returned from [GetEntityId()](partylocaluser_getentityid.md) would represent the other half of a ```PFEntityKey```. <br /><br /> The memory for the entity type string remains valid for the life of the local user, which is until its [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) has been provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) and all state changes referencing the local user have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalUser](../partylocaluser.md)  
[PartyLocalUser::GetEntityId](partylocaluser_getentityid.md)  
[PartyManager::CreateLocalUser](../../PartyManager/methods/partymanager_createlocaluser.md)  
[PartyManager::CreateLocalUserWithEntityType](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md)
  
  
