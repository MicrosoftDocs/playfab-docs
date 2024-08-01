---
author: jasonsandlin
title: "PFInventoryRedeemNintendoEShopInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemNintendoEShopInventoryItemsAsync  

Redeem items.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemNintendoEShopInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemNintendoEShopInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemNintendoEShopInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemnintendoeshopinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, Linux, and macOS. Redeem items from the Nintendo EShop. When the asynchronous task is complete, call [PFInventoryRedeemNintendoEShopInventoryItemsGetResultSize](pfinventoryredeemnintendoeshopinventoryitemsgetresultsize.md) and [PFInventoryRedeemNintendoEShopInventoryItemsGetResult](pfinventoryredeemnintendoeshopinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
