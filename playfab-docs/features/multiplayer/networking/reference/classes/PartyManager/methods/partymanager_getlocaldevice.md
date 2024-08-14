---
author: jdeweyMSFT
title: "PartyManager::GetLocalDevice"
description: Gets the local device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetLocalDevice  

Gets the local device.  

## Syntax  
  
```cpp
PartyError GetLocalDevice(  
    PartyLocalDevice** localDevice  
)  
```  
  
### Parameters  
  
**`localDevice`** &nbsp; [PartyLocalDevice**](../../PartyLocalDevice/partylocaldevice.md)  
*library-allocated output*  
  
The output local device.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
The local device represents the physical device on which the title is executing, such as an Xbox One or PC. Once the library is initialized, this method will always succeed in returning a local device. The local device will also appear in the device list of any network to which the local device has connected via [ConnectToNetwork()](partymanager_connecttonetwork.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  

  
  
