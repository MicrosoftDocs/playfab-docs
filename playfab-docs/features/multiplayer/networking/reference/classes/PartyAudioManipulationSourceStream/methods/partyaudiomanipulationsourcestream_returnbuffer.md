---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::ReturnBuffer"
description: Tells the library it can reclaim memory associated with this buffer.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 02/13/2020
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
*_Post_invalid_*  
  
The buffer to return, which is the *buffer* field of a PartyDataBuffer previously retrieved from this source stream [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyAudioManipulationSourceStream::GetNextBuffer](partyaudiomanipulationsourcestream_getnextbuffer.md)
  
  
