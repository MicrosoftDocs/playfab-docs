---
author: jasonsandlin
title: "PFStatisticValue"
description: "PFStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFStatisticValue  

PFStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticValue {  
    const char* statisticName;  
    int32_t value;  
    uint32_t version;  
} PFStatisticValue;  
```
  
### Members  
  
**`statisticName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique name of the statistic.
  
**`value`** &nbsp; int32_t  
  
Statistic value for the player.
  
**`version`** &nbsp; uint32_t  
  
For updates to an existing statistic value for a player, the version of the statistic when it was loaded.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
