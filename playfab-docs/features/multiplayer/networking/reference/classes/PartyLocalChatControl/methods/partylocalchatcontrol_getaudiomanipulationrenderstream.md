---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAudioManipulationRenderStream"
description: Retrieves the manipulation render stream associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/10/2020
---

# PartyLocalChatControl::GetAudioManipulationRenderStream  

Retrieves the manipulation render stream associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetAudioManipulationRenderStream(  
    PartyAudioManipulationSinkStream** stream  
)  
```  
  
### Parameters  
  
**`stream`** &nbsp; [PartyAudioManipulationSinkStream**](../../PartyAudioManipulationSinkStream/partyaudiomanipulationsinkstream.md)  
*library-allocated output*  
  
The output stream.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This stream represents the audio that will be rendered to the chat control's audio output. Typically, the app will retrieve audio from the voice streams associated with all remote chat controls via PartyAudioManipulationSourceStream::GetNextBuffer(), process and mix each buffer into a single audio stream, and then submit the mixed stream to be rendered by each appropriate render stream. Each render stream can be retrieved via PartyLocalChatControl::GetAudioManipulationRenderStream().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  

  
  
