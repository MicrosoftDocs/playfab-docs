---
author: jdeweyMSFT
title: "PartyLocalEndpoint"
description: Represents a local endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyLocalEndpoint  

Represents a local endpoint.  

## Syntax  
  
```cpp  
class PartyLocalEndpoint : public PartyEndpoint  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetLocalUser](methods/partylocalendpoint_getlocaluser.md) | Gets the local user associated with this local endpoint. |  
| [SendMessage](methods/partylocalendpoint_sendmessage.md) | Sends a message to other endpoints in the network. |  
| [FlushMessages](methods/partylocalendpoint_flushmessages.md) | Forces all queued messages to the specified endpoints from this local endpoint to be sent as soon as possible regardless of their coalesce settings. |  
| [GetEndpointStatistics](methods/partylocalendpoint_getendpointstatistics.md) | Gets one or more statistic counter values for the specified target endpoints. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyEndpoint](../PartyEndpoint/partyendpoint.md)  
[PartyEndpoint::GetLocal](../PartyEndpoint/methods/partyendpoint_getlocal.md)
  
  
  
