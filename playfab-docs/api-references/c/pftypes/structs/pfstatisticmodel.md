---
author: jasonsandlin
title: "PFStatisticModel"
description: "PFStatisticModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFStatisticModel  

PFStatisticModel data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticModel {  
    const char* name;  
    int32_t value;  
    int32_t version;  
} PFStatisticModel;  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic name.
  
**`value`** &nbsp; int32_t  
  
Statistic value.
  
**`version`** &nbsp; int32_t  
  
Statistic version (0 if not a versioned statistic).
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
