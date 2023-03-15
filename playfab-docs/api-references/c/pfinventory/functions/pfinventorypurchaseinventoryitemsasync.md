---
author: jasonsandlin
title: "PFInventoryPurchaseInventoryItemsAsync"
description: "Purchase an item or bundle"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryPurchaseInventoryItemsAsync  

Purchase an item or bundle  

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
  
Purchase a single item or bundle, paying the associated price. If successful, call [PFInventoryPurchaseInventoryItemsGetResult](pfinventorypurchaseinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
