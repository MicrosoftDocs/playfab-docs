---
author: jdeweyMSFT
title: "PartyDevice::GetChatControls"
description: Gets the chat controls on this device.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyDevice::GetChatControls  

Gets the chat controls on this device.  

## Syntax  
  
```cpp
PartyError GetChatControls(  
    uint32_t* chatControlCount,  
    PartyChatControlArray* chatControls  
)  
```  
  
### Parameters  
  
**`chatControlCount`** &nbsp; uint32_t*  
*output*  
  
The output number of chat controls on this device.  
  
**`chatControls`** &nbsp; [PartyChatControlArray*](../../../typedefs.md)  
*library-allocated output array of size `*chatControlCount`*  
  
A library-allocated output array containing the chat controls on this device.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the chat control will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges(). If this is the local device, the memory for the array is also invalidated when [PartyLocalDevice::CreateChatControl()](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyDevice](../partydevice.md)  
[PartyLocalDevice::CreateChatControl](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalDevice::DestroyChatControl](../../PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)
  
  
