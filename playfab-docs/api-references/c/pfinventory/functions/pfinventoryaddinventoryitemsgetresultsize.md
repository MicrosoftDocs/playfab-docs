---
author: jasonsandlin
title: "PFInventoryAddInventoryItemsGetResultSize"
description: "Get the size in bytes needed to store the result of a AddInventoryItems call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryAddInventoryItemsGetResultSize  

Get the size in bytes needed to store the result of a AddInventoryItems call.  

## Syntax  
  
```cpp
HRESULT PFInventoryAddInventoryItemsGetResultSize(  
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
