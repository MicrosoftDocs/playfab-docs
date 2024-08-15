---
author: jasonsandlin
title: "PFHCWebSocketSetBinaryMessageFragmentEventFunction"
description: "Set the binary message fragment handler. The client functionContext passed to PFHCWebSocketCreate will also be passed to this handler."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSetBinaryMessageFragmentEventFunction  

Set the binary message fragment handler. The client functionContext passed to PFHCWebSocketCreate will also be passed to this handler.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSetBinaryMessageFragmentEventFunction(  
    PFHCWebsocketHandle websocket,  
    PFHCWebSocketBinaryMessageFragmentFunction binaryMessageFragmentFunc  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the websocket.  
  
**`binaryMessageFragmentFunc`** &nbsp; PFHCWebSocketBinaryMessageFragmentFunction  
  
A pointer to the binary message fragment handling callback to use, or a null pointer to remove.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
If this handler is not set, messages larger than the configured buffer size may still be broken down and passed to the PFHCWebSocketBinaryMessageFunction, but there will be no indication that they are partial messages. If large WebSocket messages are expected, it is recommended to either set this handler OR set a receive buffer large enough to hold the entire message.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
