---
author: jasonsandlin
title: "PFDateTimeDictionaryEntry"
description: "Dictionary entry for an associative array with time_t values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
  
TBD  
  
**`value`** &nbsp; time_t  
  
TBD  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
