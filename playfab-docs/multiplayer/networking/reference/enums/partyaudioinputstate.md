---
author: jdeweyMSFT
title: "PartyAudioInputState"
description: "States of an audio input associated with a local chat control."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyAudioInputState  

States of an audio input associated with a local chat control.    

## Syntax  
  
```cpp
enum class PartyAudioInputState    
{  
    NoInput = 0,  
    Initialized = 1,  
    NotFound = 2,  
    UserConsentDenied = 3,  
    UnsupportedFormat = 4,  
    AlreadyInUse = 5,  
    UnknownError = 6,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoInput | No audio input was specified. |  
| Initialized | The audio input was successfully initialized. |  
| NotFound | The audio input wasn't found.<br/><br/> This can occur if the input was removed while in use. When in this state, the chat control will subscribe to audio device changes and use the specified input if it can be found at a later time. |  
| UserConsentDenied | The user didn't give permission to access the input. |  
| UnsupportedFormat | The input doesn't provide a supported format. |  
| AlreadyInUse | The audio input device is already in use by another chat control. |  
| UnknownError | Initializing the input resulted in an unknown error. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
