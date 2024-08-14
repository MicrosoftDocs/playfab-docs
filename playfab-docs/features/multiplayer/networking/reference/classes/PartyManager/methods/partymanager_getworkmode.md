---
author: jdeweyMSFT
title: "PartyManager::GetWorkMode"
description: Retrieves the current work mode of the Party library's internal processing task associated with `threadId`.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyManager::GetWorkMode  

Retrieves the current work mode of the Party library's internal processing task associated with `threadId`.  

## Syntax  
  
```cpp
PartyError GetWorkMode(  
    PartyThreadId threadId,  
    PartyWorkMode* workMode  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
A high-level categorization of the Party library's internal processing task.  
  
**`workMode`** &nbsp; [PartyWorkMode*](../../../enums/partyworkmode.md)  
*output*  
  
The current work mode for the associated processing task.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess```
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::SetWorkMode](partymanager_setworkmode.md)  
[PartyManager::DoWork](partymanager_dowork.md)
  
  
