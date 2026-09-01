---
author: jasonsandlin
title: "PFStatisticsEntityStatisticValueDictionaryEntry"
description: "Dictionary entry for an associative array with PFStatisticsEntityStatisticValue values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsEntityStatisticValueDictionaryEntry  

Dictionary entry for an associative array with PFStatisticsEntityStatisticValue values.  

## Syntax  
  
```cpp
typedef struct PFStatisticsEntityStatisticValueDictionaryEntry {  
    const char* key;  
    PFStatisticsEntityStatisticValue const* value;  
} PFStatisticsEntityStatisticValueDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFStatisticsEntityStatisticValue](pfstatisticsentitystatisticvalue.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
