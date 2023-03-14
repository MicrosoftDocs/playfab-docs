---
author: jasonsandlin
title: "PFServiceConfigGetSecretKey"
description: "Gets the PlayFab secretKey for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFServiceConfigGetSecretKey  

Gets the PlayFab secretKey for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetSecretKey(  
    PFServiceConfigHandle handle,  
    size_t secretKeySize,  
    char* secretKey,  
    size_t* secretKeyUsed  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
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
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
