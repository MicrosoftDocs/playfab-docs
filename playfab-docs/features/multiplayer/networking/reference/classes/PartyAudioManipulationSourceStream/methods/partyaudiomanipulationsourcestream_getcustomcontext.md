---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::GetCustomContext"
description: Retrieves the app's private, custom pointer-sized context value previously associated with this source stream object.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyAudioManipulationSourceStream::GetCustomContext  

Retrieves the app's private, custom pointer-sized context value previously associated with this source stream object.  

## Syntax  
  
```cpp
PartyError GetCustomContext(  
    void** customContext  
)  
```  
  
### Parameters  
  
**`customContext`** &nbsp; void**  
*output, may return nullptr*  
  
The output custom context.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If no custom context has been set yet, the value pointed to by `customContext` is set to nullptr.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyAudioManipulationSourceStream::SetCustomContext](partyaudiomanipulationsourcestream_setcustomcontext.md)
  
  
