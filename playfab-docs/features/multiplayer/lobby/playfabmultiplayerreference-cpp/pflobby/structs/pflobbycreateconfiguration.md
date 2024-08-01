---
author: ScottMunroMS
title: "PFLobbyCreateConfiguration"
description: "The initial configuration data used when creating a lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyCreateConfiguration  

The initial configuration data used when creating a lobby.  

## Syntax  
  
```cpp
struct PFLobbyCreateConfiguration {  
    uint32_t maxMemberCount;  
    PFLobbyOwnerMigrationPolicy ownerMigrationPolicy;  
    PFLobbyAccessPolicy accessPolicy;  
    uint32_t searchPropertyCount;  
    const char* const* searchPropertyKeys;  
    const char* const* searchPropertyValues;  
    uint32_t lobbyPropertyCount;  
    const char* const* lobbyPropertyKeys;  
    const char* const* lobbyPropertyValues;  
}  
```
  
### Members  
  
**`maxMemberCount`** &nbsp; uint32_t  
  
The maximum number of members allowed in the new lobby.
  
This value must be at least ```PFLobbyMaxMemberCountLowerLimit``` and no more than ```PFLobbyMaxMemberCountUpperLimit```. <br /><br /> If a client would violate this limit by calling [PFMultiplayerJoinLobby()](../functions/pfmultiplayerjoinlobby.md) or [PFLobbyAddMember](../functions/pflobbyaddmember.md), the operation will fail asynchronously.
  
**`ownerMigrationPolicy`** &nbsp; [PFLobbyOwnerMigrationPolicy](../enums/pflobbyownermigrationpolicy.md)  
  
The owner migration policy for the new lobby.
  
When passed to [PFMultiplayerCreateAndJoinLobby()](../functions/pfmultiplayercreateandjoinlobby.md), this value cannot be ```PFLobbyOwnerMigrationPolicy::Server```. When passed to [PFMultiplayerCreateAndClaimServerLobby()](../functions/pfmultiplayercreateandclaimserverlobby.md), this value must be ```PFLobbyOwnerMigrationPolicy::Server```.
  
**`accessPolicy`** &nbsp; [PFLobbyAccessPolicy](../enums/pflobbyaccesspolicy.md)  
  
The access policy for the new lobby.
  
**`searchPropertyCount`** &nbsp; uint32_t  
  
The number of initial search properties for the new lobby.
  
**`searchPropertyKeys`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The keys of the initial search properties for the new lobby.
  
Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results. <br /><br /> Search properties must be of the form string_keyN or number_keyN where "N" is a number between 1 and ```PFLobbyMaxSearchPropertyCount```. e.g. string_key1, number_key14, etc. <br /><br />
  
**`searchPropertyValues`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The values of the initial search properties for the new lobby.
  
Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results.
  
**`lobbyPropertyCount`** &nbsp; uint32_t  
  
The number of initial lobby properties for the new lobby.
  
**`lobbyPropertyKeys`** &nbsp; const char* const*  
*array of size `lobbyPropertyCount`*  
  
The keys of the initial lobby properties for the new lobby.
  
Lobby properties are only visible to members of the lobby.
  
**`lobbyPropertyValues`** &nbsp; const char* const*  
*array of size `lobbyPropertyCount`*  
  
The values of the initial lobby properties for the new lobby.
  
Lobby properties are only visible to members of the lobby.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
