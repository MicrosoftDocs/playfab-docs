---
author: jasonsandlin
title: "PFGameSaveFilesUninitializeAsync"
description: "Cleanup PlayFab Game Save library instance."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUninitializeAsync  

Cleanup PlayFab Game Save library instance.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesUninitializeAsync(  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
An XAsyncBlock for polling the call's status and retrieving the call results.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
To retrieve the result of a call to PFGameSaveFilesUninitializeAsync, call PFGameSaveFilesUninitializeResult. This will internally call PFUninitializeAsync() if PFGameSaveInitialize() needed to call PFInitialize() internally.
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
