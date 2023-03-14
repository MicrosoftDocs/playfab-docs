---
author: jasonsandlin
title: "PFEntityDuplicateHandle"
description: "Duplicates a PFEntityHandle."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFEntityDuplicateHandle  

Duplicates a PFEntityHandle.  

## Syntax  
  
```cpp
HRESULT PFEntityDuplicateHandle(  
    PFEntityHandle entityHandle,  
    PFEntityHandle* duplicatedEntityHandle  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
Entity handle to duplicate.  
  
**`duplicatedEntityHandle`** &nbsp; PFEntityHandle*  
*output*  
  
The duplicated handle.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Both the duplicated handle and the original handle need to be closed with PFEntityCloseHandle when they are no longer needed.
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
