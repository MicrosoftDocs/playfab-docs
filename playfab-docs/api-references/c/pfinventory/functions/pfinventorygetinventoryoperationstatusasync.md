---
author: jasonsandlin
title: "PFInventoryGetInventoryOperationStatusAsync"
description: "Get the status of an inventory operation using an OperationToken. You can check on the operation status at anytime within 1 day of the request by passing the TransactionToken to the this API."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryGetInventoryOperationStatusAsync  

Get the status of an inventory operation using an OperationToken. You can check on the operation status at anytime within 1 day of the request by passing the TransactionToken to the this API.  

## Syntax  
  
```cpp
HRESULT PFInventoryGetInventoryOperationStatusAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryGetInventoryOperationStatusRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryGetInventoryOperationStatusRequest*](../../pfinventorytypes/structs/pfinventorygetinventoryoperationstatusrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Get the status of an Inventory Operation using an OperationToken. When the asynchronous task is complete, call [PFInventoryGetInventoryOperationStatusGetResultSize](pfinventorygetinventoryoperationstatusgetresultsize.md) and [PFInventoryGetInventoryOperationStatusGetResult](pfinventorygetinventoryoperationstatusgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
