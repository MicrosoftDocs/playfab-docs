---
author: jdeweyMSFT
title: "PartyManager::GetChatControls"
description: Gets an array that contains a combined list of all chat controls on the local device and all remote devices.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*library-allocated output*  
  
The output number of networks to which the local device is connected provided in `chatControls`.  
  
**`chatControls`** &nbsp; [PartyChatControlArray*](../../../typedefs.md)  
*library-allocated output array of size `*chatControlCount`*  
  
A library-allocated output array containing the list of all chat controls.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to either [PartyLocalDevice::CreateChatControl()](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) or [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md). The individual chat control objects are valid until the chat control is destroyed and all state changes referencing the chat control object are returned via [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyLocalDevice::CreateChatControl](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyManager::StartProcessingStateChanges](partymanager_startprocessingstatechanges.md)  
[PartyManager::FinishProcessingStateChanges](partymanager_finishprocessingstatechanges.md)
  
  
