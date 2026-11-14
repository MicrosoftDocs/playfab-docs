---
author: ScottMunroMS
title: "PartyXblStateChange"
description: "A generic, base structure representation of an event or change in state in the Party XBOX Live Helper library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblStateChange  

A generic, base structure representation of an event or change in state in the Party XBOX Live Helper library.  

## Syntax  
  
```cpp
struct PartyXblStateChange {  
    PartyXblStateChangeType stateChangeType;  
}  
```
  
### Members  
  
**`stateChangeType`** &nbsp; [PartyXblStateChangeType](../enums/partyxblstatechangetype.md)  
  
The specific type of the state change represented.
  
Use this field to determine which corresponding derived structure is represented by this PartyXblStateChange structure header.
  
## Remarks  
  
PartyXblStateChange structures are reported by [PartyXblManager::StartProcessingStateChanges()](../classes/PartyXblManager/methods/partyxblmanager_startprocessingstatechanges.md) for the title to handle and then promptly pass back via the [PartyXblManager::FinishProcessingStateChanges()](../classes/PartyXblManager/methods/partyxblmanager_finishprocessingstatechanges.md) method. <br /><br /> The ```stateChangeType``` field indicates which kind of state change occurred, and this base structure should then be cast to a more specific derived structure to retrieve additional event-specific information.
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  
[PartyXblManager::StartProcessingStateChanges](../classes/PartyXblManager/methods/partyxblmanager_startprocessingstatechanges.md)  
[PartyXblManager::FinishProcessingStateChanges](../classes/PartyXblManager/methods/partyxblmanager_finishprocessingstatechanges.md)
  
  
