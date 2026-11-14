---
author: ScottMunroMS
title: "PartyXblManager::CreateLocalChatUser"
description: Queues an asynchronous attempt to create a local chat user. Privacy and privilege information related to this user will be tracked by the helper library.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::CreateLocalChatUser  

Queues an asynchronous attempt to create a local chat user. Privacy and privilege information related to this user will be tracked by the helper library.  

## Syntax  
  
```cpp
PartyError CreateLocalChatUser(  
    uint64_t xboxUserId,  
    void* asyncIdentifier,  
    PartyXblLocalChatUser** localChatUser  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t  
  
The XBOX user ID associated with the local chat user.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser**](../../PartyXblLocalChatUser/partyxbllocalchatuser.md)  
*optional, library-allocated output*  
  
The output local chat user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation. If the call succeeds and `localChatUser` isn't `nullptr`, `localChatUser` receives the local chat user object right away, before the operation completes. When the operation completes, [StartProcessingStateChanges()](partyxblmanager_startprocessingstatechanges.md) provides a [PartyXblCreateLocalChatUserCompletedStateChange](../../../structs/partyxblcreatelocalchatusercompletedstatechange.md) that reports whether the operation succeeded and contains the `asyncIdentifier` value that you passed to this method.

Until that state change is provided, [GetAccessibilitySettings()](../../PartyXblLocalChatUser/methods/partyxbllocalchatuser_getaccessibilitysettings.md) and [GetCrossNetworkCommunicationPrivacySetting()](../../PartyXblLocalChatUser/methods/partyxbllocalchatuser_getcrossnetworkcommunicationprivacysetting.md) fail for the local chat user.

If a local chat user with the same `xboxUserId` already exists, this method fails with error `0x5001`. For more information, see [PlayFab Party XBOX Live Helper error codes](../../../partyxblerrors.md).
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblCreateLocalChatUserCompletedStateChange](../../../structs/partyxblcreatelocalchatusercompletedstatechange.md)  
[PartyXblManager::DestroyChatUser](partyxblmanager_destroychatuser.md)  

  
  
