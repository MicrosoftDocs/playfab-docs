---
author: jasonsandlin
title: "PFCatalogKeywordSetDictionaryEntry"
description: "Dictionary entry for an associative array with PFCatalogKeywordSet values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogKeywordSetDictionaryEntry  

Dictionary entry for an associative array with PFCatalogKeywordSet values.  

## Syntax  
  
```cpp
typedef struct PFCatalogKeywordSetDictionaryEntry {  
    const char* key;  
    PFCatalogKeywordSet const* value;  
} PFCatalogKeywordSetDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFCatalogKeywordSet](pfcatalogkeywordset.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
