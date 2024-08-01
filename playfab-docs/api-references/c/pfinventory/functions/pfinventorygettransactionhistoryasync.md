---
author: jasonsandlin
title: "PFInventoryGetTransactionHistoryAsync"
description: "Get transaction history for a player. Up to 50 Events can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. Getting transaction history has a lower RPS limit than getting a Player's inventory with Player Entities having a limit of 30 requests in 300 seconds and Title Entities having a limit of 100 requests in 10 seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetTransactionHistoryAsync  

Get transaction history for a player. Up to 50 Events can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. Getting transaction history has a lower RPS limit than getting a Player's inventory with Player Entities having a limit of 30 requests in 300 seconds and Title Entities having a limit of 100 requests in 10 seconds.  

## Syntax  
  
```cpp
HRESULT PFInventoryGetTransactionHistoryAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryGetTransactionHistoryRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryGetTransactionHistoryRequest*](../../pfinventorytypes/structs/pfinventorygettransactionhistoryrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Get transaction history for specified entity and collection. When the asynchronous task is complete, call [PFInventoryGetTransactionHistoryGetResultSize](pfinventorygettransactionhistorygetresultsize.md) and [PFInventoryGetTransactionHistoryGetResult](pfinventorygettransactionhistorygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
