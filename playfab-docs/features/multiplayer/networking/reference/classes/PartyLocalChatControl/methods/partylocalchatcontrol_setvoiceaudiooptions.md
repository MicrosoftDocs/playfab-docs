---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetVoiceAudioOptions"
description: Configures the voice audio options for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 05/08/2023
---

# PartyLocalChatControl::SetVoiceAudioOptions  

Configures the voice audio options for this chat control.  

## Syntax  
  
```cpp
PartyError SetVoiceAudioOptions(  
    PartyVoiceAudioOptions options  
)  
```  
  
### Parameters  
  
**`options`** &nbsp; [PartyVoiceAudioOptions](../../../enums/partyvoiceaudiooptions.md)  
  
The voice audio options.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This function is only supported on Android and iOS. Calls on other platforms will fail. <br /><br /> By default, a chat control is created with [PartyVoiceAudioOptions::None](../../../enums/partyvoiceaudiooptions.md) audio options.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
