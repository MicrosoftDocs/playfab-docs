---
author: jasonsandlin
title: "PFDataObjectResultDictionaryEntry"
description: "Dictionary entry for an associative array with PFDataObjectResult values."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataObjectResultDictionaryEntry  

Dictionary entry for an associative array with PFDataObjectResult values.  

## Syntax  
  
```cpp
typedef struct PFDataObjectResultDictionaryEntry {  
    const char* key;  
    PFDataObjectResult const* value;  
} PFDataObjectResultDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFDataObjectResult](pfdataobjectresult.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
