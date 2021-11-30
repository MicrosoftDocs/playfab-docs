---
author: tomcoMSFT
title: "PFMultiplayer"
description: TBD
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/09/2021
---

# PFMultiplayer members  

> [!IMPORTANT]
> This feature is in **private preview** for limited, Microsoft managed partners.

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMultiplayerGetErrorMessage](functions/pfmultiplayergeterrormessage.md) | Get the human-readable form of an error. |  
| [PFMultiplayerInitialize](functions/pfmultiplayerinitialize.md) | Initializes an instance of the PlayFab Multiplayer library. |  
| [PFMultiplayerSetEntityToken](functions/pfmultiplayersetentitytoken.md) | Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token. |  
| [PFMultiplayerSetMemoryCallbacks](functions/pfmultiplayersetmemorycallbacks.md) | Optionally configures the memory allocation and freeing callbacks the Multiplayer library should use. |  
| [PFMultiplayerSetThreadAffinityMask](functions/pfmultiplayersetthreadaffinitymask.md) | Optionally configures the processor on which internal Multiplayer library threads will run. |  
| [PFMultiplayerUninitialize](functions/pfmultiplayeruninitialize.md) | Immediately reclaims all resources associated with all Multiplayer library objects. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFMultiplayerThreadId](enums/pfmultiplayerthreadid.md) | Threads that Multiplayer library uses for internal purposes.|  
