---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetIncomingTextMuted"
description: Configures whether the incoming text messages from the target chat control, in relation to the local chat control, is muted.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/27/2019
---

# PartyLocalChatControl::SetIncomingTextMuted  

Configures whether the incoming text messages from the target chat control, in relation to the local chat control, is muted.  

## Syntax  
  
```cpp
PartyError SetIncomingTextMuted(  
    const PartyChatControl* targetChatControl,  
    PartyBool muted  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`muted`** &nbsp; [PartyBool](../../../typedefs.md)  
  
True to mute, false otherwise.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Chat text muting determines whether incoming chat text messages from the target chat control will be provided to the local chat control.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
