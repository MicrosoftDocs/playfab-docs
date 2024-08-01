---
author: jasonsandlin
title: "PFMultiplayerServerRequestMultiplayerServerRequest"
description: "PFMultiplayerServerRequestMultiplayerServerRequest data model. Requests a multiplayer server session from a particular build in any of the given preferred regions."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerRequestMultiplayerServerRequest  

PFMultiplayerServerRequestMultiplayerServerRequest data model. Requests a multiplayer server session from a particular build in any of the given preferred regions.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerRequestMultiplayerServerRequest {  
    PFMultiplayerServerBuildAliasParams const* buildAliasParams;  
    const char* buildId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* const* initialPlayers;  
    uint32_t initialPlayersCount;  
    const char* const* preferredRegions;  
    uint32_t preferredRegionsCount;  
    const char* sessionCookie;  
    const char* sessionId;  
} PFMultiplayerServerRequestMultiplayerServerRequest;  
```
  
### Members  
  
**`buildAliasParams`** &nbsp; [PFMultiplayerServerBuildAliasParams](pfmultiplayerserverbuildaliasparams.md) const*  
*may be nullptr*  
  
(Optional) The identifiers of the build alias to use for the request.
  
**`buildId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The guid string build ID of the multiplayer server to request.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`initialPlayers`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Initial list of players (potentially matchmade) allowed to connect to the game. This list is passed to the game server when requested (via GSDK) and can be used to validate players connecting to it.
  
**`initialPlayersCount`** &nbsp; uint32_t  
  
Count of initialPlayers
  
**`preferredRegions`** &nbsp; const char* const*  
  
The preferred regions to request a multiplayer server from. The Multiplayer Service will iterate through the regions in the specified order and allocate a server from the first one that has servers available.
  
**`preferredRegionsCount`** &nbsp; uint32_t  
  
Count of preferredRegions
  
**`sessionCookie`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Data encoded as a string that is passed to the game server when requested. This can be used to to communicate information such as game mode or map through the request flow.
  
**`sessionId`** &nbsp; const char*  
*is null-terminated*  
  
A guid string session ID created track the multiplayer server session over its life.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
