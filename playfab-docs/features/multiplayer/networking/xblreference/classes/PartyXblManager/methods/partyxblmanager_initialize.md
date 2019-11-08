---
author: alexatxbox
title: "PartyXblManager::Initialize"
description: Initializes the object instance.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/07/2019
ROBOTS: NOINDEX,NOFOLLOW
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
  
The app's PlayFab Title ID.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This must be called before any other method under the PartyXblManager namespace, aside from the static methods [GetSingleton()](partyxblmanager_getsingleton.md), [SetMemoryCallbacks()](partyxblmanager_setmemorycallbacks.md), [GetMemoryCallbacks()](partyxblmanager_getmemorycallbacks.md), [SetThreadAffinityMask()](partyxblmanager_setthreadaffinitymask.md), [GetThreadAffinityMask()](partyxblmanager_getthreadaffinitymask.md). Initialize() cannot be called again without a subsequent [Cleanup()](partyxblmanager_cleanup.md) call. <br /><br /> Every call to Initialize() should have a corresponding Cleanup() call.   <br /><br /> Apps using Xbox One XDK version of the Party Xbox Live Helper will need to wait until the the platform is ready for networking operation before making calling this method. This can be achieved by calling the XDK NetworkInformation::GetInternetConnectionProfile() API.   <br /><br /> Apps using the Microsoft Game Core version of the Party Xbox Live Helper library will need to wait for the Game Core Networking stack to be initialized prior to calling this method. Determining the status of the network stack can be done using the Game Core XNetworkingGetConnectivityHint API.   <br /><br /> Apps using the Microsoft Game Core version of the Party Xbox Live Helper library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the app must call [Cleanup()](partyxblmanager_cleanup.md). When the app is resumed, the app must wait for the Game Core networking stack to be ready and then re-initialize the Party Xbox Live Helper library by calling [Initialize()](partyxblmanager_initialize.md).
  
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
  
  
