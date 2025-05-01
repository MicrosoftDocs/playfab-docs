---
author: jdeweyMSFT
title: "PartyLocalEndpoint::GetLocalUser"
description: Gets the local user associated with this local endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalEndpoint::GetLocalUser  

Gets the local user associated with this local endpoint.  

## Syntax  
  
```cpp
PartyError GetLocalUser(  
    PartyLocalUser** localUser  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser**](../../PartyLocalUser/partylocaluser.md)  
*library-allocated output, may return nullptr*  
  
The output local user associated with this local endpoint, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If this endpoint isn't associated with a user, `localUser` is set to nullptr.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalEndpoint](../partylocalendpoint.md)  

  
  
