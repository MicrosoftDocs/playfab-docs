---
author: jasonsandlin
title: "PFGameSaveDescriptor"
description: "TBD  "
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveDescriptor  

TBD    

## Syntax  
  
```cpp
typedef struct PFGameSaveDescriptor {  
    time_t time;  
    uint64_t totalBytes;  
    uint64_t uploadedBytes;  
    char deviceType[256];  
    char deviceId[256];  
    char deviceFriendlyName[256];  
    char thumbnailUri[2048];  
    char shortSaveDescription[4096];  
} PFGameSaveDescriptor;  
```
  
### Members  
  
**`time`** &nbsp; time_t  
  
Relevant time of the descriptor (can differ depending upon state and usage)
  
**`totalBytes`** &nbsp; uint64_t  
  
total bytes of the save
  
**`uploadedBytes`** &nbsp; uint64_t  
  
size of the pending upload, if any.
  
**`deviceType`** &nbsp; char[256]  
  
Device Type
  
**`deviceId`** &nbsp; char[256]  
  
A unique identifier for the device
  
**`deviceFriendlyName`** &nbsp; char[256]  
  
User friendly name for the device, e.g. "My XBOX One"
  
**`thumbnailUri`** &nbsp; char[2048]  
  
The URI to pfthumbnail.png if that file exists at the game saves root folder. Empty string if that file doesn't exist at the root.
  
**`shortSaveDescription`** &nbsp; char[4096]  
  
Short description of the save, can be shown in the Conflict or Device Contention UX along with the thumbnail.
  
  
## Requirements  
  
**Header:** PFGameSaveFilesTypes.h
  
## See also  
[PFGameSaveFilesTypes members](../pfgamesavefilestypes_members.md)  

  
  
