---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::GetNextBuffer"
description: Gets the next buffer available in the stream.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/13/2020
---

# PartyAudioManipulationSourceStream::GetNextBuffer  

Gets the next buffer available in the stream.  

## Syntax  
  
```cpp
PartyError GetNextBuffer(  
    PartyMutableDataBuffer* buffer  
)  
```  
  
### Parameters  
  
**`buffer`** &nbsp; [PartyMutableDataBuffer*](../../../structs/partymutabledatabuffer.md)  
*output*  
  
The output buffer. If no buffer is available, the PartyMutableDataBuffer's *bufferByteCount* field is 0, and its *buffer* field is nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
When voice activity is detected, a new buffer is available every 40 ms. Otherwise, no buffers are available. Buffers retrieved by this method must be returned to the library via [PartyAudioManipulationSourceStream::ReturnBuffer()](partyaudiomanipulationsourcestream_returnbuffer.md) when they're done being used. <br /><br /> The total number of buffers instantaneously available can be retrieved via [PartyAudioManipulationSourceStream::GetAvailableBufferCount()](partyaudiomanipulationsourcestream_getavailablebuffercount.md). Multiple buffers can be retrieved in succession before any are returned.   <br /><br /> Each buffer is in the format specified by [PartyAudioManipulationSourceStream::GetFormat()](partyaudiomanipulationsourcestream_getformat.md).   <br /><br /> A mutable data buffer is provided so that the app can optionally modify the audio in place.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyAudioManipulationSourceStream::GetFormat](partyaudiomanipulationsourcestream_getformat.md)  
[PartyAudioManipulationSourceStream::ReturnBuffer](partyaudiomanipulationsourcestream_returnbuffer.md)
  
  
