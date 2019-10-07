---
author: jdeweyMSFT
title: "PartyEndpointStatistic"
description: "Types of statistics that can be retrieved for an endpoint."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyEndpointStatistic  

Types of statistics that can be retrieved for an endpoint.    

## Syntax  
  
```cpp
enum class PartyEndpointStatistic    
{  
    CurrentlyQueuedSendMessages,  
    CurrentlyQueuedSendMessageBytes,  
    CurrentlyActiveSendMessages,  
    CurrentlyActiveSendMessageBytes,  
    TimedOutSendMessages,  
    TimedOutSendMessageBytes,  
    CanceledSendMessages,  
    CanceledSendMessageBytes,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CurrentlyQueuedSendMessages | The number of messages currently queued by [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) but not yet transmitted from the local endpoint to the specified target endpoints.<br/><br/> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message will only be counted a single time rather than multiplied per target endpoint. |  
| CurrentlyQueuedSendMessageBytes | The number of bytes of data in messages currently queued by [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) but not yet transmitted from the local endpoint to the specified target endpoints.<br/><br/> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message bytes will only be counted a single time rather than multiplied per target endpoint. |  
| CurrentlyActiveSendMessages | The number of [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that are currently being transmitted or still have more local state changes to be processed.<br/><br/> A message is considered "active" as soon as its first byte has been placed in a packet that is being transmitted. It remains active until transmission completes and the local [PartyDataBuffersReturnedStateChange](../structs/partydatabuffersreturnedstatechange.md) for it (if applicable) has been returned with [PartyManager::FinishProcessingStateChanges()](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md). <br /><br /> For efficiency, only a single message is tracked per PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message will only be counted a single time rather than multiplied per target endpoint. |  
| CurrentlyActiveSendMessageBytes | The number of bytes of data in [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that are currently being transmitted or still have more local state changes to be processed.<br/><br/> A message is considered "active" as soon as its first byte has been placed in a packet that is being transmitted. It remains active until transmission completes and the local [PartyDataBuffersReturnedStateChange](../structs/partydatabuffersreturnedstatechange.md) for it (if applicable) has been returned with [PartyManager::FinishProcessingStateChanges()](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md). <br /><br /> For efficiency, only a single message is tracked per PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message bytes will only be counted a single time rather than multiplied per target endpoint. |  
| TimedOutSendMessages | The total number of [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that were ever discarded for exceeding their send queue timeouts without being transmitted.<br/><br/> A message's send queue timeout is specified using [PartySendMessageQueuingConfiguration::timeoutInMillseconds](../structs/partysendmessagequeuingconfiguration.md) when calling PartyLocalEndpoint::SendMessage(). <br /><br /> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message will only be counted a single time rather than multiplied per target endpoint.   <br /><br /> When querying this statistic for all target endpoints by providing a zero-entry array to PartyLocalEndpoint::GetEndpointStatistics(), note that only endpoints that currently exist will be included. If an endpoint that had timed out messages gets destroyed between queries, this count might be perceived as "going backward". |  
| TimedOutSendMessageBytes | The total number of bytes of data in [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that were ever discarded for exceeding their send queue timeouts without being transmitted.<br/><br/> A message's send queue timeout is specified using [PartySendMessageQueuingConfiguration::timeoutInMillseconds](../structs/partysendmessagequeuingconfiguration.md) when calling PartyLocalEndpoint::SendMessage(). <br /><br /> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message bytes will only be counted a single time rather than multiplied per target endpoint.   <br /><br /> When querying this statistic for all target endpoints by providing a zero-entry array to PartyLocalEndpoint::GetEndpointStatistics(), note that only endpoints that currently exist will be included. If an endpoint that had timed out messages gets destroyed between queries, this count might be perceived as "going backward". |  
| CanceledSendMessages | The total number of [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that were ever canceled.<br/><br/> Messages are canceled before being transmitted by the application calling PartyLocalEndpoint::CancelMessages() with a matching filter expression. <br /><br /> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the PartyNetwork transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message will only be counted a single time rather than multiplied per target endpoint.   <br /><br /> When querying this statistic for all target endpoints by providing a zero-entry array to PartyLocalEndpoint::GetEndpointStatistics(), note that only endpoints that currently exist will be included. If an endpoint that had canceled messages gets destroyed between queries, this count might be perceived as "going backward". |  
| CanceledSendMessageBytes | The total number of bytes of data in [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) messages from the local endpoint to the specified target endpoints that were ever canceled.<br/><br/> Messages are canceled before being transmitted by the application calling PartyLocalEndpoint::CancelMessages() with a matching filter expression. <br /><br /> For efficiency, only a single message is queued by PartyLocalEndpoint::SendMessage() when sending to multiple target endpoints at once via the PartyNetwork transparent cloud relay server. If two or more of those endpoints are specified to [PartyLocalEndpoint::GetEndpointStatistics()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) when querying for this statistic, the message bytes will only be counted a single time rather than multiplied per target endpoint.   <br /><br /> When querying this statistic for all target endpoints by providing a zero-entry array to PartyLocalEndpoint::GetEndpointStatistics(), note that only endpoints that currently exist will be included. If an endpoint that had canceled messages gets destroyed between queries, this count might be perceived as "going backward". |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetworkStatistic](partynetworkstatistic.md)  
[PartySendMessageQueuingConfiguration](../structs/partysendmessagequeuingconfiguration.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)  
[PartyLocalEndpoint::GetEndpointStatistics](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md)
  
  
