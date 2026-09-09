---
author: jasonsandlin
title: "PFGameSaveFilesSetSaveDescriptionAsync"
description: "Set a short save description of the pending game save. This can be seen in the conflict or active device contention UI"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetSaveDescriptionAsync  

Set a short save description of the pending game save. This can be seen in the conflict or active device contention UI  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetSaveDescriptionAsync(  
    PFLocalUserHandle localUserHandle,  
    const char* shortSaveDescription,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose game save files and folders to upload.  
  
**`shortSaveDescription`** &nbsp; char*  
  
Short save description of the pending game save.  
  
**`async`** &nbsp; XAsyncBlock*  
  
An XAsyncBlock for polling the call's status and retrieving the call results.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
