---
author: jasonsandlin
title: "PFStatisticColumnCollection"
description: "PFStatisticColumnCollection data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFStatisticColumnCollection  

PFStatisticColumnCollection data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticColumnCollection {  
    PFStatisticColumn const* columns;  
    uint32_t columnsCount;  
} PFStatisticColumnCollection;  
```
  
### Members  
  
**`columns`** &nbsp; [PFStatisticColumn](pfstatisticcolumn.md) const*  
*may be nullptr*  
  
(Optional) Columns for the statistic defining the aggregation method for each column.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
