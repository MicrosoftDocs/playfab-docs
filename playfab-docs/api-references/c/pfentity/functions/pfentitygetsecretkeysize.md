---
author: jasonsandlin
title: "PFEntityGetSecretKeySize"
description: "Gets the size of the buffer needed to hold the PlayFab secretKey. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetSecretKeySize  

Gets the size of the buffer needed to hold the PlayFab secretKey. Will fail with E_PF_NOSECRETKEY if there is no Secret Key associated with the provided Entity.  

## Syntax  
  
```cpp
HRESULT PFEntityGetSecretKeySize(  
    PFEntityHandle handle,  
    size_t* secretKeySize  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFEntityHandle  
  
Entity handle.  
  
**`secretKeySize`** &nbsp; size_t*  
*output*  
  
Buffer size required for the secretKey (including null terminator).  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
