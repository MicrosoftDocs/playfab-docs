---
author: jasonsandlin
title: "PFGameSaveFilesGetRemainingQuota"
description: "Returns the amount of data available to store save data in bytes using the PFGameSaveFiles API. Going over quota will return a negative number and cause the service to block the upload."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesGetRemainingQuota  

Returns the amount of data available to store save data in bytes using the PFGameSaveFiles API. Going over quota will return a negative number and cause the service to block the upload.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesGetRemainingQuota(  
    PFLocalUserHandle localUserHandle,  
    int64_t* remainingQuota  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose quota to return.  
  
**`remainingQuota`** &nbsp; int64_t*  
*output*  
  
The amount of data available to store save data in bytes. Going over quota will return a negative number and cause the service to block the upload  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If called when disconnected from cloud, it will return E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
