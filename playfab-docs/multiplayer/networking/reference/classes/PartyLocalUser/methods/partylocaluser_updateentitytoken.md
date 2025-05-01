---
author: jdeweyMSFT
title: "PartyLocalUser::UpdateEntityToken"
description: Updates the PlayFab Entity Token associated with this local user, for use in future authenticated operations.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalUser::UpdateEntityToken  

Updates the PlayFab Entity Token associated with this local user, for use in future authenticated operations.  

## Syntax  
  
```cpp
PartyError UpdateEntityToken(  
    PartyString entityToken  
)  
```  
  
### Parameters  
  
**`entityToken`** &nbsp; [PartyString](../../../typedefs.md)  
  
The new PlayFab Entity Token to associate with the local user.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method takes a PlayFab Entity Token as `entityToken`. No synchronous validation is performed on this value. When the library performs operations that require user authentication or authorization, such as creating a network, authenticating into a network, or performing speech-to-text transcription, the Party service will validate that the token is valid, is not expired, is associated with the same Entity ID that was provided to the [PartyManager::CreateLocalUser()](../../PartyManager/methods/partymanager_createlocaluser.md) or [PartyManager::CreateLocalUserWithEntityType()](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md) call, and is authorized to perform the operation. If these conditions aren't met, the operation will fail. <br /><br /> A PlayFab Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method. The token must be associated with the same PlayFab Entity ID and type as originally specified to [PartyManager::CreateLocalUser()](../../PartyManager/methods/partymanager_createlocaluser.md) or [PartyManager::CreateLocalUserWithEntityType()](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md).   <br /><br /> The provided `entityToken` must have been acquired using the same Title ID that was passed to [PartyManager::Initialize()](../../PartyManager/methods/partymanager_initialize.md).   <br /><br /> The Party library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as [PartyManager::CreateNewNetwork()](../../PartyManager/methods/partymanager_createnewnetwork.md) or [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md). If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Party library by another call to this method.   <br /><br /> The caller is responsible for monitoring the expiration of the entity token provided to this method and [PartyManager::CreateLocalUser()](../../PartyManager/methods/partymanager_createlocaluser.md) or [PartyManager::CreateLocalUserWithEntityType()](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md). When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Party library by calling this method. We recommend acquiring a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalUser](../partylocaluser.md)  
[PartyManager::GetErrorMessage](../../PartyManager/methods/partymanager_geterrormessage.md)  
[PartyManager::CreateLocalUser](../../PartyManager/methods/partymanager_createlocaluser.md)  
[PartyManager::CreateLocalUserWithEntityType](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md)  
[PartyManager::CreateNewNetwork](../../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::AuthenticateLocalUser](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)
  
  
