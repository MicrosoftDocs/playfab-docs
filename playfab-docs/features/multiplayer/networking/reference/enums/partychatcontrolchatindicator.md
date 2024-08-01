---
author: jdeweyMSFT
title: "PartyChatControlChatIndicator"
description: "Audio states for a target chat control in relation to a local chat control."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2021
---

# PartyChatControlChatIndicator  

Audio states for a target chat control in relation to a local chat control.    

## Syntax  
  
```cpp
enum class PartyChatControlChatIndicator    
{  
    Silent = 0,  
    Talking = 1,  
    IncomingVoiceDisabled = 2,  
    IncomingCommunicationsMuted = 3,  
    NoRemoteInput = 4,  
    RemoteAudioInputMuted = 5,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Silent | The target chat control isn't generating voice audio. |  
| Talking | The target chat control is generating voice audio. |  
| IncomingVoiceDisabled | The local chat control is not configured to receive audio from the target chat control. |  
| IncomingCommunicationsMuted | The target chat control has been muted by the local chat control. |  
| NoRemoteInput | The target chat control does not have an audio input. |  
| RemoteAudioInputMuted | The target chat control has an audio input but has muted it. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
