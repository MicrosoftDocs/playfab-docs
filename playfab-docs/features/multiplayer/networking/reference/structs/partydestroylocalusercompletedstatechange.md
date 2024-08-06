---
author: jdeweyMSFT
title: "PartyDestroyLocalUserCompletedStateChange"
description: "Information specific to the *DestroyLocalUserCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyDestroyLocalUserCompletedStateChange  

Information specific to the *DestroyLocalUserCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyDestroyLocalUserCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalUser* localUser;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the destroy local user operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
## Remarks  
  
This PartyLocalUser will be removed from all dependent networks prior to this state change. All dependent PartyEndpoint and PartyChatControl objects will be destroyed with reason [PartyDestroyedReason::UserRemoved](../enums/partydestroyedreason.md) prior to the PartyLocalUser being removed from its dependent networks. Once this state change is returned to [PartyManager::FinishProcessingStateChanges()](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md), the PartyLocalUser object memory will become invalid.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::DestroyLocalUser](../classes/PartyManager/methods/partymanager_destroylocaluser.md)
  
  
