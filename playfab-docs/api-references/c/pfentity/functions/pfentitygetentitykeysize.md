---
author: jasonsandlin
title: "PFEntityGetEntityKeySize"
description: "Get the size in bytes needed to store the PFEntityKey for an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetEntityKeySize  

Get the size in bytes needed to store the PFEntityKey for an Entity.  

## Syntax  
  
```cpp
HRESULT PFEntityGetEntityKeySize(  
    PFEntityHandle entityHandle,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a auth call.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the EntityKey.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
