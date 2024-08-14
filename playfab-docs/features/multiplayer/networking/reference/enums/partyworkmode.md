---
author: jdeweyMSFT
title: "PartyWorkMode"
description: "Configuration modes representing how the Party library will manage an internal processing task."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyWorkMode  

Configuration modes representing how the Party library will manage an internal processing task.    

## Syntax  
  
```cpp
enum class PartyWorkMode    
{  
    Automatic = 0,  
    Manual = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Automatic | The Party library will create internal threads to automatically handle the associated processing task.<br/><br/> This is the default, recommended option which encodes the Party library's best practices for processing its internal task. |  
| Manual | The Party library will not create internal threads to handle the associated processing task, instead relying on the title to perform the task through calls to [PartyManager::DoWork()](../classes/PartyManager/methods/partymanager_dowork.md). |  
  
## Remarks  
  
For an overview of the processing tasks and their frequencies, see [PartyThreadId](partythreadid.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::SetWorkMode](../classes/PartyManager/methods/partymanager_setworkmode.md)  
[PartyManager::GetWorkMode](../classes/PartyManager/methods/partymanager_getworkmode.md)  
[PartyManager::DoWork](../classes/PartyManager/methods/partymanager_dowork.md)
  
  
