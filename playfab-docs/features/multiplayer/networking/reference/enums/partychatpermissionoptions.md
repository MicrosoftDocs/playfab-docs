---
author: jdeweyMSFT
title: "PartyChatPermissionOptions"
description: "Options for defining the communication relationship between two chat controls."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyChatPermissionOptions  

Options for defining the communication relationship between two chat controls.    

## Syntax  
  
```cpp
enum class PartyChatPermissionOptions    
{  
    None = 0x0,  
    SendMicrophoneAudio = 0x1,  
    SendTextToSpeechAudio = 0x2,  
    SendAudio = SendMicrophoneAudio | SendTextToSpeechAudio,  
    ReceiveMicrophoneAudio = 0x4,  
    ReceiveTextToSpeechAudio = 0x8,  
    ReceiveAudio = ReceiveMicrophoneAudio | ReceiveTextToSpeechAudio,  
    ReceiveText = 0x10,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No chat communication between the local chat control and the target chat control is allowed. |  
| SendMicrophoneAudio | Microphone audio communication from the local chat control to the target chat control is allowed.<br/><br/> For most game scenarios, either all or no audio communication should be sent and ```SendAudio``` should be used instead. This flag can be used for game scenarios where microphone audio should be sent to the target chat control, but other types of audio should not. <br /><br /> Audio optionally submitted to a capture sink via [PartyAudioManipulationSinkStream::SubmitBuffer()](../classes/PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_submitbuffer.md) is treated as microphone audio when applying chat permissions and determining which chat controls should receive the audio. |  
| SendTextToSpeechAudio | Text-to-speech audio communication from the local chat control to the target chat control is allowed.<br/><br/> For most game scenarios, either all or no audio communication should be sent and ```SendAudio``` should be used instead. This flag can be used for game scenarios where text-to-speech audio should be sent to the target chat control, but other types of audio should not. |  
| SendAudio | All audio communication from the local chat control to the target chat control is allowed.<br/><br/> This flag is equivalent to ```SendMicrophoneAudio | SendTextToSpeechAudio```. |  
| ReceiveMicrophoneAudio | Microphone audio communication from the target chat control to the local chat control is allowed.<br/><br/> For most game scenarios, either all or no audio communication should be received and ```ReceiveAudio``` should be used instead. This flag can be used for game scenarios where microphone audio should be received from the target chat control, but other types of audio should not. <br /><br /> Audio optionally submitted to a capture sink via [PartyAudioManipulationSinkStream::SubmitBuffer()](../classes/PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_submitbuffer.md) is treated as microphone audio when applying chat permissions and determining which chat controls should receive the audio. |  
| ReceiveTextToSpeechAudio | Text-to-speech audio communication from the target chat control to the local chat control is allowed.<br/><br/> For most game scenarios, either all or no audio communication should be received and ```ReceiveAudio``` should be used instead. This flag can be used for game scenarios where text-to-speech audio should be received from the target chat control, but other types of audio should not. |  
| ReceiveAudio | Audio communication from the target chat control to the local chat control is allowed.<br/><br/> This flag is equivalent to ```ReceiveMicrophoneAudio | ReceiveTextToSpeechAudio```. |  
| ReceiveText | Text communication from the target chat control to the local chat control is allowed. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
