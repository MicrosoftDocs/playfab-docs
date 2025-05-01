---
author: jdeweyMSFT
title: "PartyAudioOutputState"
description: "States of an audio output associated with a local chat control."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyAudioOutputState  

States of an audio output associated with a local chat control.    

## Syntax  
  
```cpp
enum class PartyAudioOutputState    
{  
    NoOutput = 0,  
    Initialized = 1,  
    NotFound = 2,  
    UnsupportedFormat = 3,  
    AlreadyInUse = 4,  
    UnknownError = 5,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoOutput | No audio output was specified. |  
| Initialized | The audio output was successfully initialized. |  
| NotFound | The audio output wasn't found.<br/><br/> This can occur if the output was removed while in use. When in this state, the chat control will subscribe to audio device changes and use the specified output if it can be found at a later time. |  
| UnsupportedFormat | The output doesn't provide a supported sample rate. |  
| AlreadyInUse | The audio output device is already in use by another chat control. |  
| UnknownError | Initializing the output resulted in an unknown error. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
