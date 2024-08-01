---
author: jasonsandlin
title: "PFEntityTokenRefreshedEventHandler"
description: "A handler invoked every time an Entity is automatically re-authenticated, thus obtaining a new EntityToken. An entity will be automatically re-authenticated prior to its EntityToken expiring."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityTokenRefreshedEventHandler  

A handler invoked every time an Entity is automatically re-authenticated, thus obtaining a new EntityToken. An entity will be automatically re-authenticated prior to its EntityToken expiring.  

## Syntax  
  
```cpp
void PFEntityTokenRefreshedEventHandler(  
    void* context,  
    const PFEntityKey* entityKey,  
    const PFEntityToken* newToken  
)  
```  
  
### Parameters  
  
**`context`** &nbsp; void*  
  
Optional context pointer to data used by the event handler.  
  
**`entityKey`** &nbsp; [PFEntityKey*](../../pftypes/structs/pfentitykey-c.md)  
  
The EntityKey for the Entity whose EntityToken expired.  
  
**`newToken`** &nbsp; [PFEntityToken*](../structs/pfentitytoken.md)  
  
The new token for the refreshed entity.  
  
  
### Return value
Type: void
  

  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
