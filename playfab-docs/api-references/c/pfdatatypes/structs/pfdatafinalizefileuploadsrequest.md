---
author: jasonsandlin
title: "PFDataFinalizeFileUploadsRequest"
description: "PFDataFinalizeFileUploadsRequest data model. Finalizes the upload of the requested files. Verifies that the files have been successfully uploaded and moves the file pointers from pending to live."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFDataFinalizeFileUploadsRequest  

PFDataFinalizeFileUploadsRequest data model. Finalizes the upload of the requested files. Verifies that the files have been successfully uploaded and moves the file pointers from pending to live.  

## Syntax  
  
```cpp
typedef struct PFDataFinalizeFileUploadsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* fileNames;  
    uint32_t fileNamesCount;  
    int32_t profileVersion;  
} PFDataFinalizeFileUploadsRequest;  
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
  
Names of the files to be finalized. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
  
**`fileNamesCount`** &nbsp; uint32_t  
  
Count of fileNames
  
**`profileVersion`** &nbsp; int32_t  
  
Field used for concurrency control. By specifying the previously returned ProfileVersion value from the InitiateFileUploads API, you can ensure that the file upload finalization is performed only if the profile has not been updated since you last loaded that version. If the profile for the same entity has been updated, the operation will fail with an EntityProfileVersionMismatch error. The conflicting update can be caused by any operation that modifies the entity profile, including SetObjects, FinalizeFileUploads, and UpdateStatistics.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
