---
author: jasonsandlin
title: "PFInventoryGetInventoryCollectionIdsAsync"
description: "Get Inventory Collection Ids"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryGetInventoryCollectionIdsAsync  

Get Inventory Collection Ids  

## Syntax  
  
```cpp
HRESULT PFInventoryGetInventoryCollectionIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryGetInventoryCollectionIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryGetInventoryCollectionIdsRequest*](../../pfinventorytypes/structs/pfinventorygetinventorycollectionidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Get a list of Inventory Collection Ids for the specified Entity. If successful, call [PFInventoryGetInventoryCollectionIdsGetResult](pfinventorygetinventorycollectionidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
