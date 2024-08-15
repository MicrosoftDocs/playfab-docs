---
author: jasonsandlin
title: "PFServiceConfigGetAPIEndpointSize"
description: "Gets the size of the buffer needed to hold the API endpoint for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigGetAPIEndpointSize  

Gets the size of the buffer needed to hold the API endpoint for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetAPIEndpointSize(  
    PFServiceConfigHandle handle,  
    size_t* apiEndpointSize  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
**`apiEndpointSize`** &nbsp; size_t*  
*output*  
  
Buffer size required for the API endpoint string (including null terminator).  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
