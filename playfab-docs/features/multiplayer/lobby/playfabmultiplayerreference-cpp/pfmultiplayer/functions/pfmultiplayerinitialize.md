---
author: ScottMunroMS
title: "PFMultiplayerInitialize"
description: "Initializes an instance of the PlayFab Multiplayer library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMultiplayerInitialize  

Initializes an instance of the PlayFab Multiplayer library.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerInitialize(  
    const char* playFabTitleId,  
    PFMultiplayerHandle* handle  
)  
```  
  
### Parameters  
  
**`playFabTitleId`** &nbsp; char*  
*is null-terminated*  
  
The app's PlayFab Title ID.  
  
**`handle`** &nbsp; PFMultiplayerHandle*  
*library-allocated output*  
  
The output handle of the newly initialized PFMultiplayer API instance.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This must be called before any other method, aside from [PFMultiplayerSetMemoryCallbacks()](pfmultiplayersetmemorycallbacks.md), and [PFMultiplayerSetThreadAffinityMask()](pfmultiplayersetthreadaffinitymask.md). PFMultiplayerInitialize() cannot be called again without a subsequent [PFMultiplayerUninitialize()](pfmultiplayeruninitialize.md) call. <br /><br /> Every call to PFMultiplayerInitialize() should have a corresponding PFMultiplayerUninitialize() call.   <br /><br /> Apps using the Microsoft Game Core version of the Multiplayer library will need to wait for the Game Core Networking stack to be initialized prior to calling this method. Determining the status of the network stack can be done using the Game Core XNetworkingGetConnectivityHint API.   <br /><br /> The provided `playFabTitleId` must be the same PlayFab Title ID used to acquire the PlayFab Entity Keys and Entity Tokens that will be passed to [PFMultiplayerSetEntityToken()](pfmultiplayersetentitytoken.md).
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerSetEntityToken](pfmultiplayersetentitytoken.md)  
[PFMultiplayerUninitialize](pfmultiplayeruninitialize.md)  
[PFMultiplayerSetMemoryCallbacks](pfmultiplayersetmemorycallbacks.md)  
[PFMultiplayerSetThreadAffinityMask](pfmultiplayersetthreadaffinitymask.md)
  
  
