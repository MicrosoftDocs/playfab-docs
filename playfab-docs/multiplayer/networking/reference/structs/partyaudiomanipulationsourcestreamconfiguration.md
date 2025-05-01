---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStreamConfiguration"
description: "The configuration information needed to set up an audio source stream."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyAudioManipulationSourceStreamConfiguration  

The configuration information needed to set up an audio source stream.  

## Syntax  
  
```cpp
struct PartyAudioManipulationSourceStreamConfiguration {  
    PartyAudioFormat* format;  
    uint32_t maxTotalAudioBufferSizeInMilliseconds;  
}  
```
  
### Members  
  
**`format`** &nbsp; [PartyAudioFormat](partyaudioformat.md)*  
*may be nullptr*  
  
Optionally specifies the format of the audio that should be produced by the source stream.
  
If this value is nullptr, the source stream will produce audio in the format most efficient for the library. The format can be queried via [PartyAudioManipulationSourceStream::GetFormat()](../classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_getformat.md).
  
**`maxTotalAudioBufferSizeInMilliseconds`** &nbsp; uint32_t  
  
The maximum total size of audio buffers that can concurrently exist for this queue, in milliseconds.
  
This defines the limit for the total amount of audio internally queued by the source stream, but not yet retrieved via [PartyAudioManipulationSourceStream::GetNextBuffer](../classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_getnextbuffer.md), plus the total amount of audio retrieved by the app, but not yet returned to the library via [PartyAudioManipulationSourceStream::ReturnBuffer](../classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_returnbuffer.md). When this total is reached, the source stream will stop producing additional buffers. <br /><br /> Because the library processes audio in 40 millisecond intervals, the effective maximum is the nearest multiple of 40 less than the specified maximum. The minimum is 40 milliseconds.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyChatControl::ConfigureAudioManipulationVoiceStream](../classes/PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md)
  
  
