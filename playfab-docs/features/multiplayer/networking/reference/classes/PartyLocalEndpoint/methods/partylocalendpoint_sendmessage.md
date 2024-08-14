---
author: jdeweyMSFT
title: "PartyLocalEndpoint::SendMessage"
description: Sends a message to other endpoints in the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2021
---

# PartyLocalEndpoint::SendMessage  

Sends a message to other endpoints in the network.  

## Syntax  
  
```cpp
PartyError SendMessage(  
    uint32_t targetEndpointCount,  
    PartyEndpointArray targetEndpoints,  
    PartySendMessageOptions options,  
    const PartySendMessageQueuingConfiguration* queuingConfiguration,  
    uint32_t dataBufferCount,  
    const PartyDataBuffer* dataBuffers,  
    void* messageIdentifier  
)  
```  
  
### Parameters  
  
**`targetEndpointCount`** &nbsp; uint32_t  
  
The number of target endpoints in the `targetEndpoints` array. May be zero to broadcast to all remote endpoints in the network. A device that receives a broadcast message will have the target endpoint fields of the [PartyEndpointMessageReceivedStateChange](../../../structs/partyendpointmessagereceivedstatechange.md) populated with all of the device's local endpoints.  
  
**`targetEndpoints`** &nbsp; [PartyEndpointArray](../../../typedefs.md)  
*input array of size `targetEndpointCount`*  
  
The `targetEndpointCount` entry array of target PartyEndpoint object pointers to which the message should be sent. This is ignored when `targetEndpointCount` is zero.  
  
**`options`** &nbsp; [PartySendMessageOptions](../../../enums/partysendmessageoptions.md)  
  
Zero or more option flags describing how to send the message.  
  
**`queuingConfiguration`** &nbsp; [PartySendMessageQueuingConfiguration*](../../../structs/partysendmessagequeuingconfiguration.md)  
*optional*  
  
An optional structure describing how the message should behave while locally queued and waiting for an opportunity to transmit. May be nullptr to use default queuing behavior.  
  
**`dataBufferCount`** &nbsp; uint32_t  
  
The number of buffer structures provided in the `dataBuffers` array. Must be greater than 0.  
  
**`dataBuffers`** &nbsp; [PartyDataBuffer*](../../../structs/partydatabuffer.md)  
*input array of size `dataBufferCount`*  
  
The `dataBufferCount` entry array of PartyDataBuffer structures describing the message payload to send.  
  
**`messageIdentifier`** &nbsp; void*  
*optional*  
  
