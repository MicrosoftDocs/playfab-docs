---
author: ScottMunroMS
title: "PartyXblXboxUserIdToPlayFabEntityIdMapping"
description: "Reference for the PartyXblXboxUserIdToPlayFabEntityIdMapping struct that pairs an XBOX user ID with its linked PlayFab Party entity ID."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblXboxUserIdToPlayFabEntityIdMapping  

Mapping between an XBOX user ID and a PlayFab Entity Id.  

## Syntax  
  
```cpp
struct PartyXblXboxUserIdToPlayFabEntityIdMapping {  
    uint64_t xboxLiveUserId;  
    PartyString playfabEntityId;  
}  
```
  
### Members  
  
**`xboxLiveUserId`** &nbsp; uint64_t  
  
The XBOX user ID.
  
**`playfabEntityId`** &nbsp; [PartyString](../../reference/typedefs.md)  
  
The PlayFab Entity Id.
  
This value may be an empty string in the case where the XBOX Live user does not have a linked PlayFab account. A PlayFab account is automatically created and linked when calling [PartyXblManager::LoginToPlayFab](../classes/PartyXblManager/methods/partyxblmanager_logintoplayfab.md) for the first time. The **LoginWithXbox** API provided by the PlayFab SDK can also be used to link an account.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
