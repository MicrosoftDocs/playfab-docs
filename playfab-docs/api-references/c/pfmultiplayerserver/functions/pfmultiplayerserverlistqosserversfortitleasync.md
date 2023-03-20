---
author: jasonsandlin
title: "PFMultiplayerServerListQosServersForTitleAsync"
description: "Lists quality of service servers for the title. By default, servers are only returned for regions where a Multiplayer Servers build has been deployed."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerListQosServersForTitleAsync  

Lists quality of service servers for the title. By default, servers are only returned for regions where a Multiplayer Servers build has been deployed.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerListQosServersForTitleAsync(  
    PFEntityHandle entityHandle,  
    const PFMultiplayerServerListQosServersForTitleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFMultiplayerServerListQosServersForTitleRequest*](../../pfmultiplayerservertypes/structs/pfmultiplayerserverlistqosserversfortitlerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Returns a list of quality of service servers for a title. If successful, call [PFMultiplayerServerListQosServersForTitleGetResult](pfmultiplayerserverlistqosserversfortitlegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFMultiplayerServer.h
  
## See also  
[PFMultiplayerServer members](../pfmultiplayerserver_members.md)  

  
  
