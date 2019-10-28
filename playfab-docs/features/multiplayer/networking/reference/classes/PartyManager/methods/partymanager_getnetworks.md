---
author: jdeweyMSFT
title: "PartyManager::GetNetworks"
description: Gets an array of all networks to which the local device is connected.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyManager::GetNetworks  

Gets an array of all networks to which the local device is connected.  

## Syntax  
  
```cpp
PartyError GetNetworks(  
    uint32_t* networkCount,  
    PartyNetworkArray* networks  
)  
```  
  
### Parameters  
  
**`networkCount`** &nbsp; uint32_t*  
*library-allocated output*  
  
The output number of networks to which the local device is connected provided in `networks`.  
  
**`networks`** &nbsp; [PartyNetworkArray*](../../../typedefs.md)  
*library-allocated output array of size `*networkCount`*  
  
A library-allocated output array containing the networks to which the local device is connected.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md). The individual network objects are valid until the network is destroyed and all state changes referencing the network have been returned via [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::ConnectToNetwork](partymanager_connecttonetwork.md)  
[PartyManager::StartProcessingStateChanges](partymanager_startprocessingstatechanges.md)
  
  
