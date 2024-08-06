---
author: jdeweyMSFT
title: "PartyManager::SetWorkMode"
description: Configures the work mode of the Party library processing task associated with `threadId`.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyManager::SetWorkMode  

Configures the work mode of the Party library processing task associated with `threadId`.  

## Syntax  
  
```cpp
PartyError SetWorkMode(  
    PartyThreadId threadId,  
    PartyWorkMode workMode  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
A high-level categorization of the Party library's internal processing task.  
  
**`workMode`** &nbsp; [PartyWorkMode](../../../enums/partyworkmode.md)  
  
The target work mode for the associated processing task.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
If the work mode is set as [PartyWorkMode::Automatic](../../../enums/partyworkmode.md), the processing task associated with `threadId` is handled internally by the Party library. If the work mode is configured as [PartyWorkMode::Manual](../../../enums/partyworkmode.md), the title must instead perform the processing task associated with `threadId` via periodic calls to [DoWork()](partymanager_dowork.md). <br /><br /> This method can only be called when the Party library is uninitialized. Calling while initialized will fail and return an error.   <br /><br /> Configuration of the work mode associated with `threadId` persists across subsequent calls to [Cleanup()](partymanager_cleanup.md) and [Initialize()](partymanager_initialize.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::GetWorkMode](partymanager_getworkmode.md)  
[PartyManager::DoWork](partymanager_dowork.md)
  
  
