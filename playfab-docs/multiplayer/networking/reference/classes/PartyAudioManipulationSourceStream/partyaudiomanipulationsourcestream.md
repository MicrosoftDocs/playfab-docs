---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream"
description: The management class for obtaining audio from an audio source stream.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyAudioManipulationSourceStream  

The management class for obtaining audio from an audio source stream.  

## Syntax  
  
```cpp  
class PartyAudioManipulationSourceStream  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetConfiguration](methods/partyaudiomanipulationsourcestream_getconfiguration.md) | Retrieves the source stream configuration. |  
| [GetFormat](methods/partyaudiomanipulationsourcestream_getformat.md) | Retrieves the format of the buffers that will be provided by [PartyAudioManipulationSourceStream::GetNextBuffer()](methods/partyaudiomanipulationsourcestream_getnextbuffer.md). |  
| [GetAvailableBufferCount](methods/partyaudiomanipulationsourcestream_getavailablebuffercount.md) | Retrieves the total number of buffers available to retrieve from this stream via [PartyAudioManipulationSourceStream::GetNextBuffer()](methods/partyaudiomanipulationsourcestream_getnextbuffer.md). |  
| [GetNextBuffer](methods/partyaudiomanipulationsourcestream_getnextbuffer.md) | Gets the next buffer available in the stream. |  
| [ReturnBuffer](methods/partyaudiomanipulationsourcestream_returnbuffer.md) | Tells the library it can reclaim memory associated with this buffer. |  
| [GetCustomContext](methods/partyaudiomanipulationsourcestream_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this source stream object. |  
| [SetCustomContext](methods/partyaudiomanipulationsourcestream_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this source stream object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  

  
  
  
