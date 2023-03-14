---
author: jasonsandlin
title: "PFServiceConfigGetSecretKeySize"
description: "Gets the size of the buffer needed to hold the PlayFab secretKey for a service configuration."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFServiceConfigGetSecretKeySize  

Gets the size of the buffer needed to hold the PlayFab secretKey for a service configuration.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigGetSecretKeySize(  
    PFServiceConfigHandle handle,  
    size_t* secretKeySize  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle.  
  
**`secretKeySize`** &nbsp; size_t*  
*output*  
  
Buffer size required for the secretKey (including null terminator).  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
