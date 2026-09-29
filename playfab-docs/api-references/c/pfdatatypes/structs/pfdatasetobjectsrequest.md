---
author: jasonsandlin
title: "PFDataSetObjectsRequest"
description: "PFDataSetObjectsRequest data model. Sets JSON objects on the requested entity profile. May include a version number to be used to perform optimistic concurrency operations during update. If the current version differs from the version in the request the request will be ignored. If no version is set on the request then the value will always be updated if the values differ. Using the version value does not guarantee a write though, ConcurrentEditError may still occur if multiple clients are attempting to update the same profile. ."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFDataSetObjectsRequest  

PFDataSetObjectsRequest data model. Sets JSON objects on the requested entity profile. May include a version number to be used to perform optimistic concurrency operations during update. If the current version differs from the version in the request the request will be ignored. If no version is set on the request then the value will always be updated if the values differ. Using the version value does not guarantee a write though, ConcurrentEditError may still occur if multiple clients are attempting to update the same profile. .  

## Syntax  
  
```cpp
typedef struct PFDataSetObjectsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    int32_t const* expectedProfileVersion;  
    PFDataSetObject const* objects;  
    uint32_t objectsCount;  
} PFDataSetObjectsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`expectedProfileVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Optional field used for concurrency control. By specifying the previously returned ProfileVersion value from the GetObjects API or other APIs, you can ensure that the object update is performed only if the profile has not been updated since you last loaded that version. If the profile for the same entity has been updated, the operation will fail with an EntityProfileVersionMismatch error. The conflicting update can be caused by any operation that modifies the entity profile, including SetObjects, FinalizeFileUploads, and UpdateStatistics.
  
**`objects`** &nbsp; [PFDataSetObject](pfdatasetobject.md) const*  
  
Collection of objects to set on the profile.
  
**`objectsCount`** &nbsp; uint32_t  
  
Count of objects
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
