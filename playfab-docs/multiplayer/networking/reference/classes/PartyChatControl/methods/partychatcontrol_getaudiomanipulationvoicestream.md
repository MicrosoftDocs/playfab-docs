---
author: jdeweyMSFT
title: "PartyChatControl::GetAudioManipulationVoiceStream"
description: Retrieves the audio manipulation voice stream associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyChatControl::GetAudioManipulationVoiceStream  

Retrieves the audio manipulation voice stream associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetAudioManipulationVoiceStream(  
    PartyAudioManipulationSourceStream** sourceStream  
)  
```  
  
### Parameters  
  
**`sourceStream`** &nbsp; [PartyAudioManipulationSourceStream**](../../PartyAudioManipulationSourceStream/partyaudiomanipulationsourcestream.md)  
*library-allocated output*  
  
The source stream.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
In a local chat control, the stream represents the voice audio detected by the local audio input. Audio provided by this stream has already been preprocessed with Voice Activity Detection (VAD) and Automatic Gain Control (AGC). Audio is only provided when voice activity is detected. Typically, the app retrieves audio from this stream via PartyAudioManipulationSourceStream::GetNextBuffer(), process the audio using app logic, and then submits the audio back to the library. The audio is submitted back to the library by retrieving the voice sink stream via PartyLocalChatControl::GetAudioManipulationCaptureStream() and then submitting the buffer via [PartyAudioManipulationSinkStream::SubmitBuffer()](../../PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_submitbuffer.md). <br /><br /> Audio generated via [PartyLocalChatControl::SynthesizeTextToSpeech()](../../PartyLocalChatControl/methods/partylocalchatcontrol_synthesizetexttospeech.md) of type [PartySynthesizeTextToSpeechType::VoiceChat](../../../enums/partysynthesizetexttospeechtype.md) is provided via this source stream, because such audio acts as the associated user's voice.   <br /><br /> Audio retrieved via this stream hasn't been transcribed via speech-to-text for voice chat transcription. Audio that is submitted to a sink stream via PartyAudioManipulationSinkStream::SubmitBuffer() is transcribed, if transcription options configured via [PartyLocalChatControl::SetTranscriptionOptions](../../PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) indicates that audio associated the sink's chat control should be.   <br /><br /> In a remote chat control, the stream represents the chat control's incoming voice audio. Typically, the app retrieves audio from the voice streams associated with all remote chat controls via PartyAudioManipulationSourceStream::GetNextBuffer(), process and mix each buffer into a single audio stream, and then submits the mixed stream to be rendered by each appropriate sink stream. Each render stream can be retrieved via PartyLocalChatControl::GetAudioManipulationRenderStream().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
