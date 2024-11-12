---
author: jdeweyMSFT
title: "PartySendMessageOptions"
description: "Options for controlling how a message is sent."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartySendMessageOptions  

Options for controlling how a message is sent.    

## Syntax  
  
```cpp
enum class PartySendMessageOptions  : int32_t  
{  
    Default = 0x0000,  
    GuaranteedDelivery = 0x0001,  
    BestEffortDelivery = 0x0000,  
    SequentialDelivery = 0x0002,  
    NonsequentialDelivery = 0x0000,  
    CopyDataBuffers = 0x0000,  
    DontCopyDataBuffers = 0x0004,  
    CoalesceOpportunistically = 0x0000,  
    AlwaysCoalesceUntilFlushed = 0x0008,  
    RequireTimelyAcknowledgement = 0x0000,  
    AllowLazyAcknowledgement = 0x0010,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Default | Use the default PartySendMessageOptions.<br/><br/> The default options are *BestEffortDelivery*, *NonsequentialDelivery*, *CopyDataBuffers*, *CoalesceOpportunistically*, and *RequireTimelyAcknowledgement*. |  
| GuaranteedDelivery | Ensure the message is delivered to all targets, retransmitting if necessary.<br/><br/> This option flag guarantees the message will arrive at each target endpoint, regardless of environmental packet loss, unless the target endpoint is destroyed. Packet transmissions will be retried as needed. <br /><br /> This option flag works well when sending important state information that must always reach the destination or else the target should be removed from the network. Use it with message content that does not have redundancy or the ability to be interpolated/extrapolated if it's lost, and is worth the potential increased bandwidth usage should packet retransmissions be needed.   <br /><br /> Guaranteeing delivery by itself doesn't imply a guarantee of a particular delivery order; use the *SequentialDelivery* option flag to enforce ordering. |  
| BestEffortDelivery | Transmit the message best-effort and ignore any packet loss.<br/><br/> This option flag requests only a single attempt to transmit the message. If environmental packet loss occurs, the transmission will not be retried and the application should be prepared to handle the message's absence. <br /><br /> This option flag works well for information that is constantly being updated and doesn't require every update to arrive. Use it with message content that already has redundancy or the ability to be interpolated/extrapolated if it's lost and isn't worth extra bandwidth to retransmit.   <br /><br /> This is the default if the *GuaranteedDelivery* option flag is not specified. |  
| SequentialDelivery | Deliver the message in order relative to other messages sent from this local endpoint to the target endpoint that were also sent sequentially.<br/><br/> *SequentialDelivery* doesn't provide any guarantees about the ordering of messages sent from different local endpoints and/or to different target endpoints. Each endpoint pairing should be considered a separate sequence space. <br /><br /> No guarantees are made about the order of sequential messages in relation to non-sequential messages.   <br /><br /> This option flag works well for state information that should reach the destination in a particular sequence, even if that means slightly less network efficiency and possibly waiting a bit longer to receive it if there is packet loss or reordering by the environment.   <br /><br /> Using *SequentialDelivery* with *GuaranteedDelivery* may result in messages being queued on the target endpoint while waiting for previously sent sequential messages to arrive. This may result in a perceived increase in latency when experiencing environmental packet loss or reordering, but the target endpoint will always see every message, in the same order in which they were sent.   <br /><br /> Using *SequentialDelivery* with *BestEffortDelivery* may result in messages being dropped if one arrives at the target endpoint out of order and a later sequential message had already been delivered. The target endpoint will always see the sequence moving forward, but there may be gaps in that sequence. An older message will never be delivered after a newer one. |  
| NonsequentialDelivery | Deliver the message to targets as soon as it arrives.<br/><br/> Messages sent with the non-sequential delivery option do not provide any guarantees about the order in which they are delivered with respect to any other messages, sequential or non-sequential. They will be delivered to the targets as soon as they arrive, which may not be the same order in which they were sent if there is packet loss or reordering by the environment. <br /><br /> This option flag works well for messages that are safe to process in any order or have their own inherent ordering information already, and where you'd like maximum network efficiency and lowest perceived latency.   <br /><br /> This is the default if the *SequentialDelivery* option flag is not specified. |  
| CopyDataBuffers | Instructs the Party library to make a copy of the supplied data buffers for subsequent transmission.<br/><br/> The memory contents in the provided PartyDataBuffer structures will be copied so the caller does not need to keep the buffers around after [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) returns. This is more convenient but slightly less efficient than using the *DontCopyDataBuffers* option flag. <br /><br /> This is the default if the *DontCopyDataBuffers* option flag is not specified. |  
| DontCopyDataBuffers | Informs the Party library to use the supplied data buffers directly and that the caller will keep the memory valid until the library no longer needs them.<br/><br/> The memory referenced by the provided PartyDataBuffer structures will not be copied but instead ownership will temporarily be transferred to the Party library so the memory can be accessed directly without additional copying overhead during the transmission process. It's the caller's responsibility to ensure the memory buffers remain valid and unmodified until the library no longer needs them and ownership is transferred back via a [PartyDataBuffersReturnedStateChange](../structs/partydatabuffersreturnedstatechange.md). This is more efficient but can be less convenient than using the *CopyDataBuffers* option. <br /><br /> The PartyDataBuffer structures themselves do not need to remain valid after the [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) call returns, only the memory they reference. |  
| CoalesceOpportunistically | Specifies that this message should be coalesced with any other queued messages but should not delay transmission if there aren't any waiting.<br/><br/> Coalescing multiple messages together in a single packet allows maximizing bandwidth efficiency (reducing per- packet overhead) at the potential expense of perceived latency for a message if you delay its transmission in order to coalesce. Sending with this flag causes the Party library to coalesce the message if there are other queued messages available, but not to wait for more messages if none exist and this message can be transmitted immediately. <br /><br /> Use this flag if you typically batch your network updates into single, periodic messages that are not likely to be queued around the same time as other messages and would not gain bandwidth efficiency if delayed.   <br /><br /> This flag does not guarantee that the message begins transmitting immediately. If the connection quality or receiver responsiveness do not appear to currently support sending additional data yet, then the message may be queued to await the next transmission opportunity.   <br /><br /> This is the default if the *AlwaysCoalesceUntilFlushed* option flag is not specified. |  
| AlwaysCoalesceUntilFlushed | Specifies that this message should always try to be coalesced with other messages and expect a [PartyLocalEndpoint::FlushMessages()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_flushmessages.md) call to begin transmitting.<br/><br/> Coalescing multiple messages together in a single packet allows maximizing bandwidth efficiency (reducing per- packet overhead) at the potential expense of perceived latency for a message if you delay its transmission in order to coalesce. Sending with this flag causes the Party library to always prefer coalescing the message and delay transmission until PartyLocalEndpoint::FlushMessages() is called. <br /><br /> Consider using this flag if you typically send a lot of small messages to the same targets in the same update loop and want to explicitly inform the Party library when the full update loop iteration is complete.   <br /><br /> Even with this flag there are scenarios where the message might begin transmitting without requiring an explicit PartyLocalEndpoint::FlushMessages() call. This can occur when there are other queued messages that are already being transmitted for other reasons and there is room in the packet to include this message. Similarly, when enough message data bytes exist to send a full packet and no more coalescence is possible, the packet will be sent. Calling PartyLocalEndpoint::FlushMessages() when all messages have already begun transmitting is benign. |  
| RequireTimelyAcknowledgement | Indicates that this message should be acknowledged (if needed) in a timely manner.<br/><br/> Receivers acknowledge reception of messages to inform the sender of delivery success or failure so it can do things such as retry dropped packets that contained messages sent with the *GuaranteedDelivery* option flag. Acknowledgements are often piggybacked on packets as part of typical bi-directional communication, but if no packets are flowing in the return direction, this flag instructs the target endpoints to only wait a small, internally managed timeout for piggybacking opportunities before forcing acknowledgement packets to inform the sender. That dedicated packet consumes some extra overhead but ensures the sender gets timely status for issuing any necessary retries. <br /><br /> Using this flag for most guaranteed delivery messages is recommended. It works well with messages that are latency sensitive. It also works well when bi-directional guaranteed delivery send patterns are infrequent or unpredictable.   <br /><br /> This is the default if the *AllowLazyAcknowledgement* option flag is not specified.   <br /><br /> This flag is ignored if the *GuaranteedDelivery* option flag is not specified. |  
| AllowLazyAcknowledgement | Indicates that this message can be acknowledged when convenient rather than urgently.<br/><br/> Receivers acknowledge reception of messages to inform the sender of delivery success or failure so it can do things such as retry dropped packets that contained messages sent with the *GuaranteedDelivery* option flag. Acknowledgements are often piggybacked on packets as part of typical bi-directional communication, but if no packets are flowing in the return direction, this flag instructs the target endpoints to wait for piggybacking opportunities without forcing acknowledgement packets to inform the sender. This delays the sender finding out status for any necessary retries, but avoids extra overhead consumed by a dedicated packet. <br /><br /> Consider using this flag for guaranteed delivery messages that are "fire-and-forget" and are not latency sensitive. It may also reduce overhead when bi-directional send patterns are frequent.   <br /><br /> This flag is ignored if the *GuaranteedDelivery* option flag is not also specified. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartySendMessageQueuingConfiguration](../structs/partysendmessagequeuingconfiguration.md)  
[PartyDataBuffersReturnedStateChange](../structs/partydatabuffersreturnedstatechange.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)  
[PartyLocalEndpoint::FlushMessages](../classes/PartyLocalEndpoint/methods/partylocalendpoint_flushmessages.md)
  
  
