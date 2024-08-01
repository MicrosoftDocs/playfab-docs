---
author: jasonsandlin
title: "PFHCWebSocketGetBinaryMessageFragmentEventFunction"
description: "Gets the WebSocket binary message fragment handler."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketGetBinaryMessageFragmentEventFunction  

Gets the WebSocket binary message fragment handler.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketGetBinaryMessageFragmentEventFunction(  
    PFHCWebsocketHandle websocket,  
    PFHCWebSocketBinaryMessageFragmentFunction* binaryMessageFragmentFunc,  
    void** functionContext  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the websocket.  
  
**`binaryMessageFragmentFunc`** &nbsp; PFHCWebSocketBinaryMessageFragmentFunction*  
*output*  
  
Returned binaryMessageFragmentFunc.  
  
**`functionContext`** &nbsp; void**  
*output*  
  
Client context to pass to callback function.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_HC_NOT_INITIALISED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
