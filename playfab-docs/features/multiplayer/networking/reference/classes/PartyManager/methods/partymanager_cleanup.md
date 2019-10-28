---
author: jdeweyMSFT
title: "PartyManager::Cleanup"
description: Immediately reclaims all resources associated with the PartyManager object.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyManager::Cleanup  

Immediately reclaims all resources associated with the PartyManager object.  

## Syntax  
  
```cpp
PartyError Cleanup(  
)  
```  
  
### Parameters  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
If local users were participating in a PartyNetwork, they are removed ungracefully (it appears to remote devices as if network connectivity to this device has been lost), so best practice is to call [PartyNetwork::LeaveNetwork()](../../PartyNetwork/methods/partynetwork_leavenetwork.md) first on all networks returned from a call to [GetNetworks()](partymanager_getnetworks.md) and wait for the corresponding [PartyLeaveNetworkCompletedStateChange](../../../structs/partyleavenetworkcompletedstatechange.md) to have the local users exit any existing PartyNetworks gracefully. <br /><br /> Every call to [Initialize()](partymanager_initialize.md) should have a corresponding Cleanup() call.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::Initialize](partymanager_initialize.md)  
[PartyNetwork::LeaveNetwork](../../PartyNetwork/methods/partynetwork_leavenetwork.md)  
[PartyManager::GetNetworks](partymanager_getnetworks.md)
  
  
