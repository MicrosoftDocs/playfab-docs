---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetTextToSpeechProfile"
description: Configures the profile to use for a specified type of text-to-speech operation.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# PartyLocalChatControl::SetTextToSpeechProfile  

Configures the profile to use for a specified type of text-to-speech operation.  

## Syntax  
  
```cpp
PartyError SetTextToSpeechProfile(  
    PartySynthesizeTextToSpeechType type,  
    PartyString profileIdentifier,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`type`** &nbsp; [PartySynthesizeTextToSpeechType](../../../enums/partysynthesizetexttospeechtype.md)  
  
The type of text-to-speech operations for which the specified profile should be used.  
  
**`profileIdentifier`** &nbsp; [PartyString](../../../typedefs.md)  
  
The identifier of the profile that text-to-speech operations of the specified type should use.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the text-to-speech profile began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The profile provided is used for all subsequent calls to [SynthesizeTextToSpeech()](partylocalchatcontrol_synthesizetexttospeech.md) that specify the same value for `type`. No profile is configured until SetTextToSpeechProfile() is called at least once. Thus, this method must be called at least once before any calls to SynthesizeTextToSpeech() succeed. <br /><br /> This method accepts a profile identifier to indicate the profile selection so that titles may either pass in the result of [PartyTextToSpeechProfile::GetIdentifier()](../../PartyTextToSpeechProfile/methods/partytexttospeechprofile_getidentifier.md) or provide a profile identifier cached from a previous Party library session.   <br /><br /> Multiple SetTextToSpeechProfile() operations can be initiated, and they are asynchronously queued. Each operation is processed and completed in order.   <br /><br /> This is an asynchronous operation; a [PartySetTextToSpeechProfileCompletedStateChange](../../../structs/partysettexttospeechprofilecompletedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) on completion.   <br /><br /> Text-to-speech synthesis functionality internally uses available region and latency measurement estimates to optimize service usage. If the [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../../../enums/partyregionupdatemode.md), then retrieving the set of available regions and measuring connection quality to them may not have started yet, or the last update may have exceeded the configured refresh interval age. If the local device isn't currently connecting or connected to any networks, SetTextToSpeechProfile() ensures any deferred region update has started and the associated [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided prior to this call's [PartySetTextToSpeechProfileCompletedStateChange](../../../structs/partysettexttospeechprofilecompletedstatechange.md) completion.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](partylocalchatcontrol_gettexttospeechprofile.md)
  
  
