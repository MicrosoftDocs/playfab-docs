---
author: ScottMunroMS
title: "PFMatchmakingStateChange"
description: "A generic, base structure representation of an event or change in state."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFMatchmakingStateChange  

A generic, base structure representation of an event or change in state.  

## Syntax  
  
```cpp
typedef struct PFMatchmakingStateChange {  
    PFMatchmakingStateChangeType stateChangeType;  
} PFMatchmakingStateChange  
```
  
### Members  
  
**`stateChangeType`** &nbsp; [PFMatchmakingStateChangeType](../enums/pfmatchmakingstatechangetype.md)  
  
The specific type of the state change represented.
  
Use this field to determine which corresponding derived structure is represented by this PFMatchmakingStateChange structure header.
  
## Remarks  
  
PFMatchmakingStateChange structures are reported by [PFMultiplayerStartProcessingMatchmakingStateChanges()](../functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md) for the title to handle and then promptly pass back via the [PFMultiplayerFinishProcessingMatchmakingStateChanges()](../functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md) method. <br /><br /> The ```stateChangeType``` field indicates which kind of state change occurred, and this base structure should then be cast to a more specific derived structure to retrieve additional event-specific information.
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  
[PFMultiplayerStartProcessingMatchmakingStateChanges](../functions/pfmultiplayerstartprocessingmatchmakingstatechanges.md)  
[PFMultiplayerFinishProcessingMatchmakingStateChanges](../functions/pfmultiplayerfinishprocessingmatchmakingstatechanges.md)
  
  
