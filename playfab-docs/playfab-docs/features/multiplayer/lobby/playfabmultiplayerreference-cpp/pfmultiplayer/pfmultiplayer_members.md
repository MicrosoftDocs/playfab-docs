---
author: ScottMunroMS
title: "PFMultiplayer C/C++ API overview - PFMultiplayer.h"
description: "PFMultiplayer C/C++ API overview - PFMultiplayer.h"
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFMultiplayer C/C++ API overview - PFMultiplayer.h
  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMultiplayerGetErrorMessage](functions/pfmultiplayergeterrormessage.md) | Get the human-readable form of an error. |  
| [PFMultiplayerInitialize](functions/pfmultiplayerinitialize.md) | Initializes an instance of the PlayFab Multiplayer library. |  
| [PFMultiplayerSetEntityToken](functions/pfmultiplayersetentitytoken.md) | Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token. |  
| [PFMultiplayerSetMemoryCallbacks](functions/pfmultiplayersetmemorycallbacks.md) | Optionally configures the memory allocation and freeing callbacks the Multiplayer library should use. |  
| [PFMultiplayerSetThreadAffinityMask](functions/pfmultiplayersetthreadaffinitymask.md) | Optionally configures the processor on which internal Multiplayer library threads will run. |  
| [PFMultiplayerUninitialize](functions/pfmultiplayeruninitialize.md) | Immediately reclaims all resources associated with all Multiplayer library objects. |  
  
## Callbacks  

| Callback | Description |  
| --- | --- |  
| [PFMultiplayerAllocateMemoryCallback](callbacks/pfmultiplayerallocatememorycallback.md) | A callback invoked every time a new memory buffer must be dynamically allocated by the PlayFab Multiplayer library. |  
| [PartyFreeMemoryCallback](callbacks/pfmultiplayerfreememorycallback.md) | A callback invoked every time a previously allocated memory buffer is no longer needed by the PlayFab Multiplayer library and can be freed. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFMultiplayerThreadId](enums/pfmultiplayerthreadid.md) | Threads that Multiplayer library uses for internal purposes.|  
