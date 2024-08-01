---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioRenderVolume"
description: Provides the volume setting for audio received from a target chat control that will be used for the local chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetAudioRenderVolume  

Provides the volume setting for audio received from a target chat control that will be used for the local chat control.  

## Syntax  
  
```cpp
PartyError GetAudioRenderVolume(  
    const PartyChatControl* targetChatControl,  
    float* volume  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`volume`** &nbsp; float*  
*output*  
  
The volume.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The volume is a fractional percentage between 0.0 (quietest possible) and 1.0 (the standard chat volume). <br /><br /> This is a local setting that takes effect immediately.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
