---
author: jasonsandlin
title: "PFStringDictionaryEntry"
description: "Dictionary entry for an associative array with string values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFStringDictionaryEntry  

Dictionary entry for an associative array with string values.  

## Syntax  
  
```cpp
typedef struct PFStringDictionaryEntry {  
    const char* key;  
    const char* value;  
} PFStringDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
The key of the entry. Must not be `nullptr`.  
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
The string value associated with `key`. Must not be `nullptr`; use an empty string for an empty value.  
  
## Remarks

Microsoft PlayFab APIs represent a string dictionary as an array of `PFStringDictionaryEntry` structures plus a count, for example `customTags` and `customTagsCount`.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
