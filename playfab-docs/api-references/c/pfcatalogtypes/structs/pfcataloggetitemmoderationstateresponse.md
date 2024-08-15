---
author: jasonsandlin
title: "PFCatalogGetItemModerationStateResponse"
description: "PFCatalogGetItemModerationStateResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemModerationStateResponse  

PFCatalogGetItemModerationStateResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemModerationStateResponse {  
    PFCatalogModerationState const* state;  
} PFCatalogGetItemModerationStateResponse;  
```
  
### Members  
  
**`state`** &nbsp; [PFCatalogModerationState](pfcatalogmoderationstate.md) const*  
*may be nullptr*  
  
(Optional) The current moderation state for the requested item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
