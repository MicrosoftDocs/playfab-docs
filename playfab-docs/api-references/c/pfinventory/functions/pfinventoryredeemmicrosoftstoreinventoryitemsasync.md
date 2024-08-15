---
author: jasonsandlin
title: "PFInventoryRedeemMicrosoftStoreInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemMicrosoftStoreInventoryItemsAsync  

Redeem items.  

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
  
This API is available on Win32, GDK, Linux, and macOS. Redeem items from the Microsoft Store. When the asynchronous task is complete, call [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResultSize](pfinventoryredeemmicrosoftstoreinventoryitemsgetresultsize.md) and [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResult](pfinventoryredeemmicrosoftstoreinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
