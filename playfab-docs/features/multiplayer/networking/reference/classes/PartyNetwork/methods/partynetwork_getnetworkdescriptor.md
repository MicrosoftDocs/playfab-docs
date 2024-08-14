---
author: jdeweyMSFT
title: "PartyNetwork::GetNetworkDescriptor"
description: Gets the network descriptor for this network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetNetworkDescriptor  

Gets the network descriptor for this network.  

## Syntax  
  
```cpp
PartyError GetNetworkDescriptor(  
    PartyNetworkDescriptor* networkDescriptor  
)  
```  
  
### Parameters  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
*output*  
  
The output network descriptor.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
A network descriptor contains all the information required for a device to connect to the network to which the descriptor is associated. [PartyManager::SerializeNetworkDescriptor()](../../PartyManager/methods/partymanager_serializenetworkdescriptor.md) can be used to get the serialized form of the descriptor, which is safe to exchange over title and platform-specific communication channels. However, the network descriptor provided by this call is not serializable until the asynchronous creation operation associated with this network successfully completes, signaled by a [PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md) with a success result code. <br /><br /> PartyNetworkDescriptors work in tandem with PartyInvitations to facilitate inviting remote users to join the network. First, obtain the network descriptor via GetNetworkDescriptor() and serialize it via PartyManager::SerializeNetworkDescriptor(). Next, create an invitation via [CreateInvitation()](partynetwork_createinvitation.md) or query for a preexisting invitation via [GetInvitations()](partynetwork_getinvitations.md) and obtain the invitation's identifier from its configuration via [PartyInvitation::GetInvitationConfiguration()](../../PartyInvitation/methods/partyinvitation_getinvitationconfiguration.md). Last, include both the serialized network descriptor and the invitation identifier in the payload of the platform-specific invite mechanism. When the remote user receives the invite, they deserialize the network descriptor from the platform-invite payload via [PartyManager::DeserializeNetworkDescriptor()](../../PartyManager/methods/partymanager_deserializenetworkdescriptor.md) and pass the deserialized descriptor to [PartyManager::ConnectToNetwork()](../../PartyManager/methods/partymanager_connecttonetwork.md). After connecting, the remote user joins by authenticating into the network via [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md) with the invitation identifier in the platform-invite payload.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md)  
[PartyManager::CreateNewNetwork](../../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyManager::SerializeNetworkDescriptor](../../PartyManager/methods/partymanager_serializenetworkdescriptor.md)  
[PartyManager::DeserializeNetworkDescriptor](../../PartyManager/methods/partymanager_deserializenetworkdescriptor.md)  
[PartyManager::ConnectToNetwork](../../PartyManager/methods/partymanager_connecttonetwork.md)  
[PartyInvitation](../../PartyInvitation/partyinvitation.md)  
[PartyNetwork::CreateInvitation](partynetwork_createinvitation.md)  
[PartyNetwork::GetInvitations](partynetwork_getinvitations.md)  
[PartyInvitation::GetInvitationConfiguration](../../PartyInvitation/methods/partyinvitation_getinvitationconfiguration.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)
  
  
