---
author: jasonsandlin
title: "PFGameSaveFilesInitialize"
description: "Initializes the PlayFab Game Save library instance."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesInitialize  

Initializes the PlayFab Game Save library instance.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesInitialize(  
    PFGameSaveInitArgs* args  
)  
```  
  
### Parameters  
  
**`args`** &nbsp; [PFGameSaveInitArgs*](../../pfgamesavefilestypes/structs/pfgamesaveinitargs.md)  
  
TBD    
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This will internally call PFInitialize(nullptr) if it hasn't been called already by the title. If control of PFCore background work is needed, the title should explicitly call PFInitialize and PFUninitialize.
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
