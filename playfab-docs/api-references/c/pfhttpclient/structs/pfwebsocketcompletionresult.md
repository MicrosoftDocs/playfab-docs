---
author: jasonsandlin
title: "PFWebSocketCompletionResult"
description: "Used by PFHCWebSocketConnectAsync() and PFHCWebSocketSendMessageAsync()."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFWebSocketCompletionResult  

Used by PFHCWebSocketConnectAsync() and PFHCWebSocketSendMessageAsync().  

## Syntax  
  
```cpp
typedef struct PFWebSocketCompletionResult {  
    PFHCWebsocketHandle websocket;  
    HRESULT errorCode;  
    uint32_t platformErrorCode;  
} PFWebSocketCompletionResult;  
```
  
### Members  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the HTTP call.
  
**`errorCode`** &nbsp; HRESULT  
  
The error code of the call. Possible values are S_OK, or E_FAIL.
  
**`platformErrorCode`** &nbsp; uint32_t  
  
The platform specific network error code of the call to be used for tracing / debugging.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
