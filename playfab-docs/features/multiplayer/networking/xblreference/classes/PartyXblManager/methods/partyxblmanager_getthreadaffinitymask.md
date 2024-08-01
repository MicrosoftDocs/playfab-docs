---
author: ScottMunroMS
title: "PartyXblManager::GetThreadAffinityMask"
description: Retrieves the current set of processors on which internal Party Xbox Live Helper library threads will run or are running as an affinity mask.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyXblManager::GetThreadAffinityMask  

Retrieves the current set of processors on which internal Party Xbox Live Helper library threads will run or are running as an affinity mask.  

## Syntax  
  
```cpp
PartyError GetThreadAffinityMask(  
    PartyXblThreadId threadId,  
    uint64_t* threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyXblThreadId](../../../enums/partyxblthreadid.md)  
  
The type of internal library thread for which processor affinity should be retrieved.  
  
**`threadAffinityMask`** &nbsp; uint64_t*  
*output*  
  
A place to store the affinity mask for this type of Party thread.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This retrieves the current processor affinity for internal Party threads Xbox Live Helper library of a given type. <br /><br /> This method does not require [Initialize()](partyxblmanager_initialize.md) to have been called first.   <br /><br /> A reported value of ```c_anyProcessor``` written to `threadAffinityMask` indicates that the thread is free to run on any processor.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::SetThreadAffinityMask](partyxblmanager_setthreadaffinitymask.md)
  
  
