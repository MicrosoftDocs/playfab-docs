---
author: jasonsandlin
title: "PFDateTimeDictionaryEntry"
description: "Dictionary entry for an associative array with time_t values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFDateTimeDictionaryEntry  

Dictionary entry for an associative array with time_t values.  

## Syntax  
  
```cpp
typedef struct PFDateTimeDictionaryEntry {  
    const char* key;  
    time_t value;  
} PFDateTimeDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; time_t  
  
The `time_t` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
