---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetTextChatOptions"
description: Configures the text chat options associated with text chat for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PartyLocalChatControl::SetTextChatOptions  

Configures the text chat options associated with text chat for this chat control.  

## Syntax  
  
```cpp
PartyError SetTextChatOptions(  
    PartyTextChatOptions options,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`options`** &nbsp; [PartyTextChatOptions](../../../enums/partytextchatoptions.md)  
  
Options associated with text chat, such as whether incoming text chat should be translated.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the chat text options began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
