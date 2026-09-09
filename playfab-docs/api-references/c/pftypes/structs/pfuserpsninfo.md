---
author: jasonsandlin
title: "PFUserPsnInfo"
description: "PFUserPsnInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFUserPsnInfo  

PFUserPsnInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserPsnInfo {  
    const char* psnAccountId;  
    const char* psnOnlineId;  
    const char* psnSandboxId;  
} PFUserPsnInfo;  
```
  
### Members  
  
**`psnAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayStation :tm: Network account ID.
  
**`psnOnlineId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayStation :tm: Network online ID.
  
**`psnSandboxId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayStation :tm: Network sandbox ID.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
