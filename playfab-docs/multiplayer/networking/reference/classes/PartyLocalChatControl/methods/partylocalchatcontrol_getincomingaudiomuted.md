---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetIncomingAudioMuted"
description: Provides whether the incoming audio from the target chat control, in relation to the local chat control, has previously been muted.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetIncomingAudioMuted  

Provides whether the incoming audio from the target chat control, in relation to the local chat control, has previously been muted.  

## Syntax  
  
```cpp
PartyError GetIncomingAudioMuted(  
    const PartyChatControl* targetChatControl,  
    PartyBool* muted  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`muted`** &nbsp; [PartyBool*](../../../typedefs.md)  
*output*  
  
True if muted, false otherwise.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Audio muting determines whether incoming voice audio from the target chat control will be rendered to the local chat control.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
