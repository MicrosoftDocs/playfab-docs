---
author: jasonsandlin
title: "PFProfilesEntityProfileFileMetadata"
description: "PFProfilesEntityProfileFileMetadata data model. An entity file's meta data. To get a download URL call File/GetFiles API."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityProfileFileMetadata  

PFProfilesEntityProfileFileMetadata data model. An entity file's meta data. To get a download URL call File/GetFiles API.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityProfileFileMetadata {  
    const char* checksum;  
    const char* fileName;  
    time_t lastModified;  
    int32_t size;  
} PFProfilesEntityProfileFileMetadata;  
```
  
### Members  
  
**`checksum`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Checksum value for the file, can be used to check if the file on the server has changed.
  
**`fileName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the file.
  
**`lastModified`** &nbsp; time_t  
  
Last UTC time the file was modified.
  
**`size`** &nbsp; int32_t  
  
Storage service's reported byte count.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
