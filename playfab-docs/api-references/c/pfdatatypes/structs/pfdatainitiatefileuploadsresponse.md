---
author: jasonsandlin
title: "PFDataInitiateFileUploadsResponse"
description: "PFDataInitiateFileUploadsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
*may be nullptr*  
  
(Optional) Collection of file names and upload urls.
  
**`uploadDetailsCount`** &nbsp; uint32_t  
  
Count of uploadDetails
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
