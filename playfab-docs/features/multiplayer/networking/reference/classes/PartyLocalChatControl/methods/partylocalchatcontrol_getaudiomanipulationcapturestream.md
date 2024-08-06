---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioManipulationCaptureStream"
description: Retrieves the audio manipulation capture stream associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2020
---

# PartyLocalChatControl::GetAudioManipulationCaptureStream  

Retrieves the audio manipulation capture stream associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetAudioManipulationCaptureStream(  
    PartyAudioManipulationSinkStream** stream  
)  
```  
  
### Parameters  
  
**`stream`** &nbsp; [PartyAudioManipulationSinkStream**](../../PartyAudioManipulationSinkStream/partyaudiomanipulationsinkstream.md)  
*library-allocated output*  
  
The output stream.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This stream represents acts as the associated chat control's audio input, i.e. the audio that will be treated as the local chat control's voice and sent to other chat controls. Typically, the app will retrieve audio from the voice manipulation stream stream via PartyAudioManipulationSourceStream::GetNextBuffer(), process the audio using app logic, and then submit the audio back to the library via this stream. <br /><br /> Audio that is submitted to this stream via [PartyAudioManipulationSinkStream::SubmitBuffer()](../../PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_submitbuffer.md) will be transcribed via speech-to-text, if transcription options configured via [PartyLocalChatControl::SetTranscriptionOptions](partylocalchatcontrol_settranscriptionoptions.md) indicates that audio associated the sink's chat control should be.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
