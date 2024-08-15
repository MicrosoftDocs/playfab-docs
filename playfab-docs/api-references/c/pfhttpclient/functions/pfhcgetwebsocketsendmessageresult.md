---
author: jasonsandlin
title: "PFHCGetWebSocketSendMessageResult"
description: "Gets the result from PFHCWebSocketSendMessage."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCGetWebSocketSendMessageResult  

Gets the result from PFHCWebSocketSendMessage.  

## Syntax  
  
```cpp
HRESULT PFHCGetWebSocketSendMessageResult(  
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
  
Returns the duplicated handle.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
