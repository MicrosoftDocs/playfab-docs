---
author: ScottMunroMS
title: "PartyXblLocalChatUserDestroyedReason"
description: "Reasons a local chat user object might be destroyed."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblLocalChatUserDestroyedReason  

Reasons a local chat user object might be destroyed.    

## Syntax  
  
```cpp
enum class PartyXblLocalChatUserDestroyedReason    
{  
    UnauthorizedLocalChatUser = 0,  
    FailedToGetTokenAndSignatureForLocalChatUser = 1,  
    XboxLiveServiceTemporarilyUnavailable = 2,  
    InternetConnectivityError = 3,  
    XboxLiveUserNotSignedIn = 4,  
    UnknownError = 5,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| UnauthorizedLocalChatUser | The user is not authorized to communicate with the XBOX Live service.<br/><br/> On the Windows 10 version of the library, this failure can be caused by providing an invalid token or signature to [PartyXblManager::CompleteGetTokenAndSignatureRequest()](../classes/PartyXblManager/methods/partyxblmanager_completegettokenandsignaturerequest.md). |  
| FailedToGetTokenAndSignatureForLocalChatUser | A valid token and/or signature for an HTTP request could not be acquired. |  
| XboxLiveServiceTemporarilyUnavailable | The XBOX Live service is temporarily unavailable. |  
| InternetConnectivityError | The local device has internet connectivity issues that caused the operation to fail. |  
| XboxLiveUserNotSignedIn | The XBOX Live user associated with the PartyXblLocalChatUser is not currently signed-in on the device. |  
| UnknownError | An unknown error occurred. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
