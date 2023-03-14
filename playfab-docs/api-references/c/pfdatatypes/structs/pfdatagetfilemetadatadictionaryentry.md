---
author: jasonsandlin
title: "PFDataGetFileMetadataDictionaryEntry"
description: "Dictionary entry for an associative array with PFDataGetFileMetadata values."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataGetFileMetadataDictionaryEntry  

Dictionary entry for an associative array with PFDataGetFileMetadata values.  

## Syntax  
  
```cpp
typedef struct PFDataGetFileMetadataDictionaryEntry {  
    const char* key;  
    PFDataGetFileMetadata const* value;  
} PFDataGetFileMetadataDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFDataGetFileMetadata](pfdatagetfilemetadata.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
