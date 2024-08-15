---
author: jasonsandlin
title: "PFInventoryGetInventoryItemsAsync"
description: "Get current inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetInventoryItemsAsync  

Get current inventory items.  

## Syntax  
  
```cpp
HRESULT PFInventoryGetInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryGetInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryGetInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorygetinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an entity type, entity identifier and container details, will get the entity's inventory items. . When the asynchronous task is complete, call [PFInventoryGetInventoryItemsGetResultSize](pfinventorygetinventoryitemsgetresultsize.md) and [PFInventoryGetInventoryItemsGetResult](pfinventorygetinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
