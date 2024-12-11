---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetTextChatOptions"
description: Provides the text chat options associated with text chat for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetTextChatOptions  

Provides the text chat options associated with text chat for this chat control.  

## Syntax  
  
```cpp
PartyError GetTextChatOptions(  
    PartyTextChatOptions* options  
)  
```  
  
### Parameters  
  
**`options`** &nbsp; [PartyTextChatOptions*](../../../enums/partytextchatoptions.md)  
*output*  
  
Options associated with text chat.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
