---
author: ScottMunroMS
title: "PartyXblCrossNetworkCommunicationPrivacySetting"
description: "Possible cross-network communication privacy settings for a local Xbox Live user."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblCrossNetworkCommunicationPrivacySetting  

Possible cross-network communication privacy settings for a local Xbox Live user.    

## Syntax  
  
```cpp
enum class PartyXblCrossNetworkCommunicationPrivacySetting    
{  
    Allowed,  
    FriendsOnly,  
    Disallowed,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Allowed | Communication with cross-network users is allowed with no restriction for this user. |  
| FriendsOnly | Communication with cross-network users is restricted to friends only for this user. |  
| Disallowed | Communication with cross-network users is not allowed for this user. |  
  
## Remarks  
  
A cross-network user is defined as a user of a non-Xbox Live gaming network.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
