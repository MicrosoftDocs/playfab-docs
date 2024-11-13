---
author: jdeweyMSFT
title: "PartyMessageReceivedOptions"
description: "Flags describing how a message was received."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyMessageReceivedOptions  

Flags describing how a message was received.    

## Syntax  
  
```cpp
enum class PartyMessageReceivedOptions  : int32_t  
{  
    None = 0x0000,  
    GuaranteedDelivery = 0x0001,  
    SequentialDelivery = 0x0002,  
    RequiredFragmentation = 0x0004,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | There is no additional message reception information. |  
| GuaranteedDelivery | The message's delivery was guaranteed.<br/><br/> This flag's presence or absence represents the actual delivery mode. The Party library may occasionally adjust messages internally to use guaranteed delivery even if [PartySendMessageOptions::GuaranteedDelivery](partysendmessageoptions.md) was not originally specified to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md). It will never disable guaranteed delivery if it had originally been requested, however. |  
| SequentialDelivery | The message was delivered using sequencing information.<br/><br/> This flag's presence or absence represents the actual delivery mode. The Party library may occasionally adjust messages internally to sequential delivery even if [PartySendMessageOptions::SequentialDelivery](partysendmessageoptions.md) was not originally specified to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md). It will never disable sequential delivery if it had originally been requested, however. |  
| RequiredFragmentation | The message was larger than could fit in available space in a single packet and needed to be split across multiple packets for delivery.<br/><br/> The Party library automatically fragments and reassembles large messages that exceed the maximum size supported by the environment so that callers are not required to manage this. However, there is a small amount of overhead associated with fragmentation. Callers that are able to send smaller messages or otherwise naturally break up large state payloads efficiently themselves may wish to do so. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyEndpointMessageReceivedStateChange](../structs/partyendpointmessagereceivedstatechange.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)
  
  
