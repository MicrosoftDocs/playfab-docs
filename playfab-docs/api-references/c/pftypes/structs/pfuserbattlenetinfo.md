---
author: jasonsandlin
title: "PFUserBattleNetInfo"
description: "PFUserBattleNetInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFUserBattleNetInfo  

PFUserBattleNetInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserBattleNetInfo {  
    const char* battleNetAccountId;  
    const char* battleNetBattleTag;  
} PFUserBattleNetInfo;  
```
  
### Members  
  
**`battleNetAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Battle.net identifier.
  
**`battleNetBattleTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Battle.net display name.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
