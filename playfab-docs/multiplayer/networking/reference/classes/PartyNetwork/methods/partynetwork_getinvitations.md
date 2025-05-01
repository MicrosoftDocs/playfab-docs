---
author: jdeweyMSFT
title: "PartyNetwork::GetInvitations"
description: Gets an array containing all invitations exposed to the local device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetInvitations  

Gets an array containing all invitations exposed to the local device.  

## Syntax  
  
```cpp
PartyError GetInvitations(  
    uint32_t* invitationCount,  
    PartyInvitationArray* invitations  
)  
```  
  
### Parameters  
  
**`invitationCount`** &nbsp; uint32_t*  
*output*  
  
An output value indicating the number of invitations provided in `invitations`.  
  
**`invitations`** &nbsp; [PartyInvitationArray*](../../../typedefs.md)  
*library-allocated output array of size `*invitationCount`*  
  
A library-allocated output array containing the invitations that have been created for the network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to either [CreateInvitation()](partynetwork_createinvitation.md) or [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md). <br /><br /> A new invitation is exposed to the local device whenever the local device calls CreateInvitation() or a [PartyInvitationCreatedStateChange](../../../structs/partyinvitationcreatedstatechange.md) is provided via PartyManager::StartProcessingStateChanges().   <br /><br /> Invitations created via CreateInvitation() will only be exposed to the local device. The initial invitation will be exposed to all devices in the network via a PartyInvitationCreatedStateChange.   <br /><br /> Once a [PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md) has been provided by PartyManager::StartProcessingStateChanges(), the invitation will no longer be present in the array returned by this method.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyManager::CreateNewNetwork](../../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::CreateInvitation](partynetwork_createinvitation.md)  
[PartyNetwork::RevokeInvitation](partynetwork_revokeinvitation.md)  
[PartyInvitationCreatedStateChange](../../../structs/partyinvitationcreatedstatechange.md)  
[PartyInvitationDestroyedStateChange](../../../structs/partyinvitationdestroyedstatechange.md)
  
  
