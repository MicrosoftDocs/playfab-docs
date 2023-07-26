---
author: jasonsandlin
title: "PFProfilesEntityStatisticValue"
description: "PFProfilesEntityStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFProfilesEntityStatisticValue  

PFProfilesEntityStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticValue {  
    const char* metadata;  
    const char* name;  
    int32_t const* value;  
    int32_t version;  
} PFProfilesEntityStatisticValue;  
```
  
### Members  
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Metadata associated with the Statistic.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic name.
  
**`value`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Statistic value.
  
**`version`** &nbsp; int32_t  
  
Statistic version.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
