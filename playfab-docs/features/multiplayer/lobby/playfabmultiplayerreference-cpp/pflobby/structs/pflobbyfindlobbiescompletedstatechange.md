---
author: ScottMunroMS
title: "PFLobbyFindLobbiesCompletedStateChange"
description: "Information specific to the *FindLobbiesCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyFindLobbiesCompletedStateChange  

Information specific to the *FindLobbiesCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyFindLobbiesCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFEntityKey searchingEntity;  
    void* asyncContext;  
    uint32_t searchResultCount;  
    const PFLobbySearchResult* searchResults;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the search lobbies operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`searchingEntity`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`searchResultCount`** &nbsp; uint32_t  
  
The number of results returned by the search operation.
  
**`searchResults`** &nbsp; const [PFLobbySearchResult](pflobbysearchresult.md)*  
*array of size `searchResultCount`*  
  
The results returned by the search operation.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
