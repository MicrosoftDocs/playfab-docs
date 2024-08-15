---
author: jasonsandlin
title: "PFInventoryRedeemPlayStationStoreInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemPlayStationStoreInventoryItemsAsync  

Redeem items.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemPlayStationStoreInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemPlayStationStoreInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemPlayStationStoreInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemplaystationstoreinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Sony PlayStation®, Linux, and macOS. Redeem items from the PlayStation Store. When the asynchronous task is complete, call [PFInventoryRedeemPlayStationStoreInventoryItemsGetResultSize](pfinventoryredeemplaystationstoreinventoryitemsgetresultsize.md) and [PFInventoryRedeemPlayStationStoreInventoryItemsGetResult](pfinventoryredeemplaystationstoreinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
