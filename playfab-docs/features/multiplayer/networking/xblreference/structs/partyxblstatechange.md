---
author: alexatxbox
title: "PartyXblStateChange"
description: "A generic, base structure representation of an event or change in state."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblStateChange  

A generic, base structure representation of an event or change in state.  

## Syntax  
  
```cpp
typedef struct PartyXblStateChange {  
    PartyXblStateChangeType stateChangeType;  
} PartyXblStateChange  
```
  
### Members  
  
**`stateChangeType`** &nbsp; [PartyXblStateChangeType](../enums/partyxblstatechangetype.md)  
  
The specific type of the state change represented.
  
Use this field to determine which corresponding derived structure is represented by this PartyXblStateChange structure header.
  
## Remarks  
  
PartyXblStateChange structures are reported by [PartyXblManager::StartProcessingStateChanges()](../classes/PartyXblManager/methods/partyxblmanager_startprocessingstatechanges.md) for the title to handle and then promptly pass back via the [PartyXblManager::FinishProcessingStateChanges()](../classes/PartyXblManager/methods/partyxblmanager_finishprocessingstatechanges.md) method. <br /><br /> The ```stateChangeType``` field indicates which kind of state change occurred, and this base structure should then be cast to a more specific derived structure to retrieve additional event-specific information.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  
[PartyXblManager::StartProcessingStateChanges](../classes/PartyXblManager/methods/partyxblmanager_startprocessingstatechanges.md)  
[PartyXblManager::FinishProcessingStateChanges](../classes/PartyXblManager/methods/partyxblmanager_finishprocessingstatechanges.md)
  
  
