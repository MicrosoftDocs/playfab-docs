---
author: jdeweyMSFT
title: "PartyDevice::GetLocal"
description: Gets the [PartyLocalDevice](../../PartyLocalDevice/partylocaldevice.md) version of this device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyDevice::GetLocal  

Gets the [PartyLocalDevice](../../PartyLocalDevice/partylocaldevice.md) version of this device.  

## Syntax  
  
```cpp
PartyError GetLocal(  
    PartyLocalDevice** localDevice  
)  
```  
  
### Parameters  
  
**`localDevice`** &nbsp; [PartyLocalDevice**](../../PartyLocalDevice/partylocaldevice.md)  
*library-allocated output, may return nullptr*  
  
The output local version of this device object, or nullptr if this is not a local device.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyDevice](../partydevice.md)  

  
  
