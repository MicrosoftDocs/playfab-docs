---
author: jasonsandlin
title: "PFDataDeleteFilesRequest"
description: "PFDataDeleteFilesRequest data model. Deletes the requested files from the entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataDeleteFilesRequest  

PFDataDeleteFilesRequest data model. Deletes the requested files from the entity's profile.  

## Syntax  
  
```cpp
typedef struct PFDataDeleteFilesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* fileNames;  
    uint32_t fileNamesCount;  
    int32_t const* profileVersion;  
} PFDataDeleteFilesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`fileNames`** &nbsp; const char* const*  
  
Names of the files to be deleted.
  
**`fileNamesCount`** &nbsp; uint32_t  
  
Count of fileNames
  
**`profileVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The expected version of the profile, if set and doesn't match the current version of the profile the operation will not be performed.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
