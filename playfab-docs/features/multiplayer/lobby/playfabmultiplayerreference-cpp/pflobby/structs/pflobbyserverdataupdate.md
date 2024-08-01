---
author: ScottMunroMS
title: "PFLobbyServerDataUpdate"
description: "A request to make an update to the associated server state of a client-owned lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyServerDataUpdate  

A request to make an update to the associated server state of a client-owned lobby.  

## Syntax  
  
```cpp
struct PFLobbyServerDataUpdate {  
    const PFEntityKey* newServer;  
    uint32_t serverPropertyCount;  
    const char* const* serverPropertyKeys;  
    const char* const* serverPropertyValues;  
}  
```
  
### Members  
  
**`newServer`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*may be nullptr*  
  
An optional, new server to be associated with the client-owned lobby.
  
If specified, this entity must be a game_server entity. <br /><br /> There can only be one server associated with a lobby at a time. Setting a new server here replaces the currently associated server in the lobby.
  
**`serverPropertyCount`** &nbsp; uint32_t  
  
The number of server properties to update.
  
There might only be ```PFLobbyMaxServerPropertyCount``` concurrent properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted. <br /><br /> If the property limits are violated, the entire update operation fails.
  
**`serverPropertyKeys`** &nbsp; const char* const*  
*array of size `serverPropertyCount`*  
  
The keys of the server properties to update.
  
<br /><br /> Only the properties specified in this list of keys are updated. If the key doesn't exist yet, the property will be created. If the new property value is nullptr, the property is deleted. Any existing properties omitted from this list are left unmodified.
  
**`serverPropertyValues`** &nbsp; const char* const*  
*array of size `serverPropertyCount`*  
  
The values of the server properties to update.
  
<br /><br /> To delete a value, provide nullptr as its new value.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
