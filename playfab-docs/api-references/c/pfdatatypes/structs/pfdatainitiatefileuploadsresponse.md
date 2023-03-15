---
author: jasonsandlin
title: "PFDataInitiateFileUploadsResponse"
description: "PFDataInitiateFileUploadsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataInitiateFileUploadsResponse  

PFDataInitiateFileUploadsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataInitiateFileUploadsResponse {  
    PFEntityKey const* entity;  
    int32_t profileVersion;  
    PFDataInitiateFileUploadMetadata const* uploadDetails;  
    uint32_t uploadDetailsCount;  
} PFDataInitiateFileUploadsResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
**`uploadDetails`** &nbsp; [PFDataInitiateFileUploadMetadata](pfdatainitiatefileuploadmetadata.md) const*  
*array of size `uploadDetailsCount`*  
  
(Optional) Collection of file names and upload urls.
  
**`uploadDetailsCount`** &nbsp; uint32_t  
  
Count of uploadDetails
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
