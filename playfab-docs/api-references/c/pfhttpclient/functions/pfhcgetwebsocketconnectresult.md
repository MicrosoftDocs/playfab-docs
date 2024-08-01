---
author: jasonsandlin
title: "PFHCGetWebSocketConnectResult"
description: "Gets the result for PFHCGetWebSocketConnectResult."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCGetWebSocketConnectResult  

Gets the result for PFHCGetWebSocketConnectResult.  

## Syntax  
  
```cpp
HRESULT PFHCGetWebSocketConnectResult(  
    XAsyncBlock* asyncBlock,  
    PFWebSocketCompletionResult* result  
)  
```  
  
### Parameters  
  
**`asyncBlock`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
The XAsyncBlock that defines the async operation.  
  
**`result`** &nbsp; [PFWebSocketCompletionResult*](../structs/pfwebsocketcompletionresult.md)  
  
Pointer to the result payload.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
