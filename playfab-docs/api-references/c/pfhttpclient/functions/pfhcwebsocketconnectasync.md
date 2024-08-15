---
author: jasonsandlin
title: "PFHCWebSocketConnectAsync"
description: "Connects to the WebSocket."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketConnectAsync  

Connects to the WebSocket.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketConnectAsync(  
    const char* uri,  
    const char* subProtocol,  
    PFHCWebsocketHandle websocket,  
    XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
**`uri`** &nbsp; char*  
*_In_z_*  
  
The UTF-8 encoded URI to connect to.  
  
**`subProtocol`** &nbsp; char*  
*_In_z_*  
  
The UTF-8 encoded subProtocol to connect to.  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the WebSocket.  
  
**`asyncBlock`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
The XAsyncBlock that defines the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
To get the result, first call PFHCGetWebSocketConnectResult inside the AsyncBlock callback or after the AsyncBlock is complete. On GDK and Win32 (Win 8+) the background work is scheduled to threads owned by WinHttp run in async mode. On UWP and XDK, the connection thread is owned and controlled by Windows::Networking::Sockets::MessageWebSocket. On Win32 (Win 7+), iOS, and Android, all background work (including initial connection process) will be added to the queue in the provided XAsyncBlock. LibHttpClient will create a reference to that queue but it is the responsibility of the caller to dispatch that queue for as long as the websocket connection is active. Note that work for PFHCWebSocketSendMessageAsync calls can be assigned to a separate queue if desired.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
