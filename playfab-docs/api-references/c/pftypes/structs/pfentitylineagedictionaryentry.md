---
author: jasonsandlin
title: "PFEntityLineageDictionaryEntry"
description: "Dictionary entry for an associative array with PFEntityLineage values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFEntityLineageDictionaryEntry  

Dictionary entry for an associative array with PFEntityLineage values.  

## Syntax  
  
```cpp
typedef struct PFEntityLineageDictionaryEntry {  
    const char* key;  
    PFEntityLineage const* value;  
} PFEntityLineageDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; [PFEntityLineage](pfentitylineage.md) const*  
  
The `PFEntityLineage` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
