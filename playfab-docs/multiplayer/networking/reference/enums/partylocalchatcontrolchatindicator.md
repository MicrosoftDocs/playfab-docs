---
author: jdeweyMSFT
title: "PartyLocalChatControlChatIndicator"
description: "Audio states for a local chat control."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyLocalChatControlChatIndicator  

Audio states for a local chat control.    

## Syntax  
  
```cpp
enum class PartyLocalChatControlChatIndicator    
{  
    Silent = 0,  
    Talking = 1,  
    AudioInputMuted = 2,  
    NoAudioInput = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Silent | The local chat control is not generating voice audio. |  
| Talking | The local chat control is generating voice audio. |  
| AudioInputMuted | The local chat control's audio input is muted. |  
| NoAudioInput | Either no audio input has been specified for the local chat control, or initializing the specified input failed.<br/><br/> This may be due to the user removing a physical audio device, or an error during audio device initialization. A [PartyLocalChatAudioInputChangedStateChange](../structs/partylocalchataudioinputchangedstatechange.md) or [PartyLocalChatAudioOutputChangedStateChange](../structs/partylocalchataudiooutputchangedstatechange.md) with more granular information will have been provided prior to the chat indicator changing to this value. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
