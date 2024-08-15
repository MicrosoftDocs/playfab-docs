---
author: jasonsandlin
title: "PFHCWebSocketSetProxyUri"
description: "Set the proxy URI for the WebSocket."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSetProxyUri  

Set the proxy URI for the WebSocket.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSetProxyUri(  
    PFHCWebsocketHandle websocket,  
    const char* proxyUri  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the WebSocket.  
  
**`proxyUri`** &nbsp; char*  
*_In_z_*  
  
The UTF-8 encoded proxy URI for the WebSocket.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCWebSocketConnectAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
