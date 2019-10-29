---
author: jdeweyMSFT
title: "PartyEndpoint::GetLocal"
description: Gets the [PartyLocalEndpoint](../../PartyLocalEndpoint/partylocalendpoint.md) version of this endpoint.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyEndpoint::GetLocal  

Gets the [PartyLocalEndpoint](../../PartyLocalEndpoint/partylocalendpoint.md) version of this endpoint.  

## Syntax  
  
```cpp
PartyError GetLocal(  
    PartyLocalEndpoint** localEndpoint  
)  
```  
  
### Parameters  
  
**`localEndpoint`** &nbsp; [PartyLocalEndpoint**](../../PartyLocalEndpoint/partylocalendpoint.md)  
*output, may return nullptr*  
  
The output local version of this endpoint object, or nullptr if this is not a local endpoint.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  

  
  
