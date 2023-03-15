---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsAsync"
description: "Transfer inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryTransferInventoryItemsAsync  

Transfer inventory items.  

## Syntax  
  
```cpp
HRESULT PFInventoryTransferInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryTransferInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryTransferInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorytransferinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Transfer the specified inventory items of an entity's container Id to another entity's container Id. If successful, call [PFInventoryTransferInventoryItemsGetResult](pfinventorytransferinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
