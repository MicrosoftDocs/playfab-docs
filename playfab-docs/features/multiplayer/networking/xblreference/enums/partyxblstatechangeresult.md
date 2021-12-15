---
author: alexatxbox
title: "PartyXblStateChangeResult"
description: "Results for operations that generate state changes."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblStateChangeResult  

Results for operations that generate state changes.    

## Syntax  
  
```cpp
enum class PartyXblStateChangeResult    
{  
    Succeeded,  
    UnknownError,  
    CanceledByTitle,  
    UserNotAuthorized,  
    LoginToPlayFabThrottled,  
    PartyServiceError,  
    XboxLiveServiceTemporarilyUnavailable,  
    InternetConnectivityError,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Succeeded | The operation succeeded. |  
| UnknownError | An unknown error occurred. |  
| CanceledByTitle | Another title operation canceled this operation. |  
| UserNotAuthorized | The Xbox Live user associated with the PartyXblLocalChatUser is not authorized to communicate with the Xbox Live service. |  
| LoginToPlayFabThrottled | The operation failed because too many logins have been attempted for this title. |  
| PartyServiceError | The operation failed because of an unexpected error in the Party Service. |  
| XboxLiveServiceTemporarilyUnavailable | The Xbox Live service is temporarily unavailable. |  
| InternetConnectivityError | The local device has internet connectivity issues which caused the operation to fail. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
