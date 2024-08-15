---
author: jasonsandlin
title: "PFAccountManagementGetAccountInfoResult"
description: "PFAccountManagementGetAccountInfoResult data model. This API retrieves details regarding the player in the PlayFab service. Note that when this call is used to retrieve data about another player (not the one signed into the local client), some data, such as Personally Identifying Information (PII), will be omitted for privacy reasons or to comply with the requirements of the platform belongs to. The user account returned will be based on the identifier provided in priority order: PlayFabId, Username, Email, then TitleDisplayName. If no identifier is specified, the currently signed in user's information will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetAccountInfoResult  

PFAccountManagementGetAccountInfoResult data model. This API retrieves details regarding the player in the PlayFab service. Note that when this call is used to retrieve data about another player (not the one signed into the local client), some data, such as Personally Identifying Information (PII), will be omitted for privacy reasons or to comply with the requirements of the platform belongs to. The user account returned will be based on the identifier provided in priority order: PlayFabId, Username, Email, then TitleDisplayName. If no identifier is specified, the currently signed in user's information will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetAccountInfoResult {  
    PFUserAccountInfo const* accountInfo;  
} PFAccountManagementGetAccountInfoResult;  
```
  
### Members  
  
**`accountInfo`** &nbsp; [PFUserAccountInfo](../../pftypes/structs/pfuseraccountinfo.md) const*  
*may be nullptr*  
  
(Optional) Account information for the local user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
