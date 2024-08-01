---
author: jasonsandlin
title: "PFServiceConfigGetAPIEndpoint"
description: "Gets the API endpoint for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigGetAPIEndpoint  

Gets the API endpoint for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetAPIEndpoint(  
    PFServiceConfigHandle handle,  
    size_t apiEndpointSize,  
    char* apiEndpoint,  
    size_t* apiEndpointUsed  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
**`apiEndpointSize`** &nbsp; size_t  
  
Size of the provided buffer. Required size can be obtained via PFServiceConfigGetAPIEndpointSize.  
  
**`apiEndpoint`** &nbsp; char*  
*_Out_writes_(apiEndpointSize)*  
  
Buffer the API endpoint string will be written to.  
  
**`apiEndpointUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes used in the buffer including the null terminator.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
