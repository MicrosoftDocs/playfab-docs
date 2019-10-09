---
author: jdeweyMSFT
title: "PartyChatControl::GetDevice"
description: Returns the device this chat control is associated with.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyChatControl::GetDevice  

Returns the device this chat control is associated with.  

## Syntax  
  
```cpp
PartyError GetDevice(  
    PartyDevice** device  
)  
```  
  
### Parameters  
  
**`device`** &nbsp; [PartyDevice**](../../PartyDevice/partydevice.md)  
*output*  
  
The output device this chat control is associated with.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
