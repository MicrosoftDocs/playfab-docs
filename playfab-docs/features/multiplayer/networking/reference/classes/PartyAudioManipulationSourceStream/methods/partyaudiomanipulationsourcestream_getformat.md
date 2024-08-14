---
author: jdeweyMSFT
title: "PartyAudioManipulationSourceStream::GetFormat"
description: Retrieves the format of the buffers that will be provided by [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyAudioManipulationSourceStream::GetFormat  

Retrieves the format of the buffers that will be provided by [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).  

## Syntax  
  
```cpp
PartyError GetFormat(  
    PartyAudioFormat* format  
)  
```  
  
### Parameters  
  
**`format`** &nbsp; [PartyAudioFormat*](../../../structs/partyaudioformat.md)  
*output*  
  
The format of the buffers that will be provided by [PartyAudioManipulationSourceStream::GetNextBuffer()](partyaudiomanipulationsourcestream_getnextbuffer.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If a format is specified in the configuration provided by [PartyAudioManipulationSourceStream::GetConfiguration()](partyaudiomanipulationsourcestream_getconfiguration.md), this format will match. Otherwise, this format will be the most efficient format automatically selected by the library.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyAudioManipulationSourceStream](../partyaudiomanipulationsourcestream.md)  
[PartyChatControl::ConfigureAudioManipulationVoiceStream](../../PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md)  
[PartyAudioManipulationSourceStream::GetNextBuffer](partyaudiomanipulationsourcestream_getnextbuffer.md)  
[PartyAudioManipulationSourceStream::GetConfiguration](partyaudiomanipulationsourcestream_getconfiguration.md)
  
  
