---
author: jasonsandlin
title: "PFInventoryExecuteInventoryOperationsAsync"
description: "Execute a list of Inventory Operations"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryExecuteInventoryOperationsAsync  

Execute a list of Inventory Operations  

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
  
Execute a list of Inventory Operations for an Entity. If successful, call [PFInventoryExecuteInventoryOperationsGetResult](pfinventoryexecuteinventoryoperationsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
