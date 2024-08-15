---
author: jasonsandlin
title: "PFHCWebSocketSetHeader"
description: "Set a header for the WebSocket."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSetHeader  

Set a header for the WebSocket.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSetHeader(  
    PFHCWebsocketHandle websocket,  
    const char* headerName,  
    const char* headerValue  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the WebSocket.  
  
**`headerName`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded header name for the WebSocket.  
  
**`headerValue`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded header value for the WebSocket.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCWebSocketConnectAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
