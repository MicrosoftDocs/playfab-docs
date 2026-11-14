---
author: ScottMunroMS
title: "PFMultiplayerInitialize"
description: "Initializes an instance of the PlayFab Multiplayer library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFMultiplayerInitialize  

Initializes an instance of the Microsoft PlayFab Multiplayer library.  

## Syntax  
  
```cpp
HRESULT PFMULTIPLAYER_API PFMultiplayerInitialize(  
    _Null_terminated_ const char* playFabTitleId,  
    _Outptr_ PFMultiplayerHandle* handle  
    ) noexcept;  
```  
  
### Parameters  
  
**`playFabTitleId`** &nbsp; const char*  
*is null-terminated*  
  
The app's PlayFab Title ID.  
  
**`handle`** &nbsp; PFMultiplayerHandle*  
*library-allocated output*  
  
The output handle of the newly initialized PFMultiplayer API instance.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This must be called before any other method, aside from [PFMultiplayerSetMemoryCallbacks()](pfmultiplayersetmemorycallbacks.md), and [PFMultiplayerSetThreadAffinityMask()](pfmultiplayersetthreadaffinitymask.md). PFMultiplayerInitialize() cannot be called again without a subsequent [PFMultiplayerUninitialize()](pfmultiplayeruninitialize.md) call. <br /><br /> Every call to PFMultiplayerInitialize() should have a corresponding PFMultiplayerUninitialize() call.   <br /><br /> Games that use the XBOX Game Development Kit (GDK) version of the Multiplayer library need to wait for the networking stack to be initialized before they call this method. To determine the status of the network stack, call [XNetworkingGetConnectivityHint](https://learn.microsoft.com/en-us/gaming/gdk/docs/reference/networking/xnetworking/functions/xnetworkinggetconnectivityhint).   <br /><br /> The provided `playFabTitleId` must be the same PlayFab Title ID that you used to acquire the PlayFab entity keys and entity tokens that you pass to [PFMultiplayerSetEntityToken()](pfmultiplayersetentitytoken.md).
  
This page documents the declaration in the standalone releases of the PlayFab Multiplayer SDK. The copy of the library that's installed with the GDK is built on PlayFab Core, and its `PFMultiplayer.h` declares a different overload of this function.
  
## Requirements  
  
**Header:** PFMultiplayer.h  
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerSetEntityToken](pfmultiplayersetentitytoken.md)  
[PFMultiplayerUninitialize](pfmultiplayeruninitialize.md)  
[PFMultiplayerSetMemoryCallbacks](pfmultiplayersetmemorycallbacks.md)  
[PFMultiplayerSetThreadAffinityMask](pfmultiplayersetthreadaffinitymask.md)
  
  
