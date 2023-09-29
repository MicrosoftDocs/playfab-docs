---
author: jasonsandlin
title: "PFProfilesEntityStatisticAttributeValue"
description: "PFProfilesEntityStatisticAttributeValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2023
---

# PFProfilesEntityStatisticAttributeValue  

PFProfilesEntityStatisticAttributeValue data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticAttributeValue {  
    const char* metadata;  
    const char* name;  
    int32_t const* scores;  
    uint32_t scoresCount;  
} PFProfilesEntityStatisticAttributeValue;  
```
  
### Members  
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Metadata associated with the Statistic.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Attribute name.
  
**`scores`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Attribute Statistic scores.
  
**`scoresCount`** &nbsp; uint32_t  
  
Count of scores
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
