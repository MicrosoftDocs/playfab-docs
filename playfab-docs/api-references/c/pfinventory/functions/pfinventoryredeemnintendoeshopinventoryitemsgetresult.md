---
author: jasonsandlin
title: "PFInventoryRedeemNintendoEShopInventoryItemsGetResult"
description: "Gets the result of a successful PFInventoryRedeemNintendoEShopInventoryItemsAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFInventoryRedeemNintendoEShopInventoryItemsGetResult  

Gets the result of a successful PFInventoryRedeemNintendoEShopInventoryItemsAsync call.  

## Syntax  
  
```cpp
HRESULT PFInventoryRedeemNintendoEShopInventoryItemsGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFInventoryRedeemNintendoEShopInventoryItemsResponse** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFInventoryRedeemNintendoEShopInventoryItemsResponse**](../../pfinventorytypes/structs/pfinventoryredeemnintendoeshopinventoryitemsresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ACCOUNT_NOT_LINKED, E_PF_INVALID_NINTENDO_SWITCH_ACCOUNT_ID or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  