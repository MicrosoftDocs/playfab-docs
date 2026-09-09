---
author: jasonsandlin
title: "PFGameSaveFilesUninitializeResult"
description: "Retrieves the result of a call to PFGameSaveFilesUninitializeAsync."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUninitializeResult  

Retrieves the result of a call to PFGameSaveFilesUninitializeAsync.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesUninitializeResult(  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
The XAsyncBlock that we pass to PFGameSaveFilesUninitializeAsync.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
