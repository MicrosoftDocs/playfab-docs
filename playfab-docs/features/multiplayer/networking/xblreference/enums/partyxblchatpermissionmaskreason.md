---
author: alexatxbox
title: "PartyXblChatPermissionMaskReason"
description: "Reasons communication may be restricted."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblChatPermissionMaskReason  

Reasons communication may be restricted.    

## Syntax  
  
```cpp
enum class PartyXblChatPermissionMaskReason    
{  
    NoRestriction,  
    Determining,  
    Privilege,  
    Privacy,  
    InvalidTargetUser,  
    XboxLiveServiceError,  
    UnknownError,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoRestriction | There is no restriction currently applying to this chat permission. |  
| Determining | Communication is restricted while the local chat user's communication privilege and privacy settings are being queried. |  
| Privilege | Communication is restricted due to the local chat user's communication privilege. |  
| Privacy | Communication is restricted due to the local chat user's privacy settings in relation to the target chat user. |  
| InvalidTargetUser | Communication is restricted because the target user was not recognized as valid by Xbox Live services. |  
| XboxLiveServiceError | The required chat permission could not be successfully determined due to issues with Xbox Live services. |  
| UnknownError | The required chat permission could not be successfully determined due to an unknown internal error. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
