---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetTextToSpeechProfile"
description: Configures the profile to use for a specified type of text-to-speech operation.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
  
```c_partyErrorSuccess``` if the asynchronous operation to set the text to speech profile began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The profile provided will be used for all subsequent calls to [SynthesizeTextToSpeech()](partylocalchatcontrol_synthesizetexttospeech.md) that specify the same value for `type`. No profile will be configured until SetTextToSpeechProfile() is called at least once. Thus, this method must be called at least once before any calls to SynthesizeTextToSpeech() can succeed. <br /><br /> This method accepts a profile identifier to indicate the profile selection so that titles may either pass in the result of [PartyTextToSpeechProfile::GetIdentifier()](../../PartyTextToSpeechProfile/methods/partytexttospeechprofile_getidentifier.md) or provide a profile identifer cached from a previous Party library session.   <br /><br /> Multiple SetTextToSpeechProfile() operations can be initiated, and they will be asynchronously queued. Each operation will be processed and completed in order.   <br /><br /> This is an asynchronous operation; a [PartySetTextToSpeechProfileCompletedStateChange](../../../structs/partysettexttospeechprofilecompletedstatechange.md) will be provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) on completion.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](partylocalchatcontrol_gettexttospeechprofile.md)  
[PartyManager::StartProcessingStateChanges](../../PartyManager/methods/partymanager_startprocessingstatechanges.md)
  
  
