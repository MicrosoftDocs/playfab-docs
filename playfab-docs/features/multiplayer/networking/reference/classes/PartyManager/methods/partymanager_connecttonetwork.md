---
author: jdeweyMSFT
title: "PartyManager::ConnectToNetwork"
description: Queues an asynchronous attempt to connect to a network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyManager::ConnectToNetwork  

Queues an asynchronous attempt to connect to a network.  

## Syntax  
  
```cpp
PartyError ConnectToNetwork(  
    const PartyNetworkDescriptor* networkDescriptor,  
    void* asyncIdentifier,  
    PartyNetwork** network  
)  
```  
  
### Parameters  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
  
The descriptor associated with the network to which a connection will be established.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`network`** &nbsp; [PartyNetwork**](../../PartyNetwork/partynetwork.md)  
*optional, library-allocated output*  
  
The optional, output network object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to connect to a new network began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous attempt to connect to the network associated with `networkDescriptor` by negotiating and establishing a secure DTLS connection from the local device to the transparent cloud relay server. A [PartyConnectToNetworkCompletedStateChange](../../../structs/partyconnecttonetworkcompletedstatechange.md) will be provided upon completion of the asynchronous operation, indicating success or failure. On success, the local device will have established a connection to the transparent cloud relay server. On failure, a [PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md) will be generated. No other devices will become visible, and the local device won't be visible to any remote devices, until at least one local user is successfully authenticated via [PartyNetwork::AuthenticateLocalUser()](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md). <br /><br /> After the device successfully connects to the network, it must authenticate into the network via PartyNetwork::AuthenticateLocalUser(). If the device is connected to the network but unauthenticated for more than one minute, the device will be disconnected and a PartyNetworkDestroyedStateChange will be generated. This will occur regardless of whether the device never authenticated or lost authentication after calling [PartyNetwork::RemoveLocalUser()](../../PartyNetwork/methods/partynetwork_removelocaluser.md).   <br /><br /> This method optionally provides `network` as output that can immediately be used to perform asynchronous network operations, such as [PartyNetwork::CreateInvitation()](../../PartyNetwork/methods/partynetwork_createinvitation.md) and [PartyNetwork::CreateEndpoint()](../../PartyNetwork/methods/partynetwork_createendpoint.md). These asynchronous operations will be internally queued until the connection completes, at which point they'll be processed. This `network` will also be provided on the resulting PartyConnectToNetworkCompletedStateChange where it will be fully connected and associated with the provided `asyncIdentifier`.   <br /><br /> This operation will asynchronously fail with [PartyConnectToNetworkCompletedStateChange::result](../../../structs/partyconnecttonetworkcompletedstatechange.md) set to [PartyStateChangeResult::NetworkLimitReached](../../../enums/partystatechangeresult.md) if the limit of connected devices for the network has been reached as specified in the network's configuration when it was created via [CreateNewNetwork()](partymanager_createnewnetwork.md).   <br /><br /> On successful return, this method invalidates the memory for any array previously returned by [GetNetworks()](partymanager_getnetworks.md), as it synchronously adds the new network to the array. [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) also invalidates the memory for the array. The returned `network` object will be valid until a PartyNetworkDestroyedStateChange has been generated and all state changes referencing the object have been returned to [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).     

### Retrying on failure

 When ConnectToNetwork() fails asynchronously, a PartyConnectToNetworkCompletedStateChange is provided by StartProcessingStateChanges() indicating the result. The operation may be retried after a delay, depending on the [PartyStateChangeResult](../../../enums/partystatechangeresult.md) provided.   <br /><br />

| Result | Retry behavior |
| --- | --- |
| InternetConnectivityError | Retry with a small delay of no less than 10 seconds. For your app, it may be more appropriate to display the error to the user immediately, rather than retrying automatically. |
| NetworkLimitReached | Don't retry automatically. Instead, display a message to the user and wait for the user to initiate another attempt. |
| NetworkNoLongerExists | Don't retry. |
| VersionMismatch | Don't retry. |
| FailedToBindToLocalUdpSocket | This result means that the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../../../enums/partyoption.md) option to a valid, available bind address, and reinitialize the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyConnectToNetworkCompletedStateChange](../../../structs/partyconnecttonetworkcompletedstatechange.md)  
[PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md)  
[PartyNetworkConfiguration](../../../structs/partynetworkconfiguration.md)  
[PartyManager::CreateNewNetwork](partymanager_createnewnetwork.md)  
[PartyManager::GetNetworks](partymanager_getnetworks.md)  
[PartyNetwork::AuthenticateLocalUser](../../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](../../PartyNetwork/methods/partynetwork_removelocaluser.md)  
[PartyNetwork::CreateInvitation](../../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyNetwork::RevokeInvitation](../../PartyNetwork/methods/partynetwork_revokeinvitation.md)  
[PartyNetwork::CreateEndpoint](../../PartyNetwork/methods/partynetwork_createendpoint.md)  
[PartyNetwork::LeaveNetwork](../../PartyNetwork/methods/partynetwork_leavenetwork.md)
  
  
