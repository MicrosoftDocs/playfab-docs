---
author: jasonsandlin
title: "PFDataAbortFileUploadsRequest"
description: "PFDataAbortFileUploadsRequest data model. Aborts the pending upload of the requested files."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFDataAbortFileUploadsRequest  

PFDataAbortFileUploadsRequest data model. Aborts the pending upload of the requested files.  

## Syntax  
  
```cpp
typedef struct PFDataAbortFileUploadsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* fileNames;  
    uint32_t fileNamesCount;  
    int32_t const* profileVersion;  
} PFDataAbortFileUploadsRequest;  
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
  
Names of the files to have their pending uploads aborted.
  
**`fileNamesCount`** &nbsp; uint32_t  
  
Count of fileNames
  
**`profileVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Optional field used for concurrency control. By specifying the previously returned ProfileVersion value from the InitiateFileUploads API or other APIs, you can ensure that the file upload abort operation is performed only if the profile has not been updated since you last loaded that version. If the profile for the same entity has been updated, the operation will fail with an EntityProfileVersionMismatch error. The conflicting update can be caused by any operation that modifies the entity profile, including SetObjects, FinalizeFileUploads, and UpdateStatistics.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
