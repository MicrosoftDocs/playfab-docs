---
author: jasonsandlin
title: "PFInventoryDeleteInventoryItemsAsync"
description: "Delete inventory items"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryDeleteInventoryItemsAsync  

Delete inventory items  

## Syntax  
  
```cpp
HRESULT PFInventoryDeleteInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryDeleteInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryDeleteInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorydeleteinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Given an entity type, entity identifier and container details, will delete the entity's inventory items. If successful, call [PFInventoryDeleteInventoryItemsGetResult](pfinventorydeleteinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
