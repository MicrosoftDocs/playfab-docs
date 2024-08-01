---
author: jasonsandlin
title: "PFMultiplayerServerPartyNetworkConfiguration"
description: "PFMultiplayerServerPartyNetworkConfiguration data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerPartyNetworkConfiguration  

PFMultiplayerServerPartyNetworkConfiguration data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPartyNetworkConfiguration {  
    const char* directPeerConnectivityOptions;  
    uint32_t maxDevices;  
    uint32_t maxDevicesPerUser;  
    uint32_t maxEndpointsPerDevice;  
    uint32_t maxUsers;  
    uint32_t maxUsersPerDevice;  
    PFMultiplayerServerPartyInvitationConfiguration const* partyInvitationConfiguration;  
} PFMultiplayerServerPartyNetworkConfiguration;  
```
  
### Members  
  
**`directPeerConnectivityOptions`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Controls whether and how to support direct peer-to-peer connection attempts among devices in the network.
  
**`maxDevices`** &nbsp; uint32_t  
  
The maximum number of devices allowed to connect to the network. Must be between 1 and 32, inclusive.
  
**`maxDevicesPerUser`** &nbsp; uint32_t  
  
The maximum number of devices allowed per user. Must be greater than 0.
  
**`maxEndpointsPerDevice`** &nbsp; uint32_t  
  
The maximum number of endpoints allowed per device. Must be between 0 and 32, inclusive.
  
**`maxUsers`** &nbsp; uint32_t  
  
The maximum number of unique users allowed in the network. Must be greater than 0.
  
**`maxUsersPerDevice`** &nbsp; uint32_t  
  
The maximum number of users allowed per device. Must be between 1 and 8, inclusive.
  
**`partyInvitationConfiguration`** &nbsp; [PFMultiplayerServerPartyInvitationConfiguration](pfmultiplayerserverpartyinvitationconfiguration.md) const*  
*may be nullptr*  
  
(Optional) An optionally-specified configuration for the initial invitation for this party. If not provided, default configuration values will be used: a title-unique invitation identifier will be generated, the revocability will be Anyone, and the EntityID list will be empty.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
