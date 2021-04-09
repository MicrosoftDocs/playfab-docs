---
author: jdeweyMSFT
title: "PartyChatControlChatIndicator"
description: "Audio states for a target chat control in relation to a local chat control."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 04/07/2021
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
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Silent | The target chat control isn't generating voice audio. |  
| Talking | The target chat control is generating voice audio. |  
| IncomingVoiceDisabled | The local chat control is not configured to receive audio from the target chat control. |  
| IncomingCommunicationsMuted | The target chat control has been muted by the local chat control. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
