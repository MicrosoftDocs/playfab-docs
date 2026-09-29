---
author: jasonsandlin
title: "PFCatalogSetItemModerationStateAsync"
description: "Sets the moderation state for an item, including the concern category and string reason. More information about moderation states can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/ugc/moderation"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogSetItemModerationStateAsync  

Sets the moderation state for an item, including the concern category and string reason. More information about moderation states can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/ugc/moderation  

## Syntax  
  
```cpp
HRESULT PFCatalogSetItemModerationStateAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogSetItemModerationStateRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogSetItemModerationStateRequest*](../../pfcatalogtypes/structs/pfcatalogsetitemmoderationstaterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATABASE_THROUGHPUT_EXCEEDED, E_PF_ITEM_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
