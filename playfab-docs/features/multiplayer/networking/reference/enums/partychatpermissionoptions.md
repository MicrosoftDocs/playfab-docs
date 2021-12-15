---
author: jdeweyMSFT
title: "PartyChatPermissionOptions"
description: "Options for defining the communication relationship between two chat controls."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyChatPermissionOptions  

Options for defining the communication relationship between two chat controls.    

## Syntax  
  
```cpp
enum class PartyChatPermissionOptions    
{  
    None = 0x0,  
    SendAudio = 0x1,  
    ReceiveAudio = 0x2,  
    ReceiveText = 0x4,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No chat communication between the local PartyChatControl and the target PartyChatControl is allowed. |  
| SendAudio | Audio communication from the local PartyChatControl to the target PartyChatControl is allowed. |  
| ReceiveAudio | Audio communication from the target PartyChatControl to the local PartyChatControl is allowed. |  
| ReceiveText | Text communication from the target PartyChatControl to the local PartyChatControl is allowed. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
