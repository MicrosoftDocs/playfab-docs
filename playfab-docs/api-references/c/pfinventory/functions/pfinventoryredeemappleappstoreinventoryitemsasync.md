---
author: jasonsandlin
title: "PFInventoryRedeemAppleAppStoreInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemAppleAppStoreInventoryItemsAsync  

Redeem items.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemAppleAppStoreInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemAppleAppStoreInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemAppleAppStoreInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemappleappstoreinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on iOS. Redeem items from the Apple App Store. When the asynchronous task is complete, call [PFInventoryRedeemAppleAppStoreInventoryItemsGetResultSize](pfinventoryredeemappleappstoreinventoryitemsgetresultsize.md) and [PFInventoryRedeemAppleAppStoreInventoryItemsGetResult](pfinventoryredeemappleappstoreinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
