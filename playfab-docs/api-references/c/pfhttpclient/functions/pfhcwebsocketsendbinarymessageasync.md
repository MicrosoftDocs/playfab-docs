---
author: jasonsandlin
title: "PFHCWebSocketSendBinaryMessageAsync"
description: "Send binary message to the WebSocket."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketSendBinaryMessageAsync  

Send binary message to the WebSocket.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketSendBinaryMessageAsync(  
    PFHCWebsocketHandle websocket,  
    const uint8_t* payloadBytes,  
    uint32_t payloadSize,  
    XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
Handle to the WebSocket.  
  
**`payloadBytes`** &nbsp; uint8_t*  
*_In_reads_bytes_(payloadSize)*  
  
Binary data to send in byte buffer.  
  
**`payloadSize`** &nbsp; uint32_t  
  
Size of byte buffer.  
  
**`asyncBlock`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
The AsyncBlock that defines the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
To get the result, first call PFHCGetWebSocketSendMessageResult inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
