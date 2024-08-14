---
author: jdeweyMSFT
title: "PartyAudioManipulationSinkStream"
description: The management class for submitting audio to an audio sink stream.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyAudioManipulationSinkStream  

The management class for submitting audio to an audio sink stream.  

## Syntax  
  
```cpp  
class PartyAudioManipulationSinkStream  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetConfiguration](methods/partyaudiomanipulationsinkstream_getconfiguration.md) | Retrieves the sink stream configuration. |  
| [GetFormat](methods/partyaudiomanipulationsinkstream_getformat.md) | Retrieves the format of the buffers that will be submitted to [PartyAudioManipulationSinkStream::SubmitBuffer()](methods/partyaudiomanipulationsinkstream_submitbuffer.md). |  
| [SubmitBuffer](methods/partyaudiomanipulationsinkstream_submitbuffer.md) | Submits audio to be processed by this sink. Depending on the type of sink, this audio may be transmitted to other chat controls or rendered to the audio output. |  
| [GetCustomContext](methods/partyaudiomanipulationsinkstream_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this sink stream object. |  
| [SetCustomContext](methods/partyaudiomanipulationsinkstream_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this sink stream object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  

  
  
  
