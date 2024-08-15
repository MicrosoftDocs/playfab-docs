---
author: jasonsandlin
title: "PFHCWebSocketSetProxyDecryptsHttps"
description: "Allows proxy server to decrypt and inspect traffic; should be used only for debugging purposes This must be called after calling PFHCWebSocketSetProxyUri. Only applies to Win32 non-GDK builds"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSetProxyDecryptsHttps  

Allows proxy server to decrypt and inspect traffic; should be used only for debugging purposes This must be called after calling PFHCWebSocketSetProxyUri. Only applies to Win32 non-GDK builds  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSetProxyDecryptsHttps(  
    PFHCWebsocketHandle websocket,  
    bool allowProxyToDecryptHttps  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the WebSocket  
  
**`allowProxyToDecryptHttps`** &nbsp; bool  
  
true is proxy can decrypt, false is not allowed to decrypt  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
