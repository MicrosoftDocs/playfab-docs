---
author: ScottMunroMS
title: "PFLobbyDataUpdate"
description: "A request to make an update to the shared portion of the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyDataUpdate  

A request to make an update to the shared portion of the lobby.  

## Syntax  
  
```cpp
struct PFLobbyDataUpdate {  
    const PFEntityKey* newOwner;  
    const uint32_t* maxMemberCount;  
    const PFLobbyAccessPolicy* accessPolicy;  
    const PFLobbyMembershipLock* membershipLock;  
    uint32_t searchPropertyCount;  
    const char* const* searchPropertyKeys;  
    const char* const* searchPropertyValues;  
    uint32_t lobbyPropertyCount;  
    const char* const* lobbyPropertyKeys;  
    const char* const* lobbyPropertyValues;  
}  
```
  
### Members  
  
**`newOwner`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*may be nullptr*  
  
An optional, new owner of the lobby.
  
This value can only be updated under one of the following conditions:
* The member updating this field is the lobby's current owner
* The owner migration policy is ```PFLobbyOwnerMigrationPolicy::Manual``` and there is currently no owner
* The owner migration policy is ```PFLobbyOwnerMigrationPolicy::None``` <br /><br /> If this lobby is client-owned (the current owner is a title_player_account entity), the new owner must also be a title_player_account entity. If this lobby is server-owned (the current owner is a game_server entity), the new owner must also be a game_server entity.
  
**`maxMemberCount`** &nbsp; const uint32_t*  
*may be nullptr*  
  
An optional, updated capacity for the number of members in this lobby.
  
This new value must be greater than than the number of members currently in the lobby and less than ```PFLobbyMaxMemberCountUpperLimit```. <br /><br /> This value can only be updated by the current lobby owner.
  
**`accessPolicy`** &nbsp; const [PFLobbyAccessPolicy](../enums/pflobbyaccesspolicy.md)*  
*may be nullptr*  
  
An optional, updated access policy for this lobby.
  
This value can only be updated by the current lobby owner.
  
**`membershipLock`** &nbsp; const [PFLobbyMembershipLock](../enums/pflobbymembershiplock.md)*  
*may be nullptr*  
  
An optional update to the membership lock on this lobby.
  
This value can only be updated by the current lobby owner.
  
**`searchPropertyCount`** &nbsp; uint32_t  
  
The number of search properties to update.
  
Only the current lobby owner can update the search properties. <br /><br /> There may only be ```PFLobbyMaxSearchPropertyCount``` concurrent search properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted.   <br /><br /> If the property limits are violated, the entire update operation will fail.
  
**`searchPropertyKeys`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The keys of the search properties to update.
  
Only the current lobby owner can update the lobby properties. <br /><br /> Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results.   <br /><br /> Only the properties specified in this list of keys will be updated. If the key doesn't exist yet, the property will be created. If the new property value is nullptr, the property will be deleted. Any existing properties omitted from this list will be left unmodified.   <br /><br /> Search properties must be of the form string_keyN or number_keyN where "N" is a number between 1 and ```PFLobbyMaxSearchPropertyCount```. e.g. string_key1, number_key14, etc. <br /><br />
  
**`searchPropertyValues`** &nbsp; const char* const*  
*array of size `searchPropertyCount`*  
  
The values of the search properties to update.
  
Only the current lobby owner can update the search properties. <br /><br /> Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results.   <br /><br /> To delete a value, provide nullptr as its new value.
  
**`lobbyPropertyCount`** &nbsp; uint32_t  
  
The number of lobby properties to update.
  
Only the current lobby owner can update the lobby properties. <br /><br /> There may only be ```PFLobbyMaxLobbyPropertyCount``` concurrent lobby properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted.   <br /><br /> If the property limits are violated, the entire update operation will fail.
  
**`lobbyPropertyKeys`** &nbsp; const char* const*  
*array of size `lobbyPropertyCount`*  
  
The keys of the lobby properties to update.
  
Only the current lobby owner can update the lobby properties. <br /><br /> Lobby properties are only visible to members of the lobby.   <br /><br /> Only the properties specified in this list of keys will be updated. If the key doesn't exist yet, the property will be created. If the new property value is nullptr, the property will be deleted. Any existing properties omitted from this list will be left unmodified.
  
**`lobbyPropertyValues`** &nbsp; const char* const*  
*array of size `lobbyPropertyCount`*  
  
The values of the lobby properties to update.
  
Only the current lobby owner can update the lobby properties. <br /><br /> Lobby properties are only visible to members of the lobby.   <br /><br /> To delete a value, provide nullptr as its new value.
  
## Remarks  
  
Most data in the shared portion of the lobby can only be updated by the owner. Check the documentation for each field for confirmation.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
