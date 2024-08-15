---
author: jasonsandlin
title: "PFDataGetFilesRequest"
description: "PFDataGetFilesRequest data model. Returns URLs that may be used to download the files for a profile for a limited length of time. Only returns files that have been successfully uploaded, files that are still pending will either return the old value, if it exists, or nothing."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetFilesRequest  

PFDataGetFilesRequest data model. Returns URLs that may be used to download the files for a profile for a limited length of time. Only returns files that have been successfully uploaded, files that are still pending will either return the old value, if it exists, or nothing.  

## Syntax  
  
```cpp
typedef struct PFDataGetFilesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFDataGetFilesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
