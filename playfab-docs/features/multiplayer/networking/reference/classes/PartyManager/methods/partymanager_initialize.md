---
author: jdeweyMSFT
title: "PartyManager::Initialize"
description: Initializes the PartyManager object instance.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyManager::Initialize  

Initializes the PartyManager object instance.  

## Syntax  
  
```cpp
PartyError Initialize(  
    PartyString titleId  
)  
```  
  
### Parameters  
  
**`titleId`** &nbsp; [PartyString](../../../typedefs.md)  
  
The app's PlayFab Title ID.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This must be called before any other method, aside from the static methods [GetSingleton()](partymanager_getsingleton.md), [SetMemoryCallbacks()](partymanager_setmemorycallbacks.md), [GetMemoryCallbacks()](partymanager_getmemorycallbacks.md), [SetThreadAffinityMask()](partymanager_setthreadaffinitymask.md), [GetThreadAffinityMask()](partymanager_getthreadaffinitymask.md), [SerializeNetworkDescriptor()](partymanager_serializenetworkdescriptor.md), [DeserializeNetworkDescriptor()](partymanager_deserializenetworkdescriptor.md), [SetWorkMode()](partymanager_setworkmode.md), and [GetWorkMode()](partymanager_getworkmode.md). Initialize() can't be called again without a subsequent [Cleanup()](partymanager_cleanup.md) call. <br /><br /> Every call to Initialize() should have a corresponding Cleanup() call.   <br /><br /> Apps using the Microsoft Game Core version of the Party library will need to wait for the Game Core Networking stack to be initialized prior to calling this method. Determining the status of the network stack can be done using the Game Core XNetworkingGetConnectivityHint API.   <br /><br /> Apps using the Microsoft Game Core version of the Party library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the app must call PartyManager::Cleanup(). When the app is resumed, the title must wait for the Game Core networking stack to ready and then reinitialize the Party library by calling PartyManager::Initialize().   <br /><br /> The provided `titleId` must be the same Title ID used to acquire the PlayFab Entity IDs and Entity Tokens that will be passed to [CreateLocalUser()](partymanager_createlocaluser.md), [CreateLocalUserWithEntityType()](partymanager_createlocaluserwithentitytype.md), and [PartyLocalUser::UpdateEntityToken()](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::CreateLocalUser](partymanager_createlocaluser.md)  
[PartyManager::CreateLocalUserWithEntityType](partymanager_createlocaluserwithentitytype.md)  
[PartyManager::Cleanup](partymanager_cleanup.md)  
[PartyManager::GetSingleton](partymanager_getsingleton.md)  
[PartyManager::SetMemoryCallbacks](partymanager_setmemorycallbacks.md)  
[PartyManager::GetMemoryCallbacks](partymanager_getmemorycallbacks.md)  
[PartyManager::SetThreadAffinityMask](partymanager_setthreadaffinitymask.md)  
[PartyManager::GetThreadAffinityMask](partymanager_getthreadaffinitymask.md)  
[PartyManager::SerializeNetworkDescriptor](partymanager_serializenetworkdescriptor.md)  
[PartyManager::DeserializeNetworkDescriptor](partymanager_deserializenetworkdescriptor.md)  
[PartyLocalUser::UpdateEntityToken](../../PartyLocalUser/methods/partylocaluser_updateentitytoken.md)
  
  
