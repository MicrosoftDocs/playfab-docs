---
author: alexatxbox
title: "PartyXblManager::Cleanup"
description: Immediately reclaims all resources associated with the object.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblManager::Cleanup  

Immediately reclaims all resources associated with the object.  

## Syntax  
  
```cpp
PartyError Cleanup(  
)  
```  
  
### Parameters  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
Every call to [Initialize()](partyxblmanager_initialize.md) should have a corresponding Cleanup() call. <br /><br /> Titles using the Microsoft Game Core version of the Party Xbox Live Helper library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the title must call Cleanup(). When the app is resumed, the title must wait for the Game Core networking stack to be ready and then re-initialize the Party Xbox Live Helper library by calling Initialize().
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::Initialize](partyxblmanager_initialize.md)
  
  
