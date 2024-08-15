---
author: jasonsandlin
title: "PFInventoryRedeemGooglePlayInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemGooglePlayInventoryItemsAsync  

Redeem items.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemGooglePlayInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemGooglePlayInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemGooglePlayInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemgoogleplayinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Android. Redeem items from the Google Play Store. When the asynchronous task is complete, call [PFInventoryRedeemGooglePlayInventoryItemsGetResultSize](pfinventoryredeemgoogleplayinventoryitemsgetresultsize.md) and [PFInventoryRedeemGooglePlayInventoryItemsGetResult](pfinventoryredeemgoogleplayinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
