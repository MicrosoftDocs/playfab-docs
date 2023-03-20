---
author: jasonsandlin
title: "PFProfilesEntityStatisticChildValue"
description: "PFProfilesEntityStatisticChildValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesEntityStatisticChildValue  

PFProfilesEntityStatisticChildValue data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticChildValue {  
    const char* childName;  
    const char* metadata;  
    int32_t value;  
} PFProfilesEntityStatisticChildValue;  
```
  
### Members  
  
**`childName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Child name value, if child statistic.
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Child statistic metadata.
  
**`value`** &nbsp; int32_t  
  
Child statistic value.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
