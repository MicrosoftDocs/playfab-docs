---
author: tomcoMSFT
title: "PFLobbyArrangedJoinConfiguration"
description: "The initial configuration data used when joining an arranged lobby."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyArrangedJoinConfiguration  

The initial configuration data used when joining an arranged lobby.  

## Syntax  
  
```cpp
typedef struct PFLobbyArrangedJoinConfiguration {  
    uint32_t maxMemberCount;  
    PFLobbyOwnerMigrationPolicy ownerMigrationPolicy;  
    PFLobbyAccessPolicy accessPolicy;  
    uint32_t memberPropertyCount;  
    const char* memberPropertyKeys;  
    const char* memberPropertyValues;  
} PFLobbyArrangedJoinConfiguration  
```
  
### Members  
  
**`maxMemberCount`** &nbsp; uint32_t  
  
The maximum number of members allowed in the lobby, if joiner is the first member in the lobby.
  
This value must be at least ```PFLobbyMaxMemberCountLowerLimit``` and no more than ```PFLobbyMaxMemberCountUpperLimit```. <br /><br /> If a client would violate this limit by calling [PFMultiplayerJoinLobby()](../functions/pfmultiplayerjoinlobby.md) or [PFLobbyAddMember](../functions/pflobbyaddmember.md), the operation will fail asynchronously.
  
**`ownerMigrationPolicy`** &nbsp; [PFLobbyOwnerMigrationPolicy](../enums/pflobbyownermigrationpolicy.md)  
  
The owner migration policy for the lobby, if the joiner is the first member in the lobby.
  
This value cannot be set to ```PFLobbyOwnerMigrationPolicy::Server```.
  
**`accessPolicy`** &nbsp; [PFLobbyAccessPolicy](../enums/pflobbyaccesspolicy.md)  
  
The access policy for the lobby, if the joiner is the first member in the lobby.
  
**`memberPropertyCount`** &nbsp; uint32_t  
  
The number of initial member properties for the joiner of the lobby.
  
**`memberPropertyKeys`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The keys of the initial member properties for the joiner of the lobby.
  
Per-member properties are only visible to members of the lobby.
  
**`memberPropertyValues`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The values of the initial member properties for the joiner of the lobby.
  
Per-member properties are only visible to members of the lobby.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
