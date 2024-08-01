---
author: ScottMunroMS
title: "PFLobbyUpdatedStateChange"
description: "Information specific to the *Updated* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyUpdatedStateChange  

Information specific to the *Updated* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyUpdatedStateChange : PFLobbyStateChange {  
    PFLobbyHandle lobby;  
    bool ownerUpdated;  
    bool maxMembersUpdated;  
    bool accessPolicyUpdated;  
    bool membershipLockUpdated;  
    uint32_t updatedSearchPropertyCount;  
    const char* const* updatedSearchPropertyKeys;  
    uint32_t updatedLobbyPropertyCount;  
    const char* const* updatedLobbyPropertyKeys;  
    uint32_t memberUpdateCount;  
    const PFLobbyMemberUpdateSummary* memberUpdates;  
    bool serverUpdated;  
    uint32_t updatedServerPropertyCount;  
    const char* const* updatedServerPropertyKeys;  
    bool serverConnectionStatusUpdated;  
}  
```
  
### Members  
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that updated.
  
**`ownerUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's owner updated.
  
**`maxMembersUpdated`** &nbsp; bool  
  
A flag indicating if the maximum number of members allowed in the lobby updated.
  
**`accessPolicyUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's access policy updated.
  
**`membershipLockUpdated`** &nbsp; bool  
  
A flag indicating if the lobby's membership lock updated.
  
**`updatedSearchPropertyCount`** &nbsp; uint32_t  
  
The number of search properties that updated.
  
**`updatedSearchPropertyKeys`** &nbsp; const char* const*  
*array of size `updatedSearchPropertyCount`*  
  
The keys of the search properties that updated.
  
**`updatedLobbyPropertyCount`** &nbsp; uint32_t  
  
The number of lobby properties that updated.
  
**`updatedLobbyPropertyKeys`** &nbsp; const char* const*  
*array of size `updatedLobbyPropertyCount`*  
  
The keys of the lobby properties that updated.
  
**`memberUpdateCount`** &nbsp; uint32_t  
  
The number of updates to the lobby members.
  
**`memberUpdates`** &nbsp; const [PFLobbyMemberUpdateSummary](pflobbymemberupdatesummary.md)*  
*array of size `memberUpdateCount`*  
  
The set of member updates.
  
**`serverUpdated`** &nbsp; bool  
  
A flag indicating if a client-owned lobby's joined server changed.
  
**`updatedServerPropertyCount`** &nbsp; uint32_t  
  
The number of properties that updated for a client-owned lobby's joined server.
  
**`updatedServerPropertyKeys`** &nbsp; const char* const*  
*array of size `updatedServerPropertyCount`*  
  
The keys of properties that updated for a client-owned lobby's joined server.
  
**`serverConnectionStatusUpdated`** &nbsp; bool  
  
A flag indicating whether the lobby server's connection status changed.
  
## Remarks  
  
This state change signifies that the lobby is updated and provides hints as to which values have changed. Multiple updates may be provided by a single call to [PFMultiplayerStartProcessingLobbyStateChanges()](../functions/pfmultiplayerstartprocessinglobbystatechanges.md). All state reflected by these updates become available simultaneously when PFMultiplayerStartProcessingLobbyStateChanges() is called, so the updates can be reconciled either individually or as a batch.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
