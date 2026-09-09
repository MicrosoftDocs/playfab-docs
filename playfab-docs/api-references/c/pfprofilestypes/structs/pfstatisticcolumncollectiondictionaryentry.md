---
author: jasonsandlin
title: "PFStatisticColumnCollectionDictionaryEntry"
description: "Dictionary entry for an associative array with PFProfilesStatisticColumnCollection values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFStatisticColumnCollectionDictionaryEntry  

Dictionary entry for an associative array with PFProfilesStatisticColumnCollection values.  

## Syntax  
  
```cpp
typedef struct PFStatisticColumnCollectionDictionaryEntry {  
    const char* key;  
    PFStatisticColumnCollection const* value;  
} PFStatisticColumnCollectionDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFStatisticColumnCollection](pfstatisticcolumncollection.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
