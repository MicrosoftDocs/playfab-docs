---
author: jdeweyMSFT
title: "PartyNetwork"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyNetwork  

Represents a network.  

## Syntax  
  
```cpp  
class PartyNetwork  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [AuthenticateLocalUser](methods/partynetwork_authenticatelocaluser.md) | Queues an asynchronous operation to authenticate the specified local user into the network. |  
| [RemoveLocalUser](methods/partynetwork_removelocaluser.md) | Queues an asynchronous operation to remove a local user from the network. |  
| [CreateInvitation](methods/partynetwork_createinvitation.md) | Queues an asynchronous attempt to create an invitation for the network. |  
| [RevokeInvitation](methods/partynetwork_revokeinvitation.md) | Queues an asynchronous attempt to revoke an invitation from the network. |  
| [GetInvitations](methods/partynetwork_getinvitations.md) | Gets an array containing all invitations exposed to the local device. |  
| [CreateEndpoint](methods/partynetwork_createendpoint.md) | Queues an asynchronous attempt to create a local endpoint. |  
| [DestroyEndpoint](methods/partynetwork_destroyendpoint.md) | Queues an asynchronous operation to destroy a local endpoint. |  
| [LeaveNetwork](methods/partynetwork_leavenetwork.md) | Queues an asynchronous operation to leave the network gracefully. |  
| [GetEndpoints](methods/partynetwork_getendpoints.md) | Gets the endpoints in this network. |  
| [FindEndpointByUniqueIdentifier](methods/partynetwork_findendpointbyuniqueidentifier.md) | Finds the endpoint with the corresponding network-unique identifier in this network, if it exists. |  
| [GetDevices](methods/partynetwork_getdevices.md) | Gets the devices in this network. |  
| [GetLocalUsers](methods/partynetwork_getlocalusers.md) | Gets an array containing the local users that are authenticated or authenticating into the network. |  
| [GetNetworkDescriptor](methods/partynetwork_getnetworkdescriptor.md) | Gets the network descriptor for this network. |  
| [GetNetworkConfiguration](methods/partynetwork_getnetworkconfiguration.md) | Gets the network configuration which was set when creating the network. |  
| [ConnectChatControl](methods/partynetwork_connectchatcontrol.md) | Connects the local chat control to the network. |  
| [DisconnectChatControl](methods/partynetwork_disconnectchatcontrol.md) | Disconnects the local chat control from the network. |  
| [GetChatControls](methods/partynetwork_getchatcontrols.md) | Gets the chat controls connected to this network. |  
| [GetNetworkStatistics](methods/partynetwork_getnetworkstatistics.md) | Gets one or more statistic counter values for the network. |  
| [GetCustomContext](methods/partynetwork_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this network object. |  
| [SetCustomContext](methods/partynetwork_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this network object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  

  
  
  
