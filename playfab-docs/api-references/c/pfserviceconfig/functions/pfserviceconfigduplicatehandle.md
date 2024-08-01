---
author: jasonsandlin
title: "PFServiceConfigDuplicateHandle"
description: "Duplicates a PFServiceConfigHandle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServiceConfigDuplicateHandle  

Duplicates a PFServiceConfigHandle.  

## Syntax  
  
```cpp
HRESULT PFServiceConfigDuplicateHandle(  
    PFServiceConfigHandle handle,  
    PFServiceConfigHandle* duplicatedHandle  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFServiceConfigHandle  
  
ServiceConfig handle to duplicate.  
  
**`duplicatedHandle`** &nbsp; PFServiceConfigHandle*  
  
The duplicated handle.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Both the duplicated handle and the original handle need to be closed with PFServiceConfigCloseHandle when they are no longer needed.
  
## Requirements  
  
**Header:** PFServiceConfig.h
  
## See also  
[PFServiceConfig members](../pfserviceconfig_members.md)  

  
  
