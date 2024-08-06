---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetPermissions"
description: Gets the voice communication relationship between the local chat control and a target chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetPermissions  

Gets the voice communication relationship between the local chat control and a target chat control.  

## Syntax  
  
```cpp
PartyError GetPermissions(  
    const PartyChatControl* targetChatControl,  
    PartyChatPermissionOptions* chatPermissionOptions  
)  
```  
  
### Parameters  
  
**`targetChatControl`** &nbsp; [PartyChatControl*](../../PartyChatControl/partychatcontrol.md)  
  
The target chat control.  
  
**`chatPermissionOptions`** &nbsp; [PartyChatPermissionOptions*](../../../enums/partychatpermissionoptions.md)  
*output*  
  
The output chat permission options.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
