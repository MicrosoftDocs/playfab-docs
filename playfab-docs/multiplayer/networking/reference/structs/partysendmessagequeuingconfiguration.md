---
author: jdeweyMSFT
title: "PartySendMessageQueuingConfiguration"
description: "Optional configuration parameters for modifying local queuing behavior when sending a message."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartySendMessageQueuingConfiguration  

Optional configuration parameters for modifying local queuing behavior when sending a message.  

## Syntax  
  
```cpp
struct PartySendMessageQueuingConfiguration {  
    int8_t priority;  
    uint32_t identityForCancelFilters;  
    uint32_t timeoutInMilliseconds;  
}  
```
  
### Members  
  
**`priority`** &nbsp; int8_t  
  
The priority of the locally queued message in relation to chat data or messages sent from other local endpoints.
  
```priority``` must be a value between ```c_minSendMessageQueuingPriority``` and ```c_maxSendMessageQueuingPriority```, inclusive. Higher numbers represent higher relative priority (will be transmitted first) over lower numbers. The default when no PartySendMessageQueuingConfiguration structure is provided to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) is ```c_defaultSendMessageQueuingPriority```, which lies exactly in the middle of the signed integer range (zero). <br /><br /> Send queue priority does not modify the order in which messages sent from a given local endpoint are transmitted or delivered. It only affects the ordering of messages from different local endpoints, or between an endpoint and internally transmitted chat data, which uses priority ```c_chatSendMessageQueuingPriority```. The local endpoint send queue that has the messages with the highest priority value will have its messages eligible for transmission first. If all remaining messages queued by local endpoints are of equal priority, then the individual messages will be eligible for transmission in the same order in which their PartyLocalEndpoint::SendMessage() calls occurred.   <br /><br /> One way to think of the behavior is that high priority messages automatically elevate the priority of all previous messages from the same local endpoint to the same value to ensure timely delivery of the high priority message but without breaking the sequential delivery expectations of the messages previously transmitted by the local endpoint. Other local endpoints have their own send sequence, and thus have no such ordering guarantees (though the Party library makes a best-effort attempt to preserve the ordering in which they were originally sent where possible).   <br /><br /> A message's send queue priority matters when there are more bytes to be sent than the connection can support due to connection quality or receiver responsiveness. Sending more important messages as higher priority ensures that they get the first opportunity to use the limited network resources. If you continue to send messages faster than can successfully be transmitted, lower priority messages may get "starved" and the associated local endpoint send queue will continue to grow. Be sure to manage such potential growth by canceling extraneous messages with PartyLocalEndpoint::CancelMessages(), using the ```timeoutInMilliseconds``` field to automatically time out messages that have been queued for too long, or simply reducing the size and/or frequency of the PartyLocalEndpoint::SendMessage() calls.
  
**`identityForCancelFilters`** &nbsp; uint32_t  
  
A caller-defined value to use when evaluating the message for applicability with cancel filter expressions.
  
This message identity value can have any caller-specific meaning and is not interpreted by the Party library other than for use by PartyLocalEndpoint::CancelMessages() when evaluating whether the message matches the optionally provided cancel filter expression. <br /><br /> A default value of zero is used when no PartySendMessageQueuingConfiguration structure is provided to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md).   <br /><br /> Canceling messages can help prevent the local send queue from growing excessively when experiencing poor network conditions. Canceling message identities that match certain filter expressions works well when you have categories of messages that are regularly sent with the latest information and should replace any previously queued out-of-date message that might still be awaiting a transmission opportunity. Canceling can also be useful when you have an instance or category of opportunistic messages whose loss would not be fatal and that aren't worth the bandwidth to try transmitting instead of more valuable queued messages.   <br /><br /> This local identity value is not part of the transmitted data payload. It has no applicability once the message begins transmitting and can no longer be removed from the local send queue by PartyLocalEndpoint::CancelMessages().
  
**`timeoutInMilliseconds`** &nbsp; uint32_t  
  
The maximum time, in milliseconds, that the message is permitted to remain in a Party-managed send queue awaiting a transmission opportunity.
  
If the message has not started transmitting when this timeout elapses due to connection quality or receiver responsiveness, the message will be aborted and removed from the queue without being sent. <br /><br /> A ```timeoutInMilliseconds``` value of zero indicates that there should be no timeout and that the message should remain queued until it is either successfully transmitted, is explicitly canceled, or encounters some transmission failure such as remote disconnection. Zero is the default when no PartySendMessageQueuingConfiguration structure is provided to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md).   <br /><br /> Message send queue timeouts can help prevent send queues from growing excessively when experiencing poor network conditions. They work well with messages that contain time-sensitive, periodic data where it would be a waste of bandwidth to transmit ones that are stale because a newer complete replacement message is sent regularly, and the loss of any individual one is not fatal.   <br /><br /> This timeout value only affects Party-managed send queuing. It does not affect the time it takes to actually transmit a message (environmental latency) nor alter how long to wait for the receiver to acknowledge the transmission if applicable.   <br /><br /> This timeout value is evaluated twice when sending to targets without direct peer connections: once for the sending client's local send queues to the transparent cloud relay, affected by local environmental conditions and transmission rates to the relay, and a second time on the relay itself, which may be forced to queue messages before forwarding based on differing network conditions, transmission rates, or responsiveness of the remote targets.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)
  
  
