---
author: jdeweyMSFT
title: "PartyLocalChatControl::SendText"
description: Transmits a chat text string to each specified target chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyLocalChatControl::SendText  

Transmits a chat text string to each specified target chat control.  

## Syntax  
  
```cpp
PartyError SendText(  
    uint32_t targetChatControlCount,  
    PartyChatControlArray targetChatControls,  
    PartyString chatText,  
    uint32_t dataBufferCount,  
    const PartyDataBuffer* dataBuffers  
)  
```  
  
### Parameters  
  
**`targetChatControlCount`** &nbsp; uint32_t  
  
The number of target chat controls in the `targetChatControls` array.  
  
**`targetChatControls`** &nbsp; [PartyChatControlArray](../../../typedefs.md)  
*input array of size `targetChatControlCount`*  
  
The `targetChatControlCount` entry array of target PartyChatControls.  
  
**`chatText`** &nbsp; [PartyString](../../../typedefs.md)  
  
The text to send.  
  
**`dataBufferCount`** &nbsp; uint32_t  
  
The number of buffer structures provided in the `dataBuffers` array.  
  
**`dataBuffers`** &nbsp; [PartyDataBuffer*](../../../structs/partydatabuffer.md)  
*input array of size `dataBufferCount`*  
  
The `dataBufferCount` entry array of PartyDataBuffer structures describing an auxiliary message payload to send. This is ignored when `dataBufferCount` is zero.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Sending chat text to local chat controls is not currently supported. If the array of target chat controls includes any local targets, this call will synchronously fail. <br /><br /> There is no guaranteed translation, localization, or offensive language filtering of the text content; the chat text string will be presented with the text as is.   <br /><br /> The text string will only be delivered to target chat controls that have configured their own instances to receive text messages from the local chat control via [PartyLocalChatControl::SetPermissions()](partylocalchatcontrol_setpermissions.md).   <br /><br /> If a target chat control is not connected to at least one network in common with the source chat control, the text string will not be delivered. This is possible if there are two local chat controls. A target chat control connected to one of the local chat controls may not be connected to all other local chat controls.   <br /><br /> The PartyDataBuffer structures in the `dataBuffers` array are for auxiliary data associated with the chat text, such as metadata indicating the color that should be used to render the text or a binary blob containing image data for an icon to render along with the chat text. For sending game data that is unrelated to text chat, see [PartyLocalEndpoint::SendMessage()](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md), a messaging option that exposes finer control over message transmission behavior.   <br /><br /> Callers provide 0 or more PartyDataBuffer structures in the `dataBuffers` array. The memory that the structures reference does not have to be contiguous, making it easy to have a fixed header buffer followed by a variable payload, for example. The buffers will be assembled in order, transmitted, and delivered to the targeted chat controls as a single contiguous data block, separate from the chat text, in a [PartyChatTextReceivedStateChange](../../../structs/partychattextreceivedstatechange.md). The Party library does not expend bandwidth transmitting metadata to describe the original PartyDataBuffer segmentation.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyChatTextReceivedStateChange](../../../structs/partychattextreceivedstatechange.md)
  
  
