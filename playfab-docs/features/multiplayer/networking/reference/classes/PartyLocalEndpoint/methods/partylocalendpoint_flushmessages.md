---
author: jdeweyMSFT
title: "PartyLocalEndpoint::FlushMessages"
description: Forces all queued messages to the specified endpoints from this local endpoint to be sent as soon as possible regardless of their coalesce settings.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalEndpoint::FlushMessages  

Forces all queued messages to the specified endpoints from this local endpoint to be sent as soon as possible regardless of their coalesce settings.  

## Syntax  
  
```cpp
PartyError FlushMessages(  
    uint32_t targetEndpointCount,  
    PartyEndpointArray targetEndpoints  
)  
```  
  
### Parameters  
  
**`targetEndpointCount`** &nbsp; uint32_t  
  
This parameter is currently ignored. The number of target endpoints in the `targetEndpoints` array.  
  
**`targetEndpoints`** &nbsp; [PartyEndpointArray](../../../typedefs.md)  
*input array of size `targetEndpointCount`*  
  
This parameter is currently ignored. A `targetEndpointCount` entry array of target PartyEndpoint object pointers. Messages from this local endpoint, up through and including the most recent message to any endpoint in the array, will be transmitted as soon as possible.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if flushing messages succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
When [PartySendMessageOptions::CoalesceOpportunistically](../../../enums/partysendmessageoptions.md) or [PartySendMessageOptions::AlwaysCoalesceUntilFlushed](../../../enums/partysendmessageoptions.md) is specified in a call to [SendMessage()](partylocalendpoint_sendmessage.md), the message may not be transmitted immediately and instead be combined with other messages. This coalescing can improve bandwidth efficiency at the potential expense of perceived latency. This method allows the title to manually force such coalesced messages to begin transmitting as soon as possible. <br /><br /> Currently this method ignores the `targetEndpoints` parameter and forces all queued messages from this local endpoint to be transmitted as soon as possible.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalEndpoint](../partylocalendpoint.md)  
[PartyLocalEndpoint::SendMessage](partylocalendpoint_sendmessage.md)  
[PartySendMessageOptions](../../../enums/partysendmessageoptions.md)
  
  
