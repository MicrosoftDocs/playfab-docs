---
author: jasonsandlin
title: "PFGameSaveFilesResetCloudAsync"
description: "This resets the cloud game save state for this user. Normally this does not need to be called but might be useful during development or testing. This does not delete or alter the local game save."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesResetCloudAsync  

This resets the cloud game save state for this user. Normally this does not need to be called but might be useful during development or testing. This does not delete or alter the local game save.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesResetCloudAsync(  
    PFLocalUserHandle localUserHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user to operate on.  
  
**`async`** &nbsp; XAsyncBlock*  
  
An XAsyncBlock for polling the call's status and retrieving the call results.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
