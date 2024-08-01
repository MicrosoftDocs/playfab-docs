---
author: jasonsandlin
title: "PFServiceConfigGetTitleId"
description: "Gets the PlayFab titleId for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigGetTitleId  

Gets the PlayFab titleId for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetTitleId(  
    PFServiceConfigHandle handle,  
    size_t titleIdSize,  
    char* titleId,  
    size_t* titleIdUsed  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
**`titleIdSize`** &nbsp; size_t  
  
Size of the provided buffer. Required size can be obtained via PFServiceConfigGetTitleIdSize.  
  
**`titleId`** &nbsp; char*  
*_Out_writes_(titleIdSize)*  
  
Buffer the titleId will be written to.  
  
**`titleIdUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes used in the buffer including the null terminator.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
