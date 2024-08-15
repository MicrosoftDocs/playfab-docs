---
author: jasonsandlin
title: "PFInventoryRedeemSteamInventoryItemsAsync"
description: "Redeem items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemSteamInventoryItemsAsync  

Redeem items.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemSteamInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryRedeemSteamInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryRedeemSteamInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventoryredeemsteaminventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32 and macOS. Redeem inventory items from Steam. When the asynchronous task is complete, call [PFInventoryRedeemSteamInventoryItemsGetResultSize](pfinventoryredeemsteaminventoryitemsgetresultsize.md) and [PFInventoryRedeemSteamInventoryItemsGetResult](pfinventoryredeemsteaminventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
