---
author: jdeweyMSFT
title: "PartyAudioManipulationSinkStreamConfiguration"
description: "The configuration information needed to set up an audio sink stream."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyAudioManipulationSinkStreamConfiguration  

The configuration information needed to set up an audio sink stream.  

## Syntax  
  
```cpp
struct PartyAudioManipulationSinkStreamConfiguration {  
    PartyAudioFormat* format;  
    uint32_t maxTotalAudioBufferSizeInMilliseconds;  
}  
```
  
### Members  
  
**`format`** &nbsp; [PartyAudioFormat](partyaudioformat.md)*  
*may be nullptr*  
  
Optionally specifies the format of the audio that will be submitted to the sink stream.
  
If this value is nullptr, the sink stream will be configured to use the format most efficient for the library. The format can be queried via [PartyAudioManipulationSinkStream::GetFormat()](../classes/PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_getformat.md).
  
**`maxTotalAudioBufferSizeInMilliseconds`** &nbsp; uint32_t  
  
The maximum total size of audio buffers that can concurrently exist for this queue, in milliseconds.
  
This defines the limit for the total amount of audio internally queued by the sink stream, but not yet processed by the library. When this limit is reached, the sink stream will stop accepting additional buffers. <br /><br /> This value should be chosen based on how frequently the game will submit buffers to the sink stream and how large those buffers will be. Because the library processes audio in 40 milliseconds intervals, the minimum is 40 milliseconds. Most games will find 200 milliseconds to be a reasonable value.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::ConfigureAudioManipulationCaptureStream](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md)  
[PartyLocalChatControl::ConfigureAudioManipulationRenderStream](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md)
  
  
