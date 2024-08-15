---
author: jasonsandlin
title: "PFInventoryExecuteInventoryOperationsAsync"
description: "Execute a list of Inventory Operations. A maximum list of 10 operations can be performed by a single request. There is also a limit to 250 items that can be modified/added in a single request. For example, adding a bundle with 50 items counts as 50 items modified. All operations must be done within a single inventory collection. This API has a reduced RPS compared to an individual inventory operation with Player Entities limited to 15 requests in 90 seconds and Title Entities limited to 500 requests in 10 seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryExecuteInventoryOperationsAsync  

Execute a list of Inventory Operations. A maximum list of 10 operations can be performed by a single request. There is also a limit to 250 items that can be modified/added in a single request. For example, adding a bundle with 50 items counts as 50 items modified. All operations must be done within a single inventory collection. This API has a reduced RPS compared to an individual inventory operation with Player Entities limited to 15 requests in 90 seconds and Title Entities limited to 500 requests in 10 seconds.  

## Syntax  
  
```cpp
HRESULT PFInventoryExecuteInventoryOperationsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryExecuteInventoryOperationsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryExecuteInventoryOperationsRequest*](../../pfinventorytypes/structs/pfinventoryexecuteinventoryoperationsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Execute a list of Inventory Operations for an Entity. When the asynchronous task is complete, call [PFInventoryExecuteInventoryOperationsGetResultSize](pfinventoryexecuteinventoryoperationsgetresultsize.md) and [PFInventoryExecuteInventoryOperationsGetResult](pfinventoryexecuteinventoryoperationsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
