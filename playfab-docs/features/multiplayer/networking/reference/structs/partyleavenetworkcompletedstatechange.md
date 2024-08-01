---
author: jdeweyMSFT
title: "PartyLeaveNetworkCompletedStateChange"
description: "Information specific to the *LeaveNetworkCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyLeaveNetworkCompletedStateChange  

Information specific to the *LeaveNetworkCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyLeaveNetworkCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the leave network operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
## Remarks  
  
An associated [PartyNetworkDestroyedStateChange](partynetworkdestroyedstatechange.md) will be generated before this state change is generated. The network object ```network``` is only valid until this state change is returned to [PartyManager::FinishProcessingStateChanges()](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::LeaveNetwork](../classes/PartyNetwork/methods/partynetwork_leavenetwork.md)
  
  
