---
author: ScottMunroMS
title: "PartyXblManager::Initialize"
description: Initializes the object instance.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/17/2020
---

# PartyXblManager::Initialize  

Initializes the object instance.  

## Syntax  
  
```cpp
PartyError Initialize(  
    PartyString titleId  
)  
```  
  
### Parameters  
  
**`titleId`** &nbsp; [PartyString](../../../../../networking/reference/typedefs.md)  
  
The app's PlayFab Title Id.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This must be called before any other method under the PartyXblManager namespace, aside from the static methods [GetSingleton()](partyxblmanager_getsingleton.md), [SetMemoryCallbacks()](partyxblmanager_setmemorycallbacks.md), [GetMemoryCallbacks()](partyxblmanager_getmemorycallbacks.md), [SetThreadAffinityMask()](partyxblmanager_setthreadaffinitymask.md), [GetThreadAffinityMask()](partyxblmanager_getthreadaffinitymask.md). Initialize() cannot be called again without a subsequent [Cleanup()](partyxblmanager_cleanup.md) call. <br /><br /> Every call to Initialize() should have a corresponding Cleanup() call.   <br /><br /> It is recommended for apps using the Xbox One XDK version of the Party Xbox Live Helper library to wait until the platform is ready for networking operations before calling this method. Please refer to the XDK documentation about networking and secure device associations best practices for more information.   <br /><br /> Apps using the Microsoft Game Core version of the Party Xbox Live Helper library will need to wait for the Game Core Networking stack to be initialized prior to calling this method. Determining the status of the network stack can be done using the Game Core XNetworkingGetConnectivityHint API.   <br /><br /> Apps using the Microsoft Game Core version of the Party Xbox Live Helper library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the title must call Cleanup(). When the app is resumed, the title must wait for the Game Core networking stack to be ready and then re-initialize the Party Xbox Live Helper library by calling Initialize().
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::Cleanup](partyxblmanager_cleanup.md)  
[PartyXblManager::GetSingleton](partyxblmanager_getsingleton.md)  
[PartyXblManager::SetMemoryCallbacks](partyxblmanager_setmemorycallbacks.md)  
[PartyXblManager::GetMemoryCallbacks](partyxblmanager_getmemorycallbacks.md)  
[PartyXblManager::SetThreadAffinityMask](partyxblmanager_setthreadaffinitymask.md)  
[PartyXblManager::GetThreadAffinityMask](partyxblmanager_getthreadaffinitymask.md)
  
  
