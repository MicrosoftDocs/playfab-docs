---
author: ScottMunroMS
title: "PartyXblLocalChatUserDestroyedReason"
description: "Reasons a local chat user object might be destroyed."
ms.author: scmunro
ms.topic: reference
ms.service: playfab
ms.date: 11/01/2019
---

# PartyXblLocalChatUserDestroyedReason  

Reasons a local chat user object might be destroyed.    

## Syntax  
  
```cpp
enum class PartyXblLocalChatUserDestroyedReason    
{  
    UnauthorizedLocalChatUser,  
    FailedToGetTokenAndSignatureForLocalChatUser,  
    XboxLiveServiceTemporarilyUnavailable,  
    InternetConnectivityError,  
    XboxLiveUserNotSignedIn,  
    UnknownError,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| UnauthorizedLocalChatUser | The user is not authorized to communicate with the Xbox Live service.<br/><br/> On the Windows 10 platform this can be caused by an invalid token or signature provided to the library by calling [PartyXblManager::CompleteGetTokenAndSignatureRequest()](../classes/PartyXblManager/methods/partyxblmanager_completegettokenandsignaturerequest.md). |  
| FailedToGetTokenAndSignatureForLocalChatUser | A valid token and/or signature for an HTTP request could not be acquired. |  
| XboxLiveServiceTemporarilyUnavailable | The Xbox Live service is temporarily unavailable. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
| XboxLiveUserNotSignedIn | The Xbox Live user associated with the PartyXblLocalChatUser is not currently signed-in on the device. |  
| UnknownError | An unknown error occurred. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
