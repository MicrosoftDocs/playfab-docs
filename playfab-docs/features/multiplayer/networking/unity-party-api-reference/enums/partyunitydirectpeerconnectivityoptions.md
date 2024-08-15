---
author: nassosterz-ms
title: DirectPeerConnectivityOptions
description: Flags controlling the attempted use of direct peer-to-peer connectivity among devices on a network for Unity.
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/15/2022
---

# DirectPeerConnectivityOptions

Flags controlling the attempted use of direct peer-to-peer connectivity among devices on a network.

## Syntax

```csharp
public enum PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS : UInt32
{
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_NONE = 0x0000,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_PLATFORM_TYPE = 0x0001,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_PLATFORM_TYPE = 0x0002,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_PLATFORM_TYPE = 0x0003,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_ENTITY_LOGIN_PROVIDER = 0x0004,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_ENTITY_LOGIN_PROVIDER = 0x0008,
    PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_ENTITY_LOGIN_PROVIDER = 0x000c,
}
```

## Constants

| Constant | Description |
| --- | --- |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_NONE | No flags are specified.<br/><br/> The absence of flags means that no direct peer connectivity attempts are permitted. All endpoint messages and chat data between devices will always be transmitted via transparent cloud relay servers, and no IP address information will ever be exchanged. |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_PLATFORM_TYPE | Direct peer-to-peer connections may be attempted between devices of the same platform type.<br/><br/> A pair of devices will attempt to establish direct peer-to-peer connections if they're identified as having the same type of hardware and/or OS platform (for example, Windows PCs, Xbox gaming consoles, iOS-based mobile devices) associated with the specific Party library they use. <br /><br /> Note that this flag doesn't permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_ENTITY_LOGIN_PROVIDER``` and ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_ENTITY_LOGIN_PROVIDER``` flags. <br /><br /> |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_PLATFORM_TYPE | Direct peer-to-peer connections may be attempted between devices with differing platform types.<br/><br/> A pair of devices will attempt to establish direct peer-to-peer connections if they're identified as having different types of hardware and/or OS platforms (for example, Windows PCs, Xbox gaming consoles, iOS-based mobile devices) associated with the specific Party libraries each device uses. <br /><br /> Note that this flag doesn't permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_ENTITY_LOGIN_PROVIDER``` and ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_ENTITY_LOGIN_PROVIDER``` flags. <br /><br /> |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_PLATFORM_TYPE | Direct peer-to-peer connections may be attempted between devices regardless of their platform types.<br/><br/> This flag is equivalent to ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_PLATFORM_TYPE | PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_PLATFORM_TYPE```. |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_ENTITY_LOGIN_PROVIDER | Direct peer-to-peer connections may be attempted between devices that have authenticated user PlayFab Entity IDs that were logged in using the same provider.<br/><br/> A device that's initially authenticating a local user into the network will attempt to establish direct peer-to- peer connections with remote devices that have at least one authenticated user PlayFab Entity ID that was logged in using the same provider (for example, Xbox Live, Facebook, iOS, Google) as the newly authenticating user. <br /><br /> Note that this flag doesn't permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_PLATFORM_TYPE``` and ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_PLATFORM_TYPE``` flags. <br /><br /> |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_ENTITY_LOGIN_PROVIDER | Direct peer-to-peer connections may be attempted between devices with authenticated user PlayFab Entity IDs that that were logged in using different providers.<br/><br/> A device that's initially authenticating a local user into the network will attempt to establish direct peer-to- peer connections with remote devices that don't  have any authenticated user PlayFab Entity IDs that were logged in using the same provider (for example, Xbox Live, Facebook, iOS, Google) as the newly authenticating user. <br /><br /> Note that this flag doesn't permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_PLATFORM_TYPE``` and ```PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_PLATFORM_TYPE``` flags. <br /><br /> |
| PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_ANY_ENTITY_LOGIN_PROVIDER | Direct peer-to-peer connections may be attempted between devices regardless of the provider used to login authenticated user PlayFab Entity IDs.<br/><br/> This flag is equivalent to ```SameEntiPARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_SAME_ENTITY_LOGIN_PROVIDERtyLoginProvider | PARTY_DIRECT_PEER_CONNECTIVITY_OPTIONS_DIFFERENT_ENTITY_LOGIN_PROVIDER```. |
