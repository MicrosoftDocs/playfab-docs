---
author: jasonsandlin
title: "PFUserPsnInfo"
description: "PFUserPsnInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFUserPsnInfo  

PFUserPsnInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserPsnInfo {  
    const char* psnAccountId;  
    const char* psnOnlineId;  
} PFUserPsnInfo;  
```
  
### Members  
  
**`psnAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayStation :tm: Network account ID.
  
**`psnOnlineId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayStation :tm: Network online ID.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
