---
author: ScottMunroMS
title: "PartyXblStateChangeResult"
description: "Results for Party Xbox Live Helper library operations that generate state changes."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/14/2023
---

# PartyXblStateChangeResult  

Results for Party Xbox Live Helper library operations that generate state changes.    

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
| UserNotAuthorized | The Xbox Live user or PlayFab Entity associated with the PartyXblLocalChatUser is not authorized to perform this request. |  
| LoginToPlayFabThrottled | The operation failed because too many logins have been attempted for this title. |  
| PartyServiceError | The operation failed because of an unexpected error in the Party Service. |  
| XboxLiveServiceTemporarilyUnavailable | The Xbox Live service is temporarily unavailable. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
| PlayFabRateLimitExceeded | The rate limit for the PlayFab Service has been reached. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
