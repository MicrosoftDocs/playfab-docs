---
author: jasonsandlin
title: "PFUint32DictionaryEntry"
description: "Dictionary entry for an associative array with uint32_t values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFUint32DictionaryEntry  

Dictionary entry for an associative array with uint32_t values.  

## Syntax  
  
```cpp
typedef struct PFUint32DictionaryEntry {  
    const char* key;  
    uint32_t value;  
} PFUint32DictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; uint32_t  
  
The `uint32_t` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
