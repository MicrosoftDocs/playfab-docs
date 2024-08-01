---
author: jasonsandlin
title: "PFHCWebSocketDisconnect"
description: "Disconnects / closes the WebSocket."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketDisconnect  

Disconnects / closes the WebSocket.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketDisconnect(  
    PFHCWebsocketHandle websocket  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
Handle to the WebSocket.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
