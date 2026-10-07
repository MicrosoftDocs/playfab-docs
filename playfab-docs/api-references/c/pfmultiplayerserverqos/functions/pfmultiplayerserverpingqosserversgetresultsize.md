---
author: jasonsandlin
title: "PFMultiplayerServerPingQosServersGetResultSize"
description: "Get the size in bytes needed to store the result of a PFMultiplayerServerPingQosServersAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/06/2026
---

# PFMultiplayerServerPingQosServersGetResultSize  

Get the size in bytes needed to store the result of a PFMultiplayerServerPingQosServersAsync call.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerPingQosServersGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerQoS.h
  
## See also  
[PFMultiplayerServerQoS members](../pfmultiplayerserverqos_members.md)  

  
  
