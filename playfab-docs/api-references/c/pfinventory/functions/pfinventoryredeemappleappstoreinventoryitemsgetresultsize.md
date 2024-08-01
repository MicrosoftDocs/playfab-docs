---
author: jasonsandlin
title: "PFInventoryRedeemAppleAppStoreInventoryItemsGetResultSize"
description: "Get the size in bytes needed to store the result of a RedeemAppleAppStoreInventoryItems call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemAppleAppStoreInventoryItemsGetResultSize  

Get the size in bytes needed to store the result of a RedeemAppleAppStoreInventoryItems call.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemAppleAppStoreInventoryItemsGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
