---
author: jasonsandlin
title: "PFInventoryRedeemMicrosoftStoreInventoryItemsAsync"
description: "Redeem items from the Microsoft Store. Supported entitlement types are Developer Manager Consumable and Durable."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryRedeemMicrosoftStoreInventoryItemsAsync  

Redeem items from the Microsoft Store. Supported entitlement types are Developer Manager Consumable and Durable.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemMicrosoftStoreInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemMicrosoftStoreInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemMicrosoftStoreInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemmicrosoftstoreinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. Redeem items from the Microsoft Store. When the asynchronous task is complete, call [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResultSize](pfinventoryredeemmicrosoftstoreinventoryitemsgetresultsize.md) and [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResult](pfinventoryredeemmicrosoftstoreinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
