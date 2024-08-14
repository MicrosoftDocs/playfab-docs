---
author: jdeweyMSFT
title: "PartyManager::CreateLocalUser"
description: Creates a local user object that is used to represent a local player when performing networking and chat operations.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::CreateLocalUser  

Creates a local user object that is used to represent a local player when performing networking and chat operations.  

## Syntax  
  
```cpp
PartyError CreateLocalUser(  
    PartyString entityId,  
    PartyString titlePlayerEntityToken,  
    PartyLocalUser** localUser  
)  
```  
  
### Parameters  
  
**`entityId`** &nbsp; [PartyString](../../../typedefs.md)  
  
The PlayFab Entity ID to associate with the local user.  
  
**`titlePlayerEntityToken`** &nbsp; [PartyString](../../../typedefs.md)  
  
The PlayFab Entity Token to associate with the local user.  
  
**`localUser`** &nbsp; [PartyLocalUser**](../../PartyLocalUser/partylocaluser.md)  
*library-allocated output*  
  
The output local user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if creating the local user succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method takes a PlayFab Entity ID as `entityId` and a PlayFab Entity Token as `titlePlayerEntityToken`. No synchronous validation is performed on these values except that the length of `entityId` is less than or equal to ```c_maxEntityIdStringLength```. When the library performs operations that require user authentication or authorization, such as creating a network, authenticating into a network, or performing speech-to-text transcription, the Party service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail. <br /><br /> A PlayFab Entity ID and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method. The PlayFab Entity ID must be of type `title_player_account`, which, for most developers, represents the "player" in the most traditional way. To create users representing other supported types of entities, use [CreateLocalUserWithEntityType()](partymanager_createlocaluserwithentitytype.md) instead.   <br /><br /> The provided `entityId` and `titlePlayerEntityToken` must have been acquired using the same Title ID that was passed to [Initialize()](partymanager_initialize.md).   <br /><br /> The Party library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as [CreateNewNetwork()](partymanager_createnewnetwork.md) or [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md). If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Party library via a call to [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).   <br /><br /> The caller is responsible for monitoring the expiration of the entity token provided to this method and PartyLocalUser::UpdateEntityToken(). When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Party library by calling PartyLocalUser::UpdateEntityToken(). We recommend acquiring a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.   <br /><br /> Only ```c_maxLocalUsersPerDeviceCount``` PartyLocalUser objects may exist simultaneously at any given time. This method will synchronously fail if creating another local user would exceed that limit.   <br /><br /> On successful return, this method invalidates the memory for any array previously returned by [GetLocalUsers()](partymanager_getlocalusers.md), as it synchronously adds the new user to the array. [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) also invalidates the memory for the array. The returned `localUser` object will be valid until a [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) has been generated and all state changes referencing the object have been returned to [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md)  
[PartyManager::Initialize](partymanager_initialize.md)  
[PartyManager::GetLocalUsers](partymanager_getlocalusers.md)  
[PartyManager::CreateLocalUserWithEntityType](partymanager_createlocaluserwithentitytype.md)  
[PartyManager::DestroyLocalUser](partymanager_destroylocaluser.md)  
[PartyManager::CreateNewNetwork](partymanager_createnewnetwork.md)  
[PartyNetwork::AuthenticateLocalUser](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](../../PartyNetwork/methods/partynetwork_removelocaluser.md)  
[PartyNetwork::CreateInvitation](../../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyNetwork::RevokeInvitation](../../PartyNetwork/methods/partynetwork_revokeinvitation.md)  
[PartyNetwork::CreateEndpoint](../../PartyNetwork/methods/partynetwork_createendpoint.md)  
[PartyLocalUser::UpdateEntityToken](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md)  
[PartyLocalDevice::CreateChatControl](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)
  
  
