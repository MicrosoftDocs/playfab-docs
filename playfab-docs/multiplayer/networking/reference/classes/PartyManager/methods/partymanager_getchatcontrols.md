---
author: jdeweyMSFT
title: "PartyManager::GetChatControls"
description: Gets an array that contains a combined list of all chat controls on the local device and all remote devices.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetChatControls  

Gets an array that contains a combined list of all chat controls on the local device and all remote devices.  

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
  
The output number of chat controls provided in `chatControls`.  
  
**`chatControls`** &nbsp; [PartyChatControlArray*](../../../typedefs.md)  
*library-allocated output array of size `*chatControlCount`*  
  
A library-allocated output array containing the list of all chat controls.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md), the chat control will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges() or [PartyLocalDevice::CreateChatControl()](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyLocalDevice::CreateChatControl](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalDevice::DestroyChatControl](../../PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)
  
  
