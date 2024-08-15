---
author: jasonsandlin
title: "PFDataGetFileMetadata"
description: "PFDataGetFileMetadata data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetFileMetadata  

PFDataGetFileMetadata data model.  

## Syntax  
  
```cpp
typedef struct PFDataGetFileMetadata {  
    const char* checksum;  
    const char* downloadUrl;  
    const char* fileName;  
    time_t lastModified;  
    int32_t size;  
} PFDataGetFileMetadata;  
```
  
### Members  
  
**`checksum`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Checksum value for the file, can be used to check if the file on the server has changed.
  
**`downloadUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Download URL where the file can be retrieved.
  
**`fileName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the file.
  
**`lastModified`** &nbsp; time_t  
  
Last UTC time the file was modified.
  
**`size`** &nbsp; int32_t  
  
Storage service's reported byte count.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
