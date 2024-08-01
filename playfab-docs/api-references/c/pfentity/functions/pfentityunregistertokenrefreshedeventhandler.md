---
author: jasonsandlin
title: "PFEntityUnregisterTokenRefreshedEventHandler"
description: "Unregisters a previously registered PFEntityTokenRefreshedCallback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityUnregisterTokenRefreshedEventHandler  

Unregisters a previously registered PFEntityTokenRefreshedCallback.  

## Syntax  
  
```cpp
void PFEntityUnregisterTokenRefreshedEventHandler(  
    PFRegistrationToken token  
)  
```  
  
### Parameters  
  
**`token`** &nbsp; PFRegistrationToken  
  
Registration token from PFEntityRegisterTokenRefreshedCallback.  
  
  
### Return value
Type: void
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
