---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::ReturnBuffer"
description: Tells the library it can reclaim memory associated with this buffer.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyAudioManipulationSourceStream::ReturnBuffer  

Tells the library it can reclaim memory associated with this buffer.  

## Syntax  
  
```cpp
PartyError ReturnBuffer(  
    void* buffer  
)  
```  
  
### Parameters  
  
**`buffer`** &nbsp; void*  
*input not valid afterwards*  
  
The buffer to return, which is the *buffer* field of a PartyDataBuffer previously retrieved from this source stream [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyAudioManipulationSourceStream::GetNextBuffer](partyaudiomanipulationsourcestream_getnextbuffer.md)
  
  
