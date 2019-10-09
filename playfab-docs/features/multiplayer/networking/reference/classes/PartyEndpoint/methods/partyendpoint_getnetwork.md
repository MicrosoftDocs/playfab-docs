---
author: jdeweyMSFT
title: "PartyEndpoint::GetNetwork"
description: Gets the network associated with this endpoint.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyEndpoint::GetNetwork  

Gets the network associated with this endpoint.  

## Syntax  
  
```cpp
PartyError GetNetwork(  
    PartyNetwork** network  
)  
```  
  
### Parameters  
  
**`network`** &nbsp; [PartyNetwork**](../../PartyNetwork/partynetwork.md)  
*output*  
  
The output network associated with this endpoint.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  

  
  
