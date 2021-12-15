---
author: jdeweyMSFT
title: "PartyStateChange"
description: "A generic, base structure representation of an event or change in state."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyStateChange  

A generic, base structure representation of an event or change in state.  

## Syntax  
  
```cpp
typedef struct PartyStateChange {  
    PartyStateChangeType stateChangeType;  
} PartyStateChange  
```
  
### Members  
  
**`stateChangeType`** &nbsp; [PartyStateChangeType](../enums/partystatechangetype.md)  
  
The specific type of the state change represented.
  
Use this field to determine which corresponding derived structure is represented by this PartyStateChange structure header.
  
## Remarks  
  
PartyStateChange structures are reported by [PartyManager::StartProcessingStateChanges()](../classes/PartyManager/methods/partymanager_startprocessingstatechanges.md) for the title to handle and then promptly pass back via the [PartyManager::FinishProcessingStateChanges()](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md) method. <br /><br /> The ```stateChangeType``` field indicates which kind of state change occurred, and this base structure should then be cast to a more specific derived structure to retrieve additional event-specific information.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::StartProcessingStateChanges](../classes/PartyManager/methods/partymanager_startprocessingstatechanges.md)  
[PartyManager::FinishProcessingStateChanges](../classes/PartyManager/methods/partymanager_finishprocessingstatechanges.md)
  
  
