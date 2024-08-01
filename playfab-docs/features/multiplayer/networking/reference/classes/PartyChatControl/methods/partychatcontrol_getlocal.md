---
author: jdeweyMSFT
title: "PartyChatControl::GetLocal"
description: Gets the [PartyLocalChatControl](../../PartyLocalChatControl/partylocalchatcontrol.md) version of this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyChatControl::GetLocal  

Gets the [PartyLocalChatControl](../../PartyLocalChatControl/partylocalchatcontrol.md) version of this chat control.  

## Syntax  
  
```cpp
PartyError GetLocal(  
    PartyLocalChatControl** localChatControl  
)  
```  
  
### Parameters  
  
**`localChatControl`** &nbsp; [PartyLocalChatControl**](../../PartyLocalChatControl/partylocalchatcontrol.md)  
*library-allocated output, may return nullptr*  
  
The local version of this chat control object, or nullptr if this is not a local chat control.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
