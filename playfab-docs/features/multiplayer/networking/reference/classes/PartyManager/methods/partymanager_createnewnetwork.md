---
author: jdeweyMSFT
title: "PartyManager::CreateNewNetwork"
description: Queues an asynchronous attempt to create a new network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
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
  
Network configuration properties such as max user count and max device count. These properties last for the lifetime of the network and can't be changed.  
  
**`regionCount`** &nbsp; uint32_t  
  
The number of regions provided in the array of preferred regions specified via `regions`. If this is zero, the library uses all regions in which the title is configured, ordered by lowest round trip latency from this device.  
  
**`regions`** &nbsp; [PartyRegion*](../../../structs/partyregion.md)  
  
The array of preferred regions in which the network should be created. The network is created in the first available region.  
  
**`initialInvitationConfiguration`** &nbsp; [PartyInvitationConfiguration*](../../../structs/partyinvitationconfiguration.md)  
*optional*  
  
An optionally specified configuration for the initial invitation. <br /><br /> If this value is null, then default configuration values are used. By default, PlayFab Party generates a unique invitation identifier for the title, the revocability is [PartyInvitationRevocability::Anyone](../../../enums/partyinvitationrevocability.md), and the PlayFab Entity ID list is empty, allowing any user to join using the invitation.   <br /><br /> If a configuration is provided, the title may optionally specify the identifier on the configuration. If the identifier is nullptr or an empty string, the PlayFab Party library generates an identifier for the title that's guaranteed to be different from all identifiers that the PlayFab Party library will generate for all future invitations on this network across all devices. Titles may specify their own identifier by providing a non-null, nonempty value in the configuration. If the title specifies the identifier, it's the title's responsibility to ensure that this identifier doesn't collide with the identifiers of future invitations created on this network via [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) on any device.   <br /><br /> If a configuration is provided, its revocability must be PartyInvitationRevocability::Anyone.   <br /><br /> If a configuration is provided and the list of PlayFab Entity IDs is empty, all users are allowed to join using the new invitation.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
*optional output*  
  
The optional, output network descriptor that can be used to immediately queue a connection of the local device to the newly created network via [ConnectToNetwork()](partymanager_connecttonetwork.md).  
  
**`appliedInitialInvitationIdentifier`** &nbsp; char*  
*optional output string buffer of size `c_maxInvitationIdentifierStringLength+1`*  
  
The optional, output buffer to which the initial invitation's identifier is written. If `initialInvitationConfiguration` is provided with a non-null, nonempty identifier, then this buffer will be filled with the same identifier. If an initial configuration isn't provided or the provided configuration has an empty or null identifier, the PlayFab Party library generates one and returns it to the title in this buffer.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to create a new network began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
A PartyNetwork is a set of devices that are connected via a client-server topology to a transparent cloud relay server. Each device in the network contains a collection of endpoints associated with the network; directed messages can be sent from an endpoint on the local device to any set of endpoints, or broadcast to all endpoints. This method queues an attempt to allocate a relay, thus creating a new network, on behalf of the user represented by `localUser` but does not connect the local device to the network. <br /><br /> If no devices connect to the network within 10 minutes of the relay's creation, it will shut down. The network stays active indefinitely while at least one device is connected, migrating to a new relay if required. If no devices are connected to the network, the relay becomes inactive and shuts down after 1 minute of inactivity.   <br /><br /> The local device can queue an attempt to connect to the new network by immediately passing `networkDescriptor` to [ConnectToNetwork()](partymanager_connecttonetwork.md). Using this descriptor with SerializeNetworkDescriptor() fails because the descriptor doesn't contain enough information for a remote device to connect to the network. The network descriptor changes and becomes serializable when the [PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md) is provided and indicates success. The updated network descriptor is provided as a field in the PartyCreateNewNetworkCompletedStateChange. The descriptor can also be retrieved after connecting to the network using [PartyNetwork::GetNetworkDescriptor()](../../PartyNetwork/methods/partynetwork_getnetworkdescriptor.md).   <br /><br /> The network is created in the first available region using the order specified in `regions`. If none of the specified regions are available, the network will not be created. Specifying 0 for `regionCount` defaults to using all regions in which the title is configured, ordered by lowest latency to this device, which is the same array returned by GetRegions().   <br /><br /> The default region selection only includes latency measurements from this device and not from any other devices. Titles that have a set of participants for the session known up front should gather measurements from all devices prior to creating the network and construct a new `regions` array ordered by lowest aggregate latency for the whole group.   <br /><br /> For titles that support join-in-progress, the region with the best overall latency for the group of connected participants may change as devices join and leave. Titles should take advantage of Party's support for being connected to multiple networks simultaneously to migrate devices seamlessly to a network created in a region with better aggregate latency for the group. The title can gather region latency measurements via messages over the original Party network or information uploaded to an external roster service, create a new Party network in a region with lower aggregate latency, and instruct all devices to connect to the more favorable network and disconnect from the original one.   <br /><br /> If the [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../../../enums/partyregionupdatemode.md), then retrieving the set of available regions and measuring connection quality to them may not have started yet, or the last update may have exceeded the configured refresh interval age. Specifying 0 for `regionCount` to CreateNewNetwork() ensures any deferred region update has started and its associated [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided prior to this call's [PartyCreateNewNetworkCompletedStateChange](../../../structs/partycreatenewnetworkcompletedstatechange.md) completion.   <br /><br /> The initial invitation for the newly created network isn't owned by any user. Therefore calling [PartyInvitation::GetCreatorEntityId()](../../PartyInvitation/methods/partyinvitation_getcreatorentityid.md) returns nullptr for the initial invitation. The initial invitation also persists for the lifetime of the network until specifically revoked via [PartyNetwork::RevokeInvitation()](../../PartyNetwork/methods/partynetwork_revokeinvitation.md). New invitations can be created for the network via [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) by local users authenticated into the network, and those invitations will persist until their creating local users are removed from the network. Users join the network via [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md) by providing the identifier of an invitation that was successfully created, has not been revoked, and allows them to join.   

### Retrying on failure

 When CreateNewNetwork() fails asynchronously, a PartyCreateNewNetworkCompletedStateChange is provided by [StartProcessingStateChanges](partymanager_startprocessingstatechanges.md) indicating the result. The operation may be retried after a delay, depending on the [PartyStateChangeResult](../../../enums/partystatechangeresult.md) provided.   <br /><br />

| Result | Retry behavior |
| --- | --- |
| InternetConnectivityError | Retry with a small delay of no less than 10 seconds. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| PartyServiceError | Retry with an exponential backoff. Start with a minimum delay of no less than 10 seconds, doubling the delay with each retry. |
| NoServersAvailable | Retry with an exponential backoff. Start with a minimum delay of no less than 30 seconds, doubling the delay with each retry. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| UserNotAuthorized | This result can mean that the user's entity token was invalid, expired, or that the user was not authorized for other reasons. Retry no more than one time, and only after getting a new entity token for the user and calling [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).|
| UserCreateNetworkThrottled | Don't retry automatically. Instead, display a message to the user and wait for the user to initiate another attempt. |
| FailedToBindToLocalUdpSocket | This result means that the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option to a valid, available bind address, and reinitialize the library.
  
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
  
  
