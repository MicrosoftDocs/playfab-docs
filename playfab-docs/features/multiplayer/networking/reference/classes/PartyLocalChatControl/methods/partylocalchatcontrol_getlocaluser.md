---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetLocalUser"
description: Gets the local user associated with this local chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetLocalUser  

Gets the local user associated with this local chat control.  

## Syntax  
  
```cpp
PartyError GetLocalUser(  
    PartyLocalUser** localUser  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser**](../../PartyLocalUser/partylocaluser.md)  
*library-allocated output*  
  
The output local user.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
