---
author: jasonsandlin
title: "PFInventoryAddInventoryItemsAsync"
description: "Add inventory items. Up to 3500 stacks of items can be added to a single inventory collection. Stack size is uncapped."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryAddInventoryItemsAsync  

Add inventory items. Up to 3500 stacks of items can be added to a single inventory collection. Stack size is uncapped.  

## Syntax  
  
```cpp
HRESULT PFInventoryAddInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryAddInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryAddInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryaddinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an entity type, entity identifier and container details, will add the specified inventory items. When the asynchronous task is complete, call [PFInventoryAddInventoryItemsGetResultSize](pfinventoryaddinventoryitemsgetresultsize.md) and [PFInventoryAddInventoryItemsGetResult](pfinventoryaddinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
