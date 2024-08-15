---
author: ScottMunroMS
title: "PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange"
description: "Information specific to the *GetEntityIdsFromXboxLiveUserIdsCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange  

Information specific to the *GetEntityIdsFromXboxLiveUserIdsCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange : PartyXblStateChange {  
    PartyXblStateChangeResult result;  
    PartyError errorDetail;  
    PartyString xboxLiveSandbox;  
    PartyXblLocalChatUser* localChatUser;  
    void* asyncIdentifier;  
    uint32_t entityIdMappingCount;  
    const PartyXblXboxUserIdToPlayFabEntityIdMapping* entityIdMappings;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyXblStateChangeResult](../enums/partyxblstatechangeresult.md)  
  
Indicates that the operation succeeded or the reason that it failed.
  
**`errorDetail`** &nbsp; [PartyError](../../../networking/reference/typedefs.md)  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
**`xboxLiveSandbox`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The device's Xbox Live sandbox which was used for this operation.
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user that was used to communicate with PlayFab.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`entityIdMappingCount`** &nbsp; uint32_t  
  
The number of Xbox Live User Id to PlayFab Entity Id mappings.
  
**`entityIdMappings`** &nbsp; const [PartyXblXboxUserIdToPlayFabEntityIdMapping](partyxblxboxuseridtoplayfabentityidmapping.md)*  
*array of size `entityIdMappingCount`*  
  
A list of Xbox Live User Id to PlayFab Entity Id mappings.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
