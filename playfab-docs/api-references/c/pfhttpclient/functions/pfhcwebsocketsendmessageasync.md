---
author: jasonsandlin
title: "PFHCWebSocketSendMessageAsync"
description: "Send message the WebSocket"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSendMessageAsync  

Send message the WebSocket  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSendMessageAsync(  
    PFHCWebsocketHandle websocket,  
    const char* message,  
    XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
Handle to the WebSocket.  
  
**`message`** &nbsp; char*  
*_In_z_*  
  
The UTF-8 encoded message to send.  
  
**`asyncBlock`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
The XAsyncBlock that defines the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
To get the result, first call PFHCGetWebSocketSendMessageResult inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
