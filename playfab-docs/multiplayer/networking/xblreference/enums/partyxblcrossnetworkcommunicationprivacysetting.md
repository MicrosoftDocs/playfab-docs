---
author: ScottMunroMS
title: "PartyXblCrossNetworkCommunicationPrivacySetting"
description: "Possible cross-network communication privacy settings for a local XBOX Live user."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblCrossNetworkCommunicationPrivacySetting  

Possible cross-network communication privacy settings for a local XBOX Live user.    

## Syntax  
  
```cpp
enum class PartyXblCrossNetworkCommunicationPrivacySetting    
{  
    Allowed = 0,  
    FriendsOnly = 1,  
    Disallowed = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Allowed | Communication with cross-network users is allowed with no restriction for this user. |  
| FriendsOnly | Communication with cross-network users is restricted to friends only for this user. |  
| Disallowed | Communication with cross-network users is not allowed for this user. |  
  
## Remarks  
  
A cross-network user is defined as a user of a non-XBOX Live gaming network.
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
