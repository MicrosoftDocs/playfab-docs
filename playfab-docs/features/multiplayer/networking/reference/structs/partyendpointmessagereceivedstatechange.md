---
author: jdeweyMSFT
title: "PartyEndpointMessageReceivedStateChange"
description: "Information specific to the *EndpointMessageReceived* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyEndpointMessageReceivedStateChange  

Information specific to the *EndpointMessageReceived* type of state change.  

## Syntax  
  
```cpp
struct PartyEndpointMessageReceivedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyEndpoint* senderEndpoint;  
    uint32_t receiverEndpointCount;  
    PartyLocalEndpointArray receiverEndpoints;  
    PartyMessageReceivedOptions options;  
    uint32_t messageSize;  
    const void* messageBuffer;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network containing the endpoint on which the message was received.
  
**`senderEndpoint`** &nbsp; [PartyEndpoint](../classes/PartyEndpoint/partyendpoint.md)*  
  
The endpoint which sent the message.
  
**`receiverEndpointCount`** &nbsp; uint32_t  
  
The number of local endpoints to which the message was sent. This value will always be greater than zero. If the sender specified an empty target endpoints array in the [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) call that resulted in this state change, ```receiverEndpointCount``` and ```receiverEndpoints``` will contain all local endpoints.
  
**`receiverEndpoints`** &nbsp; [PartyLocalEndpointArray](../typedefs.md)  
*array of size `receiverEndpointCount`*  
  
The local endpoints to which the message was sent. This array will never be empty. If the sender specified an empty target endpoints array in the [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) call that resulted in this state change, ```receiverEndpointCount``` and ```receiverEndpoints``` will contain all local endpoints.
  
**`options`** &nbsp; [PartyMessageReceivedOptions](../enums/partymessagereceivedoptions.md)  
  
The options used to send the message.
  
**`messageSize`** &nbsp; uint32_t  
  
The size of the message in bytes.
  
**`messageBuffer`** &nbsp; const void*  
*buffer of size `messageSize` bytes*  
  
The message buffer.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)
  
  
