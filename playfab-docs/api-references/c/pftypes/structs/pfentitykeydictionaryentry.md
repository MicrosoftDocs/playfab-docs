---
author: jasonsandlin
title: "PFEntityKeyDictionaryEntry"
description: "Dictionary entry for an associative array with PFEntityKey values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFEntityKeyDictionaryEntry  

Dictionary entry for an associative array with PFEntityKey values.  

## Syntax  
  
```cpp
typedef struct PFEntityKeyDictionaryEntry {  
    const char* key;  
    PFEntityKey const* value;  
} PFEntityKeyDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry.  
  
**`value`** &nbsp; [PFEntityKey](pfentitykey-c.md) const*  
  
The `PFEntityKey` value associated with `key`.  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
