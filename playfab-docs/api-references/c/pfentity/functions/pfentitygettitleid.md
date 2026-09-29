---
author: jasonsandlin
title: "PFEntityGetTitleId"
description: "Gets the titleId for the PFServiceConfig associated with an entity handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEntityGetTitleId  

Gets the titleId for the PFServiceConfig associated with an entity handle.  

## Syntax  
  
```cpp
HRESULT PFEntityGetTitleId(  
    PFEntityHandle entityHandle,  
    size_t titleIdSize,  
    char* titleIdBuffer,  
    size_t* titleIdUsed  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`titleIdSize`** &nbsp; size_t  
  
Size of the provided buffer. Required size can be obtained via PFEntityGetAPIEndpointSize.  
  
**`titleIdBuffer`** &nbsp; char*  
*_Out_writes_(titleIdSize)*  
  
Buffer the titleId string will be written to.  
  
**`titleIdUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes used in the buffer including the null terminator.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
