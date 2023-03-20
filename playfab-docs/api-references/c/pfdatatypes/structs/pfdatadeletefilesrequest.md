---
author: jasonsandlin
title: "PFDataDeleteFilesRequest"
description: "PFDataDeleteFilesRequest data model. Deletes the requested files from the entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataDeleteFilesRequest  

PFDataDeleteFilesRequest data model. Deletes the requested files from the entity's profile.  

## Syntax  
  
```cpp
typedef struct PFDataDeleteFilesRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* fileNames;  
    uint32_t fileNamesCount;  
    int32_t const* profileVersion;  
} PFDataDeleteFilesRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`fileNames`** &nbsp; const char* const*  
*array of size `fileNamesCount`*  
  
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

  
  
