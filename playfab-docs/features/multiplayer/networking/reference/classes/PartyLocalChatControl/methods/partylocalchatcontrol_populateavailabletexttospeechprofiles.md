---
author: jdeweyMSFT
title: "PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles"
description: Populates the local chat control's list of supported text-to-speech profiles.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles  

Populates the local chat control's list of supported text-to-speech profiles.  

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
  
```c_partyErrorSuccess``` if the asynchronous operation began, or an error code otherwise. If this method fails, no related state changes are generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation; a [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../../../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) on completion. <br /><br /> The asynchronous operation must complete successfully before GetAvailableTextToSpeechProfiles() can be called.   <br /><br /> Text-to-speech synthesis functionality internally uses available region and latency measurement estimates to optimize service usage. If the [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../../../enums/partyregionupdatemode.md), then retrieving the set of available regions and measuring connection quality to them may not have started yet, or the last update may have exceeded the configured refresh interval age. If the local device isn't currently connecting or connected to any networks, PopulateAvailableTextToSpeechProfiles() ensures any deferred region update has started and the associated [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided prior to this call's [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../../../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md) completion.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetAvailableTextToSpeechProfiles](partylocalchatcontrol_getavailabletexttospeechprofiles.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](partylocalchatcontrol_settexttospeechprofile.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](partylocalchatcontrol_gettexttospeechprofile.md)
  
  
