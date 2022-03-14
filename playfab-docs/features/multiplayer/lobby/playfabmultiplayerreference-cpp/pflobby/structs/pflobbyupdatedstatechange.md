---
author: ScottMunroMS
title: "PFLobbyUpdatedStateChange"
description: "Information specific to the *Updated* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/11/2022
---

# PFLobbyUpdatedStateChange  

Information specific to the *Updated* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyUpdatedStateChange {  
    PFLobbyHandle lobby;  
    bool ownerUpdated;  
    bool maxMembersUpdated;  
    bool accessPolicyUpdated;  
    bool membershipLockUpdated;  
    uint32_t updatedSearchPropertyCount;  
    const char* updatedSearchPropertyKeys;  
    uint32_t updatedLobbyPropertyCount;  
    const char* updatedLobbyPropertyKeys;  
    uint32_t memberUpdateCount;  
    const PFLobbyMemberUpdateSummary* memberUpdates;  
}  
```
  
### Members  
  
**`lobby`** &nbsp; PFLobbyHandle  
*_Notnull_*  
  
The lobby which was updated.
  
**`ownerUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's owner was updated.
  
**`maxMembersUpdated`** &nbsp; bool  
  
A flag indicating if the maxmimum number of members allowed in the lobby has been updated.
  
**`accessPolicyUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's access policy was updated.
  
**`membershipLockUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's membership lock has updated.
  
**`updatedSearchPropertyCount`** &nbsp; uint32_t  
  
The number of search properties which have been updated.
  
**`updatedSearchPropertyKeys`** &nbsp; const char*  
*array of size `updatedSearchPropertyCount`*  
  
The keys of the search properties which have been updated.
  
**`updatedLobbyPropertyCount`** &nbsp; uint32_t  
  
The number of lobby properties which have been updated.
  
**`updatedLobbyPropertyKeys`** &nbsp; const char*  
*array of size `updatedLobbyPropertyCount`*  
  
The keys of the lobby properties which have been updated.
  
**`memberUpdateCount`** &nbsp; uint32_t  
  
The number of updates to the lobby members.
  
**`memberUpdates`** &nbsp; const [PFLobbyMemberUpdateSummary](pflobbymemberupdatesummary.md)*  
*array of size `memberUpdateCount`*  
  
The set of member updates.
  
## Remarks  
  
This state change signifies that the lobby has updated and provides hints as to which values have changed. Multiple updates may be provided by a single call to [PFMultiplayerStartProcessingLobbyStateChanges()](../functions/pfmultiplayerstartprocessinglobbystatechanges.md). All state reflected by these updates will become available simultaneously when PFMultiplayerStartProcessingLobbyStateChanges() is called, so the updates can be reconciled either individually or as a batch.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
