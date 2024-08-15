---
author: jasonsandlin
title: "PFEntityTokenExpiredEventHandler"
description: "EntityToken expired event handler. Needed to reauthenticate players in scenarios where the SDK is unable to automatically refresh the cached EntityToken."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityTokenExpiredEventHandler  

EntityToken expired event handler. Needed to reauthenticate players in scenarios where the SDK is unable to automatically refresh the cached EntityToken.  

## Syntax  
  
```cpp
void PFEntityTokenExpiredEventHandler(  
    void* context,  
    const PFEntityKey* entityKey  
)  
```  
  
### Parameters  
  
**`context`** &nbsp; void*  
  
Optional context pointer to data used by the event handler.  
  
**`entityKey`** &nbsp; [PFEntityKey*](../../pftypes/structs/pfentitykey-c.md)  
  
The EntityKey for the Entity whose auth token expired.  
  
  
### Return value
Type: void
  

  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
