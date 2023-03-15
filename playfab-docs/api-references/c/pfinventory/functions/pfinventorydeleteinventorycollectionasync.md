---
author: jasonsandlin
title: "PFInventoryDeleteInventoryCollectionAsync"
description: "Delete an Inventory Collection"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryDeleteInventoryCollectionAsync  

Delete an Inventory Collection  

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
  
Delete an Inventory Collection by the specified Id for an Entity. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
