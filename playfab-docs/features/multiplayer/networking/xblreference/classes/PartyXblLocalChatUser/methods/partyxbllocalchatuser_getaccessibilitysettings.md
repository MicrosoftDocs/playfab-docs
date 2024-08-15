---
author: ScottMunroMS
title: "PartyXblLocalChatUser::GetAccessibilitySettings"
description: Returns the accessibility settings associated with this chat user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyXblLocalChatUser::GetAccessibilitySettings  

Returns the accessibility settings associated with this chat user.  

## Syntax  
  
```cpp
PartyError GetAccessibilitySettings(  
    PartyXblAccessibilitySettings* settings  
)  
```  
  
### Parameters  
  
**`settings`** &nbsp; [PartyXblAccessibilitySettings*](../../../structs/partyxblaccessibilitysettings.md)  
*output*  
  
The output accessibility settings.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This function will fail until a [PartyXblCreateLocalChatUserCompletedStateChange](../../../structs/partyxblcreatelocalchatusercompletedstatechange.md) is provided by [PartyXblManager::StartProcessingStateChanges()](../../PartyXblManager/methods/partyxblmanager_startprocessingstatechanges.md).
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblLocalChatUser](../partyxbllocalchatuser.md)  
[PartyXblCreateLocalChatUserCompletedStateChange](../../../structs/partyxblcreatelocalchatusercompletedstatechange.md)
  
  
