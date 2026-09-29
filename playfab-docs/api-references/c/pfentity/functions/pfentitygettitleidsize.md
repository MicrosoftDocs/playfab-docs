---
author: jasonsandlin
title: "PFEntityGetTitleIdSize"
description: "Gets the size of the buffer needed to hold the titleId string from an entity handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFEntityGetTitleIdSize  

Gets the size of the buffer needed to hold the titleId string from an entity handle.  

## Syntax  
  
```cpp
HRESULT PFEntityGetTitleIdSize(  
    PFEntityHandle entityHandle,  
    size_t* titleIdSize  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`titleIdSize`** &nbsp; size_t*  
*output*  
  
TBD    
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
