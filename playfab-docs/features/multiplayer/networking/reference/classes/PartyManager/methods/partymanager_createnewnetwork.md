---
author: jdeweyMSFT
title: "PartyManager::CreateNewNetwork"
description: Queues an asynchronous attempt to create a new network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 04/07/2021
---

# PartyManager::CreateNewNetwork  

Queues an asynchronous attempt to create a new network.  

## Syntax  
  
```cpp
PartyError CreateNewNetwork(  
    const PartyLocalUser* localUser,  
    const PartyNetworkConfiguration* networkConfiguration,  
    uint32_t regionCount,  
    const PartyRegion* regions,  
    const PartyInvitationConfiguration* initialInvitationConfiguration,  
    void* asyncIdentifier,  
    PartyNetworkDescriptor* networkDescriptor,  
    char* appliedInitialInvitationIdentifier  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user to which the network creation and relay allocation is attributed.  
  
**`networkConfiguration`** &nbsp; [PartyNetworkConfiguration*](../../../structs/partynetworkconfiguration.md)  
  
Network configuration properties such as max user count and max device count. These properties last for the lifetime of the network and cannot be changed.  
  
**`regionCount`** &nbsp; uint32_t  
  
The number of regions provided in the array of preferred regions specified via `regions`. If this is zero, the library will use all regions in which the title is configured, ordered by lowest latency.  
  
**`regions`** &nbsp; [PartyRegion*](../../../structs/partyregion.md)  
  
The array of preferred regions in which the network should be created. The network will be created in the first available region.  
  
**`initialInvitationConfiguration`** &nbsp; [PartyInvitationConfiguration*](../../../structs/partyinvitationconfiguration.md)  
*optional*  
  
An optionally specified configuration for the initial invitation. <br /><br /> If this value is null, then default configuration values will be used. By default, PlayFab Party will generate a unique invitation identifier for the title, the revocability will be [PartyInvitationRevocability::Anyone](../../../enums/partyinvitationrevocability.md), and the PlayFab Entity ID list will be empty, allowing any user to join using the invitation.   <br /><br /> If a configuration is provided, the title may optionally specify the identifier on the configuration. If the identifier is nullptr or an empty string, the PlayFab Party library will generate an identifier for the title. It is guaranteed that this generated identifier will be different from all identifiers that the PlayFab Party library will generate for all future invitations on this network across all devices. Titles may specify their own identifier by providing a non-null, non-empty value in the configuration. If the title specifies the identifier, it is the title's responsibility to ensure that this identifier does not collide with the identifiers of future invitations created on this network via [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) on any device.   <br /><br /> If a configuration is provided, its revocability must be PartyInvitationRevocability::Anyone.   <br /><br /> If a configuration is provided and the list of PlayFab Entity IDs is empty, all users will be allowed to join using the new invitation.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
*optional output*  
  
The optional, output network descriptor that can be used to immediately queue a connection of the local device to the newly created network via [ConnectToNetwork()](partymanager_connecttonetwork.md).  
  
**`appliedInitialInvitationIdentifier`** &nbsp; char*  
*optional output string buffer of size `c_maxInvitationIdentifierStringLength+1`*  
  
The optional, output buffer to which the initial invitation's identifier is written. If `initialInvitationConfiguration` has been provided with a non-null, non-empty identifier, then this buffer will be filled with the same identifier. If an initial configuration was not provided or the provided configuration had an empty or null identifier, the PlayFab Party library will generate one and return it to the title in this buffer.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to create a new network began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
A PartyNetwork is a set of devices, such as Xbox One consoles and PCs, that are connected via a client-server topology to a transparent cloud relay server. Each device in the network contains a collection of endpoints associated with the network; directed messages can be sent from an endpoint on the local device to any set of endpoints, or broadcast to all endpoints. This method queues an attempt to allocate a relay, thus creating a new network, on behalf of the user represented by `localUser` but does not connect the local device to the network. <br /><br /> If no devices connect to the network within ten minutes of the relay's creation, it will shut down. The network will stay active indefinitely while at least one device is connected, migrating to a new relay if required. If no devices are connected to the network, the relay will become inactive and shut down after one minute of inactivity.   <br /><br /> The local device can queue an attempt to connect to the new network by immediately passing `networkDescriptor` to [ConnectToNetwork()](partymanager_connecttonetwork.md). Using this descriptor with SerializeNetworkDescriptor() will result in failure because the descriptor does not contain enough information for a remote device to connect to the network. The network descriptor changes and becomes serializable when the [PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md) is provided and indicates success. The updated network descriptor is provided as a field in the PartyCreateNewNetworkCompletedStateChange. Once connected to the network, the descriptor can be retrieved using [PartyNetwork::GetNetworkDescriptor()](../../PartyNetwork/methods/partynetwork_getnetworkdescriptor.md).   <br /><br /> The network is created in the first available region using the order specified in `regions`. If none of the specified regions are available, the network will not be created. Specifying 0 for `regionCount` defaults to using all regions in which the title is configured, ordered by lowest latency.   <br /><br /> The initial invitation for the newly created network will not be owned by any user. Therefore calling [PartyInvitation::GetCreatorEntityId()](../../PartyInvitation/methods/partyinvitation_getcreatorentityid.md) will return nullptr for the initial invitation. As well, the initial invitation for the newly created network will persist for the lifetime of the network until specifically revoked via [PartyNetwork::RevokeInvitation()](../../PartyNetwork/methods/partynetwork_revokeinvitation.md). New invitations can be created for the network via [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) by local users that are authenticated into the network, and those invitations will persist until their creating local users are removed from the network. Users join the network via [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md) by providing the identifier of an invitation that was successfully created, has not been revoked, and allows them to join.   

### Retrying on failure

 When CreateNewNetwork() fails asynchronously, a PartyCreateNewNetworkCompletedStateChange is provided by [StartProcessingStateChanges](partymanager_startprocessingstatechanges.md) indicating the result. The operation may be retried after a delay, depending on the [PartyStateChangeResult](../../../enums/partystatechangeresult.md) provided.   <br /><br />

| Result | Retry behavior |
| --- | --- |
| InternetConnectivityError | Retry with a small delay of no less than 10 seconds. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| PartyServiceError | Retry with an exponential backoff. Start with a minimum delay of no less than 10 seconds, doubling the delay with each retry. |
| NoServersAvailable | Retry with an exponential backoff. Start with a minimum delay of no less than 30 seconds, doubling the delay with each retry. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| UserNotAuthorized | This result can mean that the user's entity token was invalid, expired, or that the user was not authorized for other reasons. Retry no more than one time, and only after getting a new entity token for the user and calling [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).|
| UserCreateNetworkThrottled | Do not retry automatically. Instead, display a message to the user and wait for the user to initiate another attempt. |
| FailedToBindToLocalUdpSocket | This result means that the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option to a valid, available bind address, and re-initialize the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md)  
[PartyManager::ConnectToNetwork](partymanager_connecttonetwork.md)  
[PartyNetwork::AuthenticateLocalUser](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyNetwork::LeaveNetwork](../../PartyNetwork/methods/partynetwork_leavenetwork.md)  
[PartyNetwork::RevokeInvitation](../../PartyNetwork/methods/partynetwork_revokeinvitation.md)  
[PartyNetwork::CreateInvitation](../../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyInvitation](../../PartyInvitation/partyinvitation.md)  
[PartyInvitationConfiguration](../../../structs/partyinvitationconfiguration.md)
  
  
