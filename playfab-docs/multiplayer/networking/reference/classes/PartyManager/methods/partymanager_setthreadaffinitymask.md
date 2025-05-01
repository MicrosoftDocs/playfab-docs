---
author: jdeweyMSFT
title: "PartyManager::SetThreadAffinityMask"
description: Optionally configures the processor on which internal Party library threads run.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/29/2023
---

# PartyManager::SetThreadAffinityMask  

Optionally configures the processor on which internal Party library threads run.  

## Syntax  
  
```cpp
PartyError SetThreadAffinityMask(  
    PartyThreadId threadId,  
    uint64_t threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
The type of internal Party library thread to configure processor affinity.  
  
**`threadAffinityMask`** &nbsp; uint64_t  
  
The affinity mask for this type of Party library thread.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method enables the title to configure the processor affinity for internal Party library threads of a given type. On Windows, the ```Audio``` type affects both the PlayFab Party library owned threads and threads owned by XAudio2. For more information, see [PartyThreadId](../../../enums/partythreadid.md). <br /><br /> For all platforms, <b><i>except PlayStation®</i></b>, this method may be called at any time before or after [Initialize()](partymanager_initialize.md) and takes effect immediately. <b>On PlayStation®, attempting to set the processor affinity for the [PartyThreadId](../../../enums/partythreadid.md) Audio thread after calling Initialize() can result in audio rendering failures</b>. It's currently recommended to call this method prior to calling Initialize().   <br /><br /> Thread processor settings are persisted across calls to [Cleanup()](partymanager_cleanup.md) and Initialize(). When there are more than 64 cores present, this method always applies to processor group 0.   <br /><br /> In order to specify any processor, pass ```c_anyProcessor``` as the `threadAffinityMask` parameter. ```c_anyProcessor``` is also the default value the Party library uses if this method is never called.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyThreadId](../../../enums/partythreadid.md)  
[PartyManager::GetThreadAffinityMask](partymanager_getthreadaffinitymask.md)
  
  
