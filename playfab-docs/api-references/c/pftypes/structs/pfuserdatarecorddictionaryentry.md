---
author: jasonsandlin
title: "PFUserDataRecordDictionaryEntry"
description: "Dictionary entry for an associative array with PFUserDataRecord values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserDataRecordDictionaryEntry  

Dictionary entry for an associative array with PFUserDataRecord values.  

## Syntax  
  
```cpp
typedef struct PFUserDataRecordDictionaryEntry {  
    const char* key;  
    PFUserDataRecord const* value;  
} PFUserDataRecordDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFUserDataRecord](pfuserdatarecord.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
