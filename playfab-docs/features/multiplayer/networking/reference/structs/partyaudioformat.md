---
author: jdeweyMSFT
title: "PartyAudioFormat"
description: "The format information needed to interpret Party audio data."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyAudioFormat  

The format information needed to interpret Party audio data.  

## Syntax  
  
```cpp
struct PartyAudioFormat {  
    uint32_t samplesPerSecond;  
    uint32_t channelMask;  
    uint16_t channelCount;  
    uint16_t bitsPerSample;  
    PartyAudioSampleType sampleType;  
    PartyBool interleaved;  
}  
```
  
### Members  
  
**`samplesPerSecond`** &nbsp; uint32_t  
  
Specifies the sample frequency at which each channel should be played or recorded.
  
**`channelMask`** &nbsp; uint32_t  
  
Overrides the assignment of channels in a multichannel audio stream to speaker positions.
  
**`channelCount`** &nbsp; uint16_t  
  
Specifies the number of channels of audio data.
  
**`bitsPerSample`** &nbsp; uint16_t  
  
Specifies the number of bits per sample. If this value is not byte-divisible, it will be assumed that the containing sample type is padded with bits to make it byte-divisble.
  
**`sampleType`** &nbsp; [PartyAudioSampleType](../enums/partyaudiosampletype.md)  
  
Specifies the sample type.
  
**`interleaved`** &nbsp; [PartyBool](../typedefs.md)  
  
A flag representing whether the multichannel audio data is interleaved for multi-channel formats.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
