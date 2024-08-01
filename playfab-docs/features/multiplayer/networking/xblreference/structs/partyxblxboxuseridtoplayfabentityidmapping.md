---
author: ScottMunroMS
title: "PartyXblXboxUserIdToPlayFabEntityIdMapping"
description: "Mapping between an Xbox Live User Id and a PlayFab Entity Id."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyXblXboxUserIdToPlayFabEntityIdMapping  

Mapping between an Xbox Live User Id and a PlayFab Entity Id.  

## Syntax  
  
```cpp
struct PartyXblXboxUserIdToPlayFabEntityIdMapping {  
    uint64_t xboxLiveUserId;  
    PartyString playfabEntityId;  
}  
```
  
### Members  
  
**`xboxLiveUserId`** &nbsp; uint64_t  
  
The Xbox Live User Id.
  
**`playfabEntityId`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The PlayFab Entity Id.
  
This value may be an empty string in the case where the Xbox Live user does not have a linked PlayFab account. A PlayFab account is automatically created and linked when calling [PartyXblManager::LoginToPlayFab](../classes/PartyXblManager/methods/partyxblmanager_logintoplayfab.md) for the first time. The <b>LoginWithXbox</b> API provided by the PlayFab SDK can also be used to link an account.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
