---
author: jdeweyMSFT
title: "PartyNetwork::AuthenticateLocalUser"
description: Queues an asynchronous operation to authenticate the specified local user into the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyNetwork::AuthenticateLocalUser  

Queues an asynchronous operation to authenticate the specified local user into the network.  

## Syntax  
  
```cpp
PartyError AuthenticateLocalUser(  
    const PartyLocalUser* localUser,  
    PartyString invitationIdentifier,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user to authenticate into the network.  
  
**`invitationIdentifier`** &nbsp; [PartyString](../../../typedefs.md)  
  
The identifier of the invitation that allows the `localUser` to authenticate into the network.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to authenticate the local user began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
While any device with the appropriate network descriptor can establish a connection to the network, no useful actions can be performed, and no useful information can be gleaned, without first authenticating a local user on the device into the network. As such, authentication is an important security measure to ensure the integrity of the network and the privacy of the devices and users participating in the network. To authenticate a user is to have the transparent cloud relay server validate the user's identity and that the user is allowed to join the network. <br /><br /> Upon successful completion of the asynchronous operation started by this call, a user is considered authenticated into the network. Completion is indicated by the [PartyAuthenticateLocalUserCompletedStateChange](../../../structs/partyauthenticatelocalusercompletedstatechange.md). Successful authentication requires that the local user's PlayFab Entity Token is valid and is associated with the local user's PlayFab Entity ID. Successful authentication also requires that the provided invitation allows the provided local user to join the network. Authentication will fail if authenticating the provided user would violate one of the limits in the network's configuration. These requirements are enforced by the transparent cloud relay server. If the asynchronous operation fails, the PartyAuthenticateLocalUserCompletedStateChange will provide a diagnostic result and error detail, and a [PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md) will be generated. Because being connected to a network with no authenticated users is not a useful state outside of transition periods, the Party library will automatically disconnect a device that doesn't have an authenticated user for an extended period.   <br /><br /> Users need an `invitationIdentifier` to call this method and authenticate into the network. Most commonly this means that another device will have to share the identifier of the initial invitation generated via [PartyManager::CreateNewNetwork()](../../PartyManager/methods/partymanager_createnewnetwork.md) or share the identifier of an invitation it has generated via [CreateInvitation()](partynetwork_createinvitation.md).   <br /><br /> User authentication also determines device authentication. A device is considered authenticated into the network if at least one local user is authenticated into the network. If a device is authenticated into the network, it will be visible to all other authenticated devices. If a device is connected to the network but not authenticated, no remote devices, endpoints, or chat controls, will be visible. Similarly, the device won't be visible to any other devices connected to the network.   <br /><br /> Once this method is called, all other methods that queue asynchronous operations but require the local user or local device to be authenticated into the network can be called. Such operations will be queued until completion of the authentication operation. Once the authentication operation completes, the queued operations will be processed. If the authentication operation failed, the queued operations will also fail and their respective completion state changes will indicate such.   <br /><br /> If the local device enters a state in which there are no authenticated users and no authentication operations in progress, then all endpoints, including those that aren't fully created, will be destroyed automatically. This will be signaled by [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)s.   <br /><br /> On successful return, this method invalidates the memory for any array previously returned by [PartyNetwork::GetLocalUsers()](partynetwork_getlocalusers.md), as it synchronously adds the new user to the array. [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) also invalidates the memory for the array.   <br /><br /> This method will fail if the specified `localUser` is in the process of authenticating into the network, is already authenticated into the network, is authenticated but in the process of being removed due to a previous call to [PartyNetwork::RemoveLocalUser()](partynetwork_removelocaluser.md), or if the device overall is in the process of becoming unauthenticated due to its last authenticated user being removed from the network.   

### Retrying on failure

 If the PartyAuthenticateLocalUserCompletedStateChange associated with the completion of this call indicates a failure, the operation may be retried after a delay. The proper retry behavior depends on the [PartyStateChangeResult](../../../enums/partystatechangeresult.md) provided in the state change.   <br /><br />

| Result | Retry behavior |
| --- | --- |
| InternetConnectivityError | Retry with a small delay of no less than 10 seconds. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| PartyServiceError | Retry with an exponential backoff. Start with a minimum delay of no less than 10 seconds, doubling the delay with each retry. |
| UserNotAuthorized | This result can mean that the user's entity token was invalid, expired, or that the user wasn't authorized for other reasons. It could also mean that specified invitation is no longer valid, or the invitation doesn't contain this user. Retry no more than one time, and only after getting a new entity token for the user and calling [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).|
| FailedToBindToLocalUdpSocket | This result means that the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option to a valid, available bind address, and reinitialize the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyAuthenticateLocalUserCompletedStateChange](../../../structs/partyauthenticatelocalusercompletedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)  
[PartyNetworkConfiguration](../../../structs/partynetworkconfiguration.md)  
[PartyManager::CreateLocalUser](../../PartyManager/methods/partymanager_createlocaluser.md)  
[PartyManager::CreateLocalUserWithEntityType](../../PartyManager/methods/partymanager_createlocaluserwithentitytype.md)  
[PartyNetwork::RemoveLocalUser](partynetwork_removelocaluser.md)  
[PartyNetwork::GetLocalUsers](partynetwork_getlocalusers.md)  
[PartyManager::CreateNewNetwork](../../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::CreateInvitation](partynetwork_createinvitation.md)
  
  
