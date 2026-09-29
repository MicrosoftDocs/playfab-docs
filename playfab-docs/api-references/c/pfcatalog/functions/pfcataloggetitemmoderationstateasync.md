---
author: jasonsandlin
title: "PFCatalogGetItemModerationStateAsync"
description: "Gets the moderation state for an item, including the concern category and string reason. More information about moderation states can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/ugc/moderation"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogGetItemModerationStateAsync  

Gets the moderation state for an item, including the concern category and string reason. More information about moderation states can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/ugc/moderation  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemModerationStateAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemModerationStateRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemModerationStateRequest*](../../pfcatalogtypes/structs/pfcataloggetitemmoderationstaterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. When the asynchronous task is complete, call [PFCatalogGetItemModerationStateGetResultSize](pfcataloggetitemmoderationstategetresultsize.md) and [PFCatalogGetItemModerationStateGetResult](pfcataloggetitemmoderationstategetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
