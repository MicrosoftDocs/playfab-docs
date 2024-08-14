---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::GetAvailableBufferCount"
description: Retrieves the total number of buffers available to retrieve from this stream via [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/13/2020
---

# PartyAudioManipulationSourceStream::GetAvailableBufferCount  

Retrieves the total number of buffers available to retrieve from this stream via [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).  

## Syntax  
  
```cpp
PartyError GetAvailableBufferCount(  
    uint32_t* count  
)  
```  
  
### Parameters  
  
**`count`** &nbsp; uint32_t*  
*output*  
  
The output count of available buffers.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This can be useful if the caller prefers to send audio through their pipeline in batches of buffers. Because this buffer count is limited by the max audio queue size specified via [PartyChatControl::ConfigureAudioManipulationVoiceStream()](../../PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md), callers should give their audio processing pipeline ample time to process the buffers and return them to [PartyAudioManipulationSourceStream::ReturnBuffer()](partyaudiomanipulationsourcestream_returnbuffer.md) to prevent dropped audio.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  

  
  
