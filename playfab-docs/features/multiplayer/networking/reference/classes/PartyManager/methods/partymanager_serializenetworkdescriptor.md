---
author: jdeweyMSFT
title: "PartyManager::SerializeNetworkDescriptor"
description: Serializes a network descriptor structure into an opaque string that is safe to communicate over title and platform-specific communication channels.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyManager::SerializeNetworkDescriptor  

Serializes a network descriptor structure into an opaque string that is safe to communicate over title and platform-specific communication channels.  

## Syntax  
  
```cpp
PartyError SerializeNetworkDescriptor(  
    const PartyNetworkDescriptor* networkDescriptor,  
    char* serializedNetworkDescriptorString  
)  
```  
  
### Parameters  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
  
The network descriptor to serialize.  
  
**`serializedNetworkDescriptorString`** &nbsp; char*  
*output string buffer of size `c_maxSerializedNetworkDescriptorStringLength+1`*  
  
The output buffer to which the serialized network descriptor string is written. The serialized network descriptor string will never contain non-ASCII, control, or other characters that would require JSON or XML escaping.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the descriptor is serializable and was successfully serialized, or an error code otherwise.
  
## Remarks  
  
A network descriptor contains all the information required for a device to connect to the network to which the descriptor is associated. `serializedNetworkDescriptorString` is the serialized form of the descriptor specified by `networkDescriptor` and is safe to communicate over title and platform-specific communication channels. The string may be up to ```c_maxSerializedNetworkDescriptorStringLength``` characters long, not including the null terminator, and will never contain non-ASCII, control, or other characters that would require JSON or XML escaping. <br /><br /> This method will fail if the network descriptor is not serializable. For example, the descriptor provided synchronously by a call to [CreateNewNetwork()](partymanager_createnewnetwork.md) is not serializable because it does not contain enough information for a remote client to connect to the new network. The network descriptor changes and becomes serializable when the [PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md) is provided and indicates success. The updated network descriptor is provided as a field in the PartyCreateNewNetworkCompletedStateChange. Once connected to the network, the descriptor can be retrieved using [PartyNetwork::GetNetworkDescriptor()](../../PartyNetwork/methods/partynetwork_getnetworkdescriptor.md).   <br /><br /> PartyNetworkDescriptors work in tandem with PartyInvitations to facilitate inviting remote users to join the network. First, obtain the network descriptor via PartyNetwork::GetNetworkDescriptor() and serialize it via SerializeNetworkDescriptor(). Next, create an invitation via [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) or query for a preexisting invitation via [PartyNetwork::GetInvitations()](../../PartyNetwork/methods/partynetwork_getinvitations.md) and obtain the invitation's identifier from its configuration via [PartyInvitation::GetInvitationConfiguration()](../../PartyInvitation/methods/partyinvitation_getinvitationconfiguration.md). Last, include both the serialized network descriptor and the invitation identifier in the payload of the platform-specific invite mechanism. When the remote user receives the invite, they deserialize the network descriptor from the platform-invite payload via [DeserializeNetworkDescriptor()](partymanager_deserializenetworkdescriptor.md) and pass the deserialized descriptor to [ConnectToNetwork()](partymanager_connecttonetwork.md). After connecting, the remote user joins by authenticating into the network via [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md) with the invitation identifier in the platform-invite payload.   <br /><br /> This method can be called prior to the [Initialize()](partymanager_initialize.md) method.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::DeserializeNetworkDescriptor](partymanager_deserializenetworkdescriptor.md)  
[PartyNetwork::GetNetworkDescriptor](../../PartyNetwork/methods/partynetwork_getnetworkdescriptor.md)  
[PartyManager::ConnectToNetwork](partymanager_connecttonetwork.md)  
[PartyInvitation](../../PartyInvitation/partyinvitation.md)  
[PartyNetwork::CreateInvitation](../../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyNetwork::GetInvitations](../../PartyNetwork/methods/partynetwork_getinvitations.md)  
[PartyInvitation::GetInvitationConfiguration](../../PartyInvitation/methods/partyinvitation_getinvitationconfiguration.md)  
[PartyNetwork::AuthenticateLocalUser](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)
  
  
