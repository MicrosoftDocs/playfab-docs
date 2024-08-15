---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsAsync"
description: "Transfer inventory items. When transferring across collections, a 202 response indicates that the transfer did not complete within the timeframe of the request. You can identify the pending operations by looking for OperationStatus = 'InProgress'. You can check on the operation status at anytime within 30 days of the request by passing the TransactionToken to the GetInventoryOperationStatus API. More information about item transfer scenarios can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/inventory/?tabs=inventory-game-manager#transfer-inventory-items"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransferInventoryItemsAsync  

Transfer inventory items. When transferring across collections, a 202 response indicates that the transfer did not complete within the timeframe of the request. You can identify the pending operations by looking for OperationStatus = 'InProgress'. You can check on the operation status at anytime within 30 days of the request by passing the TransactionToken to the GetInventoryOperationStatus API. More information about item transfer scenarios can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/inventory/?tabs=inventory-game-manager#transfer-inventory-items  

## Syntax  
  
```cpp
HRESULT PFInventoryTransferInventoryItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryTransferInventoryItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryTransferInventoryItemsRequest*](../../pfinventorytypes/structs/pfinventorytransferinventoryitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Transfer the specified inventory items of an entity's container Id to another entity's container Id. When the asynchronous task is complete, call [PFInventoryTransferInventoryItemsGetResultSize](pfinventorytransferinventoryitemsgetresultsize.md) and [PFInventoryTransferInventoryItemsGetResult](pfinventorytransferinventoryitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
