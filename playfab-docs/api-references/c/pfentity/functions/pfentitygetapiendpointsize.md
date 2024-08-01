---
author: jasonsandlin
title: "PFEntityGetAPIEndpointSize"
description: "Gets the size of the buffer needed to hold the API endpoint string from an entity handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetAPIEndpointSize  

Gets the size of the buffer needed to hold the API endpoint string from an entity handle.  

## Syntax  
  
```cpp
HRESULT PFEntityGetAPIEndpointSize(  
    PFEntityHandle entityHandle,  
    size_t* apiEndpointSize  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`apiEndpointSize`** &nbsp; size_t*  
*output*  
  
Buffer size required for the API endpoint string (including null terminator).  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
