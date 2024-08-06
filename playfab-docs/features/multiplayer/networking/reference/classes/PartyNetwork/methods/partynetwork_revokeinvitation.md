---
author: jdeweyMSFT
title: "PartyNetwork::RevokeInvitation"
description: Queues an asynchronous attempt to revoke an invitation from the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::RevokeInvitation  

Queues an asynchronous attempt to revoke an invitation from the network.  

## Syntax  
  
```cpp
PartyError RevokeInvitation(  
    const PartyLocalUser* localUser,  
    PartyInvitation* invitation,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user attempting to revoke the invitation.  
  
**`invitation`** &nbsp; [PartyInvitation*](../../PartyInvitation/partyinvitation.md)  
  
The invitation to revoke.  
  
**`asyncIdentifier`** &nbsp; void*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to revoke the invitation began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Titles may revoke an invitation to prevent further users from authenticating into a network using the invitation's identifier. <br /><br /> This method queues an asynchronous attempt to revoke an invitation from the network. A [PartyRevokeInvitationCompletedStateChange](../../../structs/partyrevokeinvitationcompletedstatechange.md) will be provided upon completion of the asynchronous operation, indicating success or failure. On success, a [PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md) will have been generated beforehand with [PartyDestroyedReason::Requested](../../../enums/partydestroyedreason.md), to indicate that the network will no longer accept authentications using the invitation's identifier until a new invitation is created with that same identifier. It also indicates that the invitation will no longer be queryable via [GetInvitations()](partynetwork_getinvitations.md).   <br /><br /> This operation will only succeed if the invitation was created with its revocability specified such that the `localUser` on the local device may revoke the invitation. This might not be the case if the revocability is set to [PartyInvitationRevocability::Creator](../../../enums/partyinvitationrevocability.md) and the `localUser` is authenticated on a different device than the creator or if the `localUser` refers to a different user than the creator.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyRevokeInvitationCompletedStateChange](../../../structs/partyrevokeinvitationcompletedstatechange.md)  
[PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md)
  
  
