---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetAvailableTextToSpeechProfiles"
description: Gets the text-to-speech profiles for this chat control.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyLocalChatControl::GetAvailableTextToSpeechProfiles  

Gets the text-to-speech profiles for this chat control.  

## Syntax  
  
```cpp
PartyError GetAvailableTextToSpeechProfiles(  
    uint32_t* profileCount,  
    PartyTextToSpeechProfileArray* profiles  
)  
```  
  
### Parameters  
  
**`profileCount`** &nbsp; uint32_t*  
*output*  
  
The output number of available profiles.  
  
**`profiles`** &nbsp; [PartyTextToSpeechProfileArray*](../../../typedefs.md)  
*library-allocated output array of size `*profileCount`*  
  
A library-allocated output array containing the available profiles.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method synchronously returns the result cached by the last successful [PopulateAvailableTextToSpeechProfiles()](partylocalchatcontrol_populateavailabletexttospeechprofiles.md) operation. <br /><br /> The returned array is only valid until the next call to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles](partylocalchatcontrol_populateavailabletexttospeechprofiles.md)
  
  
