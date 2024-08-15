---
author: jasonsandlin
title: "PFInventoryGetInventoryCollectionIdsAsync"
description: "Get Inventory Collection Ids. Up to 50 Ids can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. It can take a few seconds for new collection Ids to show up."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetInventoryCollectionIdsAsync  

Get Inventory Collection Ids. Up to 50 Ids can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. It can take a few seconds for new collection Ids to show up.  

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
  
This API is available on all platforms. Get a list of Inventory Collection Ids for the specified Entity. When the asynchronous task is complete, call [PFInventoryGetInventoryCollectionIdsGetResultSize](pfinventorygetinventorycollectionidsgetresultsize.md) and [PFInventoryGetInventoryCollectionIdsGetResult](pfinventorygetinventorycollectionidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
