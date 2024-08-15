---
author: jasonsandlin
title: "PFEntityGetSecretKey"
description: "Gets the PlayFab secretKey associated with a title Entity. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetSecretKey  

Gets the PlayFab secretKey associated with a title Entity. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity.  

## Syntax  
  
```cpp
HRESULT PFEntityGetSecretKey(  
    PFEntityHandle handle,  
    size_t secretKeySize,  
    char* secretKey,  
    size_t* secretKeyUsed  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFEntityHandle  
  
Entity handle.  
  
**`secretKeySize`** &nbsp; size_t  
  
Size of the provided buffer. Required size can be obtained via PFServiceConfigGetSecretKeySize.  
  
**`secretKey`** &nbsp; char*  
*_Out_writes_(secretKeySize)*  
  
Buffer the secretKey will be written to.  
  
**`secretKeyUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes used in the buffer including the null terminator.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
