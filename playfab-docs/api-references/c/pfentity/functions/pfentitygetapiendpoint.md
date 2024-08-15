---
author: jasonsandlin
title: "PFEntityGetAPIEndpoint"
description: "Gets the API endpoint for the PFServiceConfig associated with an entity handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetAPIEndpoint  

Gets the API endpoint for the PFServiceConfig associated with an entity handle.  

## Syntax  
  
```cpp
HRESULT PFEntityGetAPIEndpoint(  
    PFEntityHandle entityHandle,  
    size_t apiEndpointSize,  
    char* apiEndpoint,  
    size_t* apiEndpointUsed  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`apiEndpointSize`** &nbsp; size_t  
  
Size of the provided buffer. Required size can be obtained via PFEntityGetAPIEndpointSize.  
  
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
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
