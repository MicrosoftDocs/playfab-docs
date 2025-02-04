---
author: jasonsandlin
title: "PFEntityStatisticValueDictionaryEntry"
description: "Dictionary entry for an associative array with PFProfilesEntityStatisticValue values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFEntityStatisticValueDictionaryEntry  

Dictionary entry for an associative array with PFProfilesEntityStatisticValue values.  

## Syntax  
  
```cpp
typedef struct PFEntityStatisticValueDictionaryEntry {  
    const char* key;  
    PFEntityStatisticValue const* value;  
} PFEntityStatisticValueDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFEntityStatisticValue](pfentitystatisticvalue.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
