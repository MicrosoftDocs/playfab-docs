---
author: jasonsandlin
title: "PFInt32DictionaryEntry"
description: "Dictionary entry for an associative array with int32_t values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFInt32DictionaryEntry  

Dictionary entry for an associative array with int32_t values.  

## Syntax  
  
```cpp
typedef struct PFInt32DictionaryEntry {  
    const char* key;  
    int32_t value;  
} PFInt32DictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; int32_t  
  
The `int32_t` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
