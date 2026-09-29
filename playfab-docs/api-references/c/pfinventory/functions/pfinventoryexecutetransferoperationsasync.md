---
author: jasonsandlin
title: "PFInventoryExecuteTransferOperationsAsync"
description: "Transfer a list of inventory items. A maximum list of 50 operations can be performed by a single request. When the response code is 202, one or more operations did not complete within the timeframe of the request. You can identify the pending operations by looking for OperationStatus = 'InProgress'. You can check on the operation status at anytime within 1 day of the request by passing the TransactionToken to the GetInventoryOperationStatus API."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryExecuteTransferOperationsAsync  

Transfer a list of inventory items. A maximum list of 50 operations can be performed by a single request. When the response code is 202, one or more operations did not complete within the timeframe of the request. You can identify the pending operations by looking for OperationStatus = 'InProgress'. You can check on the operation status at anytime within 1 day of the request by passing the TransactionToken to the GetInventoryOperationStatus API.  

## Syntax  
  
```cpp
HRESULT PFInventoryExecuteTransferOperationsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryExecuteTransferOperationsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryExecuteTransferOperationsRequest*](../../pfinventorytypes/structs/pfinventoryexecutetransferoperationsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Transfer the specified list of inventory items of an entity's container Id to another entity's container Id. When the asynchronous task is complete, call [PFInventoryExecuteTransferOperationsGetResultSize](pfinventoryexecutetransferoperationsgetresultsize.md) and [PFInventoryExecuteTransferOperationsGetResult](pfinventoryexecutetransferoperationsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
