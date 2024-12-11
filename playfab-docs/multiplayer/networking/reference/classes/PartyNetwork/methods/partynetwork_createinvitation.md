---
author: jdeweyMSFT
title: "PartyNetwork::CreateInvitation"
description: Queues an asynchronous attempt to create an invitation for the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyNetwork::CreateInvitation  

Queues an asynchronous attempt to create an invitation for the network.  

## Syntax  
  
```cpp
PartyError CreateInvitation(  
    const PartyLocalUser* localUser,  
    const PartyInvitationConfiguration* invitationConfiguration,  
    void* asyncIdentifier,  
    PartyInvitation** invitation  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user that owns the invitation in the network. If this local user leaves the network for any reason the invitation will be automatically revoked.  
  
**`invitationConfiguration`** &nbsp; [PartyInvitationConfiguration*](../../../structs/partyinvitationconfiguration.md)  
*optional*  
  
An optionally specified configuration for the newly created invitation. <br /><br /> If this value is null, the default configuration values will be used. By default, PlayFab Party will generate a unique invitation identifier for the title, the revocability will be [PartyInvitationRevocability::Creator](../../../enums/partyinvitationrevocability.md), and the PlayFab Entity ID list will be empty, allowing any user to join using the invitation.   <br /><br /> If a configuration is provided, the title may optionally specify the identifier on the configuration. If the identifier is nullptr or an empty string, the PlayFab Party library will generate an identifier for the title. It is guaranteed that this generated identifier will be different from all identifiers that the PlayFab Party library has already generated for invitations on this network across all devices. Titles may specify their own identifier by providing a non-null, non-empty value in the configuration. If the title specifies the identifier, it is the title's responsibility to ensure that this identifier does not collide with the identifiers of other invitations created on this network via [PartyManager::CreateNewNetwork()](../../PartyManager/methods/partymanager_createnewnetwork.md) or CreateInvitation() on any device. If the title attempts to create an invitation with an identifier that would collide with a pre-existing invitation, then the operation will fail asynchronously and the title will receive a PartyInvitationDestroyedStateChange followed by a [PartyCreateInvitationCompletedStateChange](../../../structs/partycreateinvitationcompletedstatechange.md) with a failure result.   <br /><br /> If a configuration is provided, its revocability must be PartyInvitationRevocability::Creator.   <br /><br /> If a configuration is provided and the list of PlayFab Entity IDs is empty, all users will be allowed to join using the new invitation.  
  
**`asyncIdentifier`** &nbsp; void*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`invitation`** &nbsp; [PartyInvitation**](../../PartyInvitation/partyinvitation.md)  
*optional, library-allocated output*  
  
The optional, output invitation that may immediately be used to queue user authentications on a network via [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to create an invitation began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
To join a network, a user must provide an invitation to [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md). <br /><br /> This method queues an asynchronous attempt to create an invitation for the network. A [PartyCreateInvitationCompletedStateChange](../../../structs/partycreateinvitationcompletedstatechange.md) will be provided upon completion of the asynchronous operation, indicating success or failure. On success, a [PartyInvitationCreatedStateChange](../../../structs/partyinvitationcreatedstatechange.md) will have been generated beforehand to indicate that the transparent cloud relay server is ready to accept authentications using the invitation's identifier. On failure, a [PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md) will have been generated beforehand to indicate that the invitation object is no longer valid and will no longer be queryable via [GetInvitations()](partynetwork_getinvitations.md).   <br /><br /> The lifetime of the invitation is tied to the owning local user's membership in the network, therefore `localUser` must be authenticated or in the process of authenticating. If `localUser` leaves the network for any reason the invitation will be automatically revoked and subsequent attempts to use that invitation's identifier to join the network will fail until a new invitation is created using that identifier.   <br /><br /> Invitations created with this method will only be queryable via GetInvitations() on the local device where the invitation was created.   <br /><br /> On successful return, this method invalidates the memory for any array previously returned by GetInvitations(), as it synchronously adds the new invitation to the array. [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) also invalidates the memory for the array. The returned `invitation` object will be valid until a PartyInvitationDestroyedStateChange has been generated and all state changes referencing the object have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyInvitationRevocability](../../../enums/partyinvitationrevocability.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)  
[PartyInvitationCreatedStateChange](../../../structs/partyinvitationcreatedstatechange.md)  
[PartyCreateInvitationCompletedStateChange](../../../structs/partycreateinvitationcompletedstatechange.md)  
[PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md)  
[PartyManager::CreateNewNetwork](../../PartyManager/methods/partymanager_createnewnetwork.md)
  
  
