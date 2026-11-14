---
author: jdeweyMSFT
title: "PartyManager::CreateLocalUser"
description: "Creates a Party local user from a PlayFab entity handle (PlayFab Unified SDK v2) or a PlayFab entity ID and entity token (standalone Party SDK v1)."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyManager::CreateLocalUser  

Creates a local user object that is used to represent a local player when performing networking and chat operations.  

## Syntax  

The Party library in the PlayFab Unified SDK (v2), including the version in the XBOX Game Development Kit (GDK), declares this method as follows.

```cpp
PartyError CreateLocalUser(
    PFEntityHandle entityHandle,
    PartyLocalUser** localUser
)
```

The standalone Party SDK (v1) declares this method as follows.

```cpp
PartyError CreateLocalUser(
    PartyString entityId,
    PartyString titlePlayerEntityToken,
    PartyLocalUser** localUser
)
```
  
### Parameters  
  
**`entityHandle`** [PFEntityHandle](../../../../../../api-references/c/pfentity/pfentity_members.md)  
*PlayFab Unified SDK (v2) only*  
  
The PlayFab entity handle to associate with the local user.  
  
**`entityId`** [PartyString](../../../typedefs.md)  
*Standalone Party SDK (v1) only*  
  
The PlayFab Entity ID to associate with the local user.  
  
**`titlePlayerEntityToken`** [PartyString](../../../typedefs.md)  
*Standalone Party SDK (v1) only*  
  
The PlayFab Entity Token to associate with the local user.  
  
**`localUser`** [PartyLocalUser**](../../PartyLocalUser/partylocaluser.md)  
*library-allocated output*  
  
The output local user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if creating the local user succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
In the PlayFab Unified SDK (v2), this method takes a PlayFab entity handle as `entityHandle`. You can get an entity handle from the result of a PlayFab Core SDK login operation. When the library performs operations that require user authentication or authorization, such as creating a network, authenticating into a network, or performing speech-to-text transcription, the Party service validates that the token associated with `entityHandle` is valid, isn't expired, and is authorized to perform the operation. If these conditions aren't met, the operation fails.

The provided `entityHandle` must have been acquired using the same Title ID that was passed to [Initialize()](partymanager_initialize.md).

The Party library obtains entity tokens for the user from the PlayFab Core SDK when it authenticates the user for the Party service, so you don't provide tokens to the Party library or call [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md) for this user. If the PlayFab Core SDK can't refresh an entity token automatically, it raises an entity token expired event so that your game can reauthenticate the player. To receive these events, call [PFEntityRegisterTokenExpiredEventHandler](../../../../../../api-references/c/pfentity/functions/pfentityregistertokenexpiredeventhandler.md).

In the PlayFab Unified SDK (v2), this method synchronously fails in the following cases:

- The Party library isn't initialized.
- Creating another local user would exceed the local user limit (```c_maxLocalUsersPerDeviceCount```).
- `entityHandle` is null or closed. The method returns the HRESULT from [PFEntityDuplicateHandle](../../../../../../api-references/c/pfentity/functions/pfentityduplicatehandle.md), such as `E_INVALIDARG` or `E_PF_INVALIDHANDLE`, instead of a Party error code.
- The entity key of `entityHandle` can't be read, has an empty ID, or has an entity type that the Party library doesn't support.
- The entity token of `entityHandle` can't be read right away, for example because it expired.

Keep `entityHandle` open until [DestroyLocalUser()](partymanager_destroylocaluser.md) completes, which a [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) signals.

Only ```c_maxLocalUsersPerDeviceCount``` PartyLocalUser objects may exist simultaneously at any given time. This method will synchronously fail if creating another local user would exceed that limit.

On successful return, this method invalidates the memory for any array previously returned by [GetLocalUsers()](partymanager_getlocalusers.md), as it synchronously adds the new user to the array. [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) also invalidates the memory for the array. The returned `localUser` object will be valid until a [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) has been generated and all state changes referencing the object have been returned to [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).

### Standalone Party SDK (v1)

This method takes a PlayFab Entity ID as `entityId` and a PlayFab Entity Token as `titlePlayerEntityToken`. No synchronous validation is performed on these values except that the length of `entityId` is less than or equal to ```c_maxEntityIdStringLength```. When the library performs operations that require user authentication or authorization, such as creating a network, authenticating into a network, or performing speech-to-text transcription, the Party service will validate that the token is valid, is not expired, is associated with the Entity ID provided, and is authorized to perform the operation. If these conditions aren't met, the operation will fail.

A PlayFab Entity ID and Entity Token can be obtained from the output of a PlayFab login operation and then provided as input to this method. The PlayFab Entity ID must be of type `title_player_account`, which, for most developers, represents the "player" in the most traditional way. To create users representing other supported types of entities, use [CreateLocalUserWithEntityType()](partymanager_createlocaluserwithentitytype.md) instead.

The provided `entityId` and `titlePlayerEntityToken` must have been acquired using the same Title ID that was passed to [Initialize()](partymanager_initialize.md).

The Party library makes a copy of the supplied PlayFab Entity Token for use in subsequent operations that require authentication or authorization of the local user, such as [CreateNewNetwork()](partymanager_createnewnetwork.md) or [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md). If the token provided to this call is expired or otherwise invalid, operations that require a valid token will fail. A new, valid token can be provided to the Party library via a call to [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).

The caller is responsible for monitoring the expiration of the entity token provided to this method and PartyLocalUser::UpdateEntityToken(). When the token is nearing or past the expiration time a new token should be obtained by performing a PlayFab login operation and provided to the Party library by calling PartyLocalUser::UpdateEntityToken(). We recommend acquiring a new token when the previously supplied token is halfway through its validity period. On platforms that may enter a low power state or otherwise cause the application to pause execution for a long time, preventing the token from being refreshed before it expires, the token should be checked for expiration once execution resumes.

The local user limit, array invalidation, and object lifetime rules described earlier also apply to the standalone Party SDK (v1).
  
## Requirements  
  
**Header:** Party.h  
  
**Library:** Party.lib  
  
**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
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
[PFEntityRegisterTokenExpiredEventHandler](../../../../../../api-references/c/pfentity/functions/pfentityregistertokenexpiredeventhandler.md)  
[Quickstart (Windows) - Party and Multiplayer](../../../../../../sdks/unified-sdk/quickstart-windows-party.md)
  
  
