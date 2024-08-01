---
author: jasonsandlin
title: "PFServiceConfigGetTitleIdSize"
description: "Gets the size of the buffer needed to hold the PlayFab titleId for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigGetTitleIdSize  

Gets the size of the buffer needed to hold the PlayFab titleId for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetTitleIdSize(  
    PFServiceConfigHandle handle,  
    size_t* titleIdSize  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
**`titleIdSize`** &nbsp; size_t*  
*output*  
  
Buffer size required for the titleId (including null terminator).  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
