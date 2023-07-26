---
author: jasonsandlin
title: "PFCatalogGetItemModerationStateResponse"
description: "PFCatalogGetItemModerationStateResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/26/2023
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

  
  
