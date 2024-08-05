---
author: jdeweyMSFT
title: "PartyEndpoint"
description: Represents an endpoint in a network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/20/2023
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
| [GetEntityType](methods/partyendpoint_getentitytype.md) | Gets the PlayFab entity type of the user associated with this endpoint. |  
| [GetNetwork](methods/partyendpoint_getnetwork.md) | Gets the network associated with this endpoint. |  
| [GetDevice](methods/partyendpoint_getdevice.md) | Gets the device associated with this endpoint. |  
| [GetUniqueIdentifier](methods/partyendpoint_getuniqueidentifier.md) | Gets the network-unique identifier for this endpoint. |  
| [GetSharedProperty](methods/partyendpoint_getsharedproperty.md) | Gets the value of a shared property. |  
| [GetCustomContext](methods/partyendpoint_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this endpoint object. |  
| [SetCustomContext](methods/partyendpoint_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this endpoint object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyLocalEndpoint](../PartyLocalEndpoint/partylocalendpoint.md)
  
  
  
