---
author: jdeweyMSFT
title: "PartyEndpoint"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyEndpoint  

Represents an endpoint in a network.  

## Syntax  
  
```cpp  
class PartyEndpoint  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetLocal](methods/partyendpoint_getlocal.md) | Gets the [PartyLocalEndpoint](../PartyLocalEndpoint/partylocalendpoint.md) version of this endpoint. |  
| [GetEntityId](methods/partyendpoint_getentityid.md) | Gets the PlayFab Entity ID of the user associated with this endpoint. |  
| [GetNetwork](methods/partyendpoint_getnetwork.md) | Gets the network associated with this endpoint. |  
| [GetDevice](methods/partyendpoint_getdevice.md) | Gets the device associated with this endpoint. |  
| [GetUniqueIdentifier](methods/partyendpoint_getuniqueidentifier.md) | Gets the network-unique identifier for this endpoint. |  
| [GetCustomContext](methods/partyendpoint_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this endpoint object. |  
| [SetCustomContext](methods/partyendpoint_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this endpoint object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyLocalEndpoint](../PartyLocalEndpoint/partylocalendpoint.md)
  
  
  
