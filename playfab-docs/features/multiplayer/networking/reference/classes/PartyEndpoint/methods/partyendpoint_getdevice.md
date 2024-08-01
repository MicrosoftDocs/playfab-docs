---
author: jdeweyMSFT
title: "PartyEndpoint::GetDevice"
description: Gets the device associated with this endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyEndpoint::GetDevice  

Gets the device associated with this endpoint.  

## Syntax  
  
```cpp
PartyError GetDevice(  
    PartyDevice** device  
)  
```  
  
### Parameters  
  
**`device`** &nbsp; [PartyDevice**](../../PartyDevice/partydevice.md)  
*library-allocated output*  
  
The output device associated with this endpoint.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  

  
  
