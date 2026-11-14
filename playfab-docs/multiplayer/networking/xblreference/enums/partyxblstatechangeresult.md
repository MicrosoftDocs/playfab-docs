---
author: ScottMunroMS
title: "PartyXblStateChangeResult"
description: "Results for Party XBOX Live Helper library operations that generate state changes."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblStateChangeResult  

Results for Party XBOX Live Helper library operations that generate state changes.    

## Syntax  
  
```cpp
enum class PartyXblStateChangeResult    
{  
    Succeeded = 0,  
    UnknownError = 1,  
    CanceledByTitle = 2,  
    UserNotAuthorized = 3,  
    LoginToPlayFabThrottled = 4,  
    PartyServiceError = 5,  
    XboxLiveServiceTemporarilyUnavailable = 6,  
    InternetConnectivityError = 7,  
    PlayFabRateLimitExceeded = 8,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Succeeded | The operation succeeded. |  
| UnknownError | An unknown error occurred. |  
| CanceledByTitle | Another title operation canceled this operation. |  
| UserNotAuthorized | The XBOX Live user or PlayFab Entity associated with the PartyXblLocalChatUser is not authorized to perform this request. |  
| LoginToPlayFabThrottled | The operation failed because too many logins have been attempted for this title. |  
| PartyServiceError | The operation failed because of an unexpected error in the Party Service. |  
| XboxLiveServiceTemporarilyUnavailable | The XBOX Live service is temporarily unavailable. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
| PlayFabRateLimitExceeded | The rate limit for the PlayFab Service has been reached. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
