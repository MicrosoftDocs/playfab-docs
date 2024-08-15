---
author: jasonsandlin
title: "PFInventoryGetMicrosoftStoreAccessTokensAsync"
description: "Gets the access tokens."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetMicrosoftStoreAccessTokensAsync  

Gets the access tokens.  

## Syntax  
  
```cpp
HRESULT PFInventoryGetMicrosoftStoreAccessTokensAsync(  
    PFEntityHandle entityHandle,  
    const PFInventoryGetMicrosoftStoreAccessTokensRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFInventoryGetMicrosoftStoreAccessTokensRequest*](../../pfinventorytypes/structs/pfinventorygetmicrosoftstoreaccesstokensrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, GDK, Linux, and macOS. Gets the access tokens for Microsoft Store authentication. When the asynchronous task is complete, call [PFInventoryGetMicrosoftStoreAccessTokensGetResultSize](pfinventorygetmicrosoftstoreaccesstokensgetresultsize.md) and [PFInventoryGetMicrosoftStoreAccessTokensGetResult](pfinventorygetmicrosoftstoreaccesstokensgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFInventory.h
  
## See also  
[PFInventory members](../pfinventory_members.md)  

  
  
