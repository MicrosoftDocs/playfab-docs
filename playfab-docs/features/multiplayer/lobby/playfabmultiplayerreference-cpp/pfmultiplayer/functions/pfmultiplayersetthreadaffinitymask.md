---
author: ScottMunroMS
title: "PFMultiplayerSetThreadAffinityMask"
description: "Optionally configures the processor on which internal Multiplayer library threads will run."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMultiplayerSetThreadAffinityMask  

Optionally configures the processor on which internal Multiplayer library threads will run.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerSetThreadAffinityMask(  
    PFMultiplayerThreadId threadId,  
    uint64_t threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PFMultiplayerThreadId](../enums/pfmultiplayerthreadid.md)  
  
The type of internal Multiplayer library thread to configure processor affinity.  
  
**`threadAffinityMask`** &nbsp; uint64_t  
  
The affinity mask for this type of Multiplayer library thread.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method enables the title to configure the processor affinity for internal Multiplayer library threads of a given type. <br /><br /> This method may be called at any time before or after [PFMultiplayerInitialize()](pfmultiplayerinitialize.md) and will take effect immediately. Thread processor settings are persisted across calls to [PFMultiplayerUninitialize()](pfmultiplayeruninitialize.md) and PFMultiplayerInitialize(). When there are more than 64 cores present, this method always applies to processor group 0.   <br /><br /> In order to specify any processor, pass ```PFMultiplayerAnyProcessor``` as the `threadAffinityMask` parameter. This is also the default value the Multiplayer library will use if this method is never called.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerThreadId](../enums/pfmultiplayerthreadid.md)
  
  
