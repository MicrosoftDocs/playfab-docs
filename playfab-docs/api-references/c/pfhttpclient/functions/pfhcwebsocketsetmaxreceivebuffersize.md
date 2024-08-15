---
author: jasonsandlin
title: "PFHCWebSocketSetMaxReceiveBufferSize"
description: "Configures how large the WebSocket receive buffer is allowed to grow before passing messages to clients. If a single message exceeds the maximum buffer size, the message will be broken down and passed to clients via multiple calls to the PFHCWebSocketMessageFunction. The default value is 20kb."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSetMaxReceiveBufferSize  

Configures how large the WebSocket receive buffer is allowed to grow before passing messages to clients. If a single message exceeds the maximum buffer size, the message will be broken down and passed to clients via multiple calls to the PFHCWebSocketMessageFunction. The default value is 20kb.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSetMaxReceiveBufferSize(  
    PFHCWebsocketHandle websocket,  
    size_t bufferSizeInBytes  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the WebSocket  
  
**`bufferSizeInBytes`** &nbsp; size_t  
  
Maximum size (in bytes) for the WebSocket receive buffer.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
