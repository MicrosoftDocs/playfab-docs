---
author: jdeweyMSFT
title: "PartyNetworkConfiguration"
description: "Network configuration data."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyNetworkConfiguration  

Network configuration data.  

## Syntax  
  
```cpp
typedef struct PartyNetworkConfiguration {  
    uint32_t maxUserCount;  
    uint32_t maxDeviceCount;  
    uint32_t maxUsersPerDeviceCount;  
    uint32_t maxDevicesPerUserCount;  
    uint32_t maxEndpointsPerDeviceCount;  
} PartyNetworkConfiguration  
```
  
### Members  
  
**`maxUserCount`** &nbsp; uint32_t  
  
The maximum number of unique users allowed in the network.
  
This value must be greater than 0. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxDeviceCount`** &nbsp; uint32_t  
  
The maximum number of devices allowed to connect to the network.
  
This value must be between 1 and ```c_maxNetworkConfigurationMaxDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyManager::ConnectToNetwork()](../classes/PartyManager/methods/partymanager_connecttonetwork.md), the operation will fail asynchronously and [PartyConnectToNetworkCompletedStateChange::result](partyconnecttonetworkcompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxUsersPerDeviceCount`** &nbsp; uint32_t  
  
The maximum number of users allowed per device.
  
This value must be between 1 and ```c_maxLocalUsersPerDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxDevicesPerUserCount`** &nbsp; uint32_t  
  
The maximum number of devices allowed per user.
  
This value must be greater than 0. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxEndpointsPerDeviceCount`** &nbsp; uint32_t  
  
The maximum number of endpoints allowed per device.
  
This value must be between 0 and ```c_maxNetworkConfigurationMaxEndpointsPerDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyNetwork::CreateEndpoint()](../classes/PartyNetwork/methods/partynetwork_createendpoint.md) after the network configuration was made available, the call to PartyNetwork::CreateEndpoint() will fail synchronously. If the client had already queued a violating number of endpoint creations when the network configuration became available, the client will be kicked from the network and a [PartyNetworkDestroyedStateChange](partynetworkdestroyedstatechange.md) will be generated.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::AuthenticateLocalUser](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyAuthenticateLocalUserCompletedStateChange](partyauthenticatelocalusercompletedstatechange.md)  
[PartyManager::ConnectToNetwork](../classes/PartyManager/methods/partymanager_connecttonetwork.md)  
[PartyConnectToNetworkCompletedStateChange](partyconnecttonetworkcompletedstatechange.md)  
[PartyNetwork::CreateEndpoint](../classes/PartyNetwork/methods/partynetwork_createendpoint.md)  
[PartyNetworkDestroyedStateChange](partynetworkdestroyedstatechange.md)  
[PartyStateChangeResult](../enums/partystatechangeresult.md)
  
  
