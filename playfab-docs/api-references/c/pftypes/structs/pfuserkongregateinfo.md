---
author: jasonsandlin
title: "PFUserKongregateInfo"
description: "PFUserKongregateInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFUserKongregateInfo  

PFUserKongregateInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserKongregateInfo {  
    const char* kongregateId;  
    const char* kongregateName;  
} PFUserKongregateInfo;  
```
  
### Members  
  
**`kongregateId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Kongregate ID.
  
**`kongregateName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Kongregate Username.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
