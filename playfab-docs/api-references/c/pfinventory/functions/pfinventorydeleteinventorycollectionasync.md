---
author: jasonsandlin
title: "PFInventoryDeleteInventoryCollectionAsync"
description: "Delete an Inventory Collection. More information about Inventory Collections can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/inventory/collections"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryDeleteInventoryCollectionAsync  

Delete an Inventory Collection. More information about Inventory Collections can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/inventory/collections  

## Syntax  
  
```cpp
HRESULT PFInventoryDeleteInventoryCollectionAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryDeleteInventoryCollectionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryDeleteInventoryCollectionRequest*](../../pfinventorytypes/structs/pfinventorydeleteinventorycollectionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Delete an Inventory Collection by the specified Id for an Entity. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