An opaque, caller-specific context pointer the Party library will include in any state changes referring to this message. It is not interpreted or transmitted remotely. May be nullptr if no message identification context is needed.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if enqueuing the message for transmission succeeded or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Sending messages to local endpoints is not currently supported. If the array of target endpoints includes any local targets, this call will synchronously fail. <br /><br /> All targeted endpoints on a given device will be provided a single [PartyEndpointMessageReceivedStateChange](../../../structs/partyendpointmessagereceivedstatechange.md) with every targeted local endpoint provided in the PartyEndpointMessageReceivedStateChange *receiverEndpoints* array.   <br /><br /> If the array of target endpoints is specified as having zero entries, then the message is broadcast to all remote endpoints currently in the network.   <br /><br /> Callers provide 1 or more PartyDataBuffer structures in the `dataBuffers` array. The memory that the structures reference does not have to be contiguous, making it easy to have a fixed header buffer followed by a variable payload, for example. The buffers will be assembled in order, transmitted, and delivered to the targeted endpoints as a single contiguous data block in a PartyEndpointMessageReceivedStateChange. The Party library does not expend bandwidth transmitting metadata to describe the original PartyDataBuffer segmentation.   <br /><br /> By default, the buffers described in the caller's `dataBuffers` array are copied to an allocated buffer before SendMessage() returns. Specifying [PartySendMessageOptions::DontCopyDataBuffers](../../../enums/partysendmessageoptions.md) will avoid this extra copy step and instead require the caller to keep the memory specified in each buffer valid and unmodified until a [PartyDataBuffersReturnedStateChange](../../../structs/partydatabuffersreturnedstatechange.md) returns ownership of the memory to the caller. The PartyDataBuffer structures themselves do not need to remain valid after the SendMessage() call returns, only the memory that they reference.   <br /><br /> Callers that use PartySendMessageOptions::DontCopyDataBuffers may provide a caller-specific `messageIdentifier` context. This pointer-sized value will be included with all PartyDataBuffersReturnedStateChanges so that the caller can easily access its own private message tracking information. The actual value is treated as opaque and is not interpreted by the Party library, nor transmitted remotely. It's the caller's responsibility to ensure any of its own memory that `messageIdentifier` might represent remains valid until the final requested state change associated with the message and associated `messageIdentifier` has been processed and returned via [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).   <br /><br /> Messages may not be transmitted to target endpoints right away based on factors such as connection quality and receiver responsiveness. The local send queue will grow if you are sending faster than the connection to an endpoint is estimated to currently support. This increases memory usage and may result in increases in perceived message latency, so callers are strongly recommended to monitor and manage the local send queues. You can retrieve information about the send queue using [PartyLocalEndpoint::GetEndpointStatistics()](partylocalendpoint_getendpointstatistics.md). You can manage the send queue by reducing the size and/or frequency of sending, by using the `queuingConfiguration` optional settings to configure timeouts that automatically expire messages that have been queued for too long, or by using PartyLocalEndpoint::CancelMessages() to explicitly remove some or all queued messages.   <br /><br /> When this method returns success, the message has begun transmitting or has successfully been enqueued for future transmission. In particular, a successful return from this method does not imply that the message was successfully delivered to any recipients. The Party API does not currently provide a way to track the delivery and processing of individual messages. The [PartyNetwork::GetNetworkStatistics()](../../PartyNetwork/methods/partynetwork_getnetworkstatistics.md) and GetEndpointStatistics() methods can be used to query aggregate statistics for the network as a whole or for an individual local endpoint, respectively.   <br /><br /> If `options` includes [PartySendMessageOptions::GuaranteedDelivery](../../../enums/partysendmessageoptions.md) and the message could not be successfully delivered to the transparent cloud relay server for forwarding to the target endpoints, then a [PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md) will be generated. In other words, messages with a guaranteed delivery requirement will either be delivered or the sending client will be disconnected from the network. When the transparent cloud relay server forwards the guaranteed delivery message to each remote device containing one or more target endpoints, if the message could not be delivered, the remote device will likewise be disconnected from the network, indicated by a PartyNetworkDestroyedStateChange. In other words, a device that fails to receive a message with a guaranteed delivery requirement will be disconnected from the network.   <br /><br /> The Party library automatically fragments and reassembles large messages that exceed the maximum size supported by the environment so that callers are not required to manage this. However, there is a small amount of overhead associated with fragmentation. Callers that are able to send smaller messages or otherwise naturally break up large state payloads efficiently themselves may wish to do so.   <br /><br /> If SendMessage() is invoked with a zero entry target endpoint array prior to successfully authenticating a first user into the network, then even though no remote endpoints have been reported via [PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md) state changes (and therefore known to exist in the network), the message will still be queued. Once the first user has successfully authenticated and this sending local endpoint has been successfully created, the queued message will then target all remote endpoints that exist in the network at that later time. Because the future state of the network and the set of ultimately receiving endpoints isn't known at SendMessage() time in this case, titles should exercise caution regarding what content is placed in such deferred broadcast messages, or simply refrain from submitting them at all until this local device and endpoint are fully participating in the network.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalEndpoint](../partylocalendpoint.md)  
[PartySendMessageOptions](../../../enums/partysendmessageoptions.md)  
[PartySendMessageQueuingConfiguration](../../../structs/partysendmessagequeuingconfiguration.md)  
[PartyDataBuffersReturnedStateChange](../../../structs/partydatabuffersreturnedstatechange.md)  
[PartyEndpointMessageReceivedStateChange](../../../structs/partyendpointmessagereceivedstatechange.md)  
[PartyNetwork::GetNetworkStatistics](../../PartyNetwork/methods/partynetwork_getnetworkstatistics.md)  
[PartyLocalEndpoint::GetEndpointStatistics](partylocalendpoint_getendpointstatistics.md)  
[PartyLocalEndpoint::FlushMessages](partylocalendpoint_flushmessages.md)
  
  
