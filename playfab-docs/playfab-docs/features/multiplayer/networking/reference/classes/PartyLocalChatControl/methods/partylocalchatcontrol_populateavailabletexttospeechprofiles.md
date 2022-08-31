---
author: jdeweyMSFT
title: "PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles"
description: Populates the local chat control's list of supported text to speech profiles.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles  

Populates the local chat control's list of supported text to speech profiles.  

## Syntax  
  
```cpp
PartyError PopulateAvailableTextToSpeechProfiles(  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation; a [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../../../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md) will be provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) on completion. <br /><br /> The asynchronous operation must complete successfully before GetAvailableTextToSpeechProfiles() can be called.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetAvailableTextToSpeechProfiles](partylocalchatcontrol_getavailabletexttospeechprofiles.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](partylocalchatcontrol_settexttospeechprofile.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](partylocalchatcontrol_gettexttospeechprofile.md)
  
  
