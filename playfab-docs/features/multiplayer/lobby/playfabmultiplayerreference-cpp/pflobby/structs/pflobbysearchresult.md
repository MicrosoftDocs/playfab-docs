---
author: ScottMunroMS
title: "PFLobbySearchResult"
description: "An entry in the collection of lobby search results received upon successful completion of a [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) operation."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 07/14/2023
---

# PFLobbySearchResult  

An entry in the collection of lobby search results received upon successful completion of a [PFMultiplayerFindLobbies](../functions/pfmultiplayerfindlobbies.md) operation.  

## Syntax  
  
```cpp
struct PFLobbySearchResult {  
    const char* lobbyId;  
    const char* connectionString;  
    const PFEntityKey* ownerEntity;  
    uint32_t maxMemberCount;  
    uint32_t currentMemberCount;  
    uint32_t searchPropertyCount;  
    const char* const* searchPropertyKeys;  
    const char* const* searchPropertyValues;  
    uint32_t friendCount;  
    const PFEntityKey* friends;  
    PFLobbyMembershipLock membershipLock;  
}  
```
  
### Members  
  
**`lobbyId`** &nbsp; const char*  
*is null-terminated*  
  
The ID of the found lobby.
  
**`connectionString`** &nbsp; const char*  
*is null-terminated*  
  
The connection string of the found lobby.
  
```connectionString``` can be null. In this case, an invite is required to join.
  
**`ownerEntity`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*may be nullptr*  
  
The current owner of the lobby.
  
```ownerEntity``` may be null if the lobby doesn't currently have an owner.
  
**`maxMemberCount`** &nbsp; uint32_t  
  
The maximum number of members that can be present in this lobby.
  
**`currentMemberCount`** &nbsp; uint32_t  
  
The current number of members that are present in this lobby.
  
**`searchPropertyCount`** &nbsp; uint32_t  
  
The number of search properties associated with this lobby.
  
**`searchPropertyKeys`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The keys of the search properties associated with this lobby.
  
**`searchPropertyValues`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The values of the search properties associated with this lobby.
  
**`friendCount`** &nbsp; uint32_t  
  
The number of friends in the found lobby, if the lobby search was performed with a ```PFLobbySearchFriendsFilter```.
  
If the lobby search which generated this search result was not performed with a ```PFLobbySearchFriendsFilter```, this value will always be 0. <br /><br /> In some multiplayer social networks, friendship is a unidirectional relationship. One user may "follow" another or be their friend, but the same is not necessarily true in the reverse direction. Friends will only be returned in this search result when a bidirectional friendship exists. That is, the user querying for the lobby and the user in the lobby must both be friends with each other.
  
**`friends`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*array of size `friendCount`*  
  
The list of friends in the found lobby, if the lobby search was performed with a ```PFLobbySearchFriendsFilter```.
  
If the lobby search which generated this search result was not performed with a ```PFLobbySearchFriendsFilter```, this list will always be empty. <br /><br /> In some multiplayer social networks, friendship is a unidirectional relationship. One user may "follow" another or be their friend, but the same is not necessarily true in the reverse direction. Friends will only be returned in this search result when a bidirectional friendship exists. That is, the user querying for the lobby and the user in the lobby must both be friends with each other.
  
**`membershipLock`** &nbsp; [PFLobbyMembershipLock](../enums/pflobbymembershiplock.md)  
  
The current lock state of the found lobby.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
