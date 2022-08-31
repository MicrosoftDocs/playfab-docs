---
author: jdeweyMSFT
title: "PartyManager::DoWork"
description: Synchronously performs the processing task associated with `threadId`.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 04/07/2021
---

# PartyManager::DoWork  

Synchronously performs the processing task associated with `threadId`.  

## Syntax  
  
```cpp
PartyError DoWork(  
    PartyThreadId threadId  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
A high-level categorization of the Party library's internal processing task.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method will fail and return an error if the work mode of `threadId` has not previously been set to [PartyWorkMode::Manual](../../../enums/partyworkmode.md) via a call to [SetWorkMode()](partymanager_setworkmode.md). Additionally, on the Windows, Xbox One XDK, and Microsoft Game Core versions of the library, this method will fail and return an error if the title thread calling this method does not exist in a COM multithreaded apartment when `threadId` is [PartyThreadId::Networking](../../../enums/partythreadid.md). <br /><br /> By default, the Party library will internally manage the processing task associated with `threadId`. However, if the work mode of `threadId` is configured as [PartyWorkMode::Manual](../../../enums/partyworkmode.md) via a call to SetWorkMode(), the title must periodically call this method to perform the processing task instead.   <br /><br /> The processing task associated with `threadId` dictates the frequency at which this method should be called. The processing task associated with [PartyThreadId::Audio](../../../enums/partythreadid.md) should be performed every 40ms, while the processing task associated with [PartyThreadId::Networking](../../../enums/partythreadid.md) should be performed every 50 to 100ms. Internally, processing tasks will attempt to handle small variations in timing, but issues will arise if timing strays too far from what is expected (e.g. audio stutter, network state desynchronization).   <br /><br /> For more information on processing task types and timing expectations, see [PartyThreadId](../../../enums/partythreadid.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::SetWorkMode](partymanager_setworkmode.md)  
[PartyManager::GetWorkMode](partymanager_getworkmode.md)
  
  
