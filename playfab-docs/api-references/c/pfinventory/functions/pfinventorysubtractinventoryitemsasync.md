---
author: jasonsandlin
title: "PFInventorySubtractInventoryItemsAsync"
description: "Subtract inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventorySubtractInventoryItemsAsync  

Subtract inventory items.  

## Syntax  
  
```cpp
HRESULT PFInventorySubtractInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventorySubtractInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventorySubtractInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorysubtractinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an entity type, entity identifier and container details, will subtract the specified inventory items. . When the asynchronous task is complete, call [PFInventorySubtractInventoryItemsGetResultSize](pfinventorysubtractinventoryitemsgetresultsize.md) and [PFInventorySubtractInventoryItemsGetResult](pfinventorysubtractinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
