---
author: jdeweyMSFT
title: "PartyManager::GetThreadAffinityMask"
description: Retrieves the current set of processors on which internal Party library threads will run or are running as an affinity mask.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetThreadAffinityMask  

Retrieves the current set of processors on which internal Party library threads will run or are running as an affinity mask.  

## Syntax  
  
```cpp
PartyError GetThreadAffinityMask(  
    PartyThreadId threadId,  
    uint64_t* threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
The type of internal Party library thread for which processor affinity should be retrieved.  
  
**`threadAffinityMask`** &nbsp; uint64_t*  
*output*  
  
The output affinity mask for this type of Party library thread.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This retrieves the current processor affinity for internal Party library threads of a given type. <br /><br /> This method does not require [Initialize()](partymanager_initialize.md) to have been called first.   <br /><br /> A reported value of ```c_anyProcessor``` written to `threadAffinityMask` indicates that the thread is free to run on any processor.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyThreadId](../../../enums/partythreadid.md)  
[PartyManager::SetThreadAffinityMask](partymanager_setthreadaffinitymask.md)
  
  
