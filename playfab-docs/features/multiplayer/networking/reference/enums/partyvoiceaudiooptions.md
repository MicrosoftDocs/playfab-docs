---
author: jdeweyMSFT
title: "PartyVoiceAudioOptions"
description: "Voice audio options."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 05/08/2023
---

# PartyVoiceAudioOptions  

Voice audio options.    

## Syntax  
  
```cpp
enum class PartyVoiceAudioOptions  : uint32_t  
{  
    None = 0x0,  
    NoiseSuppression = 0x1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No voice audio options are selected. |  
| NoiseSuppression | Enable noise suppression on audio captured from a local chat control.<br/><br/> This option is only supported on iOS and Android. Using this option on any other platform will fail. <br /><br /> Enabling noise suppression eliminates noise captured from the local chat control to be transmitted to remote chat controls.   <br /><br /> Using this option requires packaging inside your application the model file named PartyDeepNoiseSuppressionModel.fpie that is shipped with PlayFab Party. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetVoiceAudioOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setvoiceaudiooptions.md)  
[PartyLocalChatControl::GetVoiceAudioOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getvoiceaudiooptions.md)
  
  
