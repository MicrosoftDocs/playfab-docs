---
author: jasonsandlin
title: "PFHCWebSocketCloseHandle"
description: "Decrements the reference count on the WebSocket object."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketCloseHandle  

Decrements the reference count on the WebSocket object.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketCloseHandle(  
    PFHCWebsocketHandle websocket  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
Handle to the WebSocket.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
When the ref count is 0, PFHCWebSocketCloseHandle() will free the memory associated with the PFHCWebsocketHandle.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
