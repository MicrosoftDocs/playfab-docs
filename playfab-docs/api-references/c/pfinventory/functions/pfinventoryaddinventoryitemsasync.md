---
author: jasonsandlin
title: "PFInventoryAddInventoryItemsAsync"
description: "Add inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryAddInventoryItemsAsync  

Add inventory items.  

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
  
Given an entity type, entity identifier and container details, will add the specified inventory items. If successful, call [PFInventoryAddInventoryItemsGetResult](pfinventoryaddinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
