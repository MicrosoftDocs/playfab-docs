---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetPermissions"
description: Sets the chat permissions between the local chat control and a target chat control.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyLocalChatControl::SetPermissions  

Sets the chat permissions between the local chat control and a target chat control.  

## Syntax  
  
```cpp
PartyError SetPermissions(  
    const PartyChatControl* targetChatControl,  
    PartyChatPermissionOptions chatPermissionOptions  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`chatPermissionOptions`** &nbsp; [PartyChatPermissionOptions](../../../enums/partychatpermissionoptions.md)  
  
The chat permission options.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The target chat control can be either remote or local. The default permission set is [PartyChatPermissionOptions::None](../../../enums/partychatpermissionoptions.md). This setting is local only; if I use this to send voice chat to a remote chat control, they must also have configured themselves to allow voice chat from this chat control. <br /><br /> There is no explicit permission for sending chat text; that should be considered when constructing the list of target chat controls when calling [SendText()](partylocalchatcontrol_sendtext.md).   <br /><br /> The Party library does no enforcement of platform restrictions. Platform restrictions must be considered when setting the chat permissions between two chat controls.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
