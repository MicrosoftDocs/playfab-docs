---
author: jdeweyMSFT
title: "PartyDataBuffersReturnedStateChange"
description: "Information specific to the *DataBuffersReturned* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyDataBuffersReturnedStateChange  

Information specific to the *DataBuffersReturned* type of state change.  

## Syntax  
  
```cpp
struct PartyDataBuffersReturnedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyLocalEndpoint* localSenderEndpoint;  
    uint32_t dataBufferCount;  
    const PartyDataBuffer* dataBuffers;  
    void* messageIdentifier;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network on which the message was sent.
  
**`localSenderEndpoint`** &nbsp; [PartyLocalEndpoint](../classes/PartyLocalEndpoint/partylocalendpoint.md)*  
  
The local endpoint used to send the message.
  
**`dataBufferCount`** &nbsp; uint32_t  
  
The number of data buffers.
  
**`dataBuffers`** &nbsp; const [PartyDataBuffer](partydatabuffer.md)*  
*array of size `dataBufferCount`*  
  
The data buffers.
  
**`messageIdentifier`** &nbsp; void*  
  
The message identifier provided to the call associated with this state change.
  
## Remarks  
  
This state change is only returned if the corresponding call to [PartyLocalEndpoint::SendMessage()](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) included the [PartySendMessageOptions::DontCopyDataBuffers](../enums/partysendmessageoptions.md) option. This state change is returned once the data buffers passed with this call are no longer in use by the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalEndpoint::SendMessage](../classes/PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)
  
  
