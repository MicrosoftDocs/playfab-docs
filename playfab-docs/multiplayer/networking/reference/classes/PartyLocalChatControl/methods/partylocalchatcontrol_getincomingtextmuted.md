---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetIncomingTextMuted"
description: Provides whether the incoming text messages from the target chat control, in relation to the local chat control, has previously been muted.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetIncomingTextMuted  

Provides whether the incoming text messages from the target chat control, in relation to the local chat control, has previously been muted.  

## Syntax  
  
```cpp
PartyError GetIncomingTextMuted(  
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
  
Chat text muting determines whether incoming chat text messages from the target chat control will be provided to the local chat control.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
