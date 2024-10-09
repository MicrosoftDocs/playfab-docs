---
author: jasonsandlin
title: "PFInventoryPurchaseInventoryItemsAsync"
description: "Purchase an item or bundle. Up to 10000 stacks of items can be added to a single inventory collection. Stack size is uncapped."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryPurchaseInventoryItemsAsync  

Purchase an item or bundle. Up to 10000 stacks of items can be added to a single inventory collection. Stack size is uncapped.  

## Syntax  
  
```cpp
HRESULT PFInventoryPurchaseInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryPurchaseInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryPurchaseInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorypurchaseinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Purchase a single item or bundle, paying the associated price. When the asynchronous task is complete, call [PFInventoryPurchaseInventoryItemsGetResultSize](pfinventorypurchaseinventoryitemsgetresultsize.md) and [PFInventoryPurchaseInventoryItemsGetResult](pfinventorypurchaseinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
