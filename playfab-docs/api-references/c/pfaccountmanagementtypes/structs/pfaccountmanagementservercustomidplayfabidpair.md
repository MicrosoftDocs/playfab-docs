---
author: jasonsandlin
title: "PFAccountManagementServerCustomIDPlayFabIDPair"
description: "PFAccountManagementServerCustomIDPlayFabIDPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerCustomIDPlayFabIDPair  

PFAccountManagementServerCustomIDPlayFabIDPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerCustomIDPlayFabIDPair {  
    const char* playFabId;  
    const char* serverCustomId;  
} PFAccountManagementServerCustomIDPlayFabIDPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier.
  
**`serverCustomId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique server custom identifier for this player.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
