---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetTextToSpeechProfile"
description: Gets the profile that was last configured from a successfully completed [SetTextToSpeechProfile()](partylocalchatcontrol_settexttospeechprofile.md) operation for a specified type of text-to-speech operation.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalChatControl::GetTextToSpeechProfile  

Gets the profile that was last configured from a successfully completed [SetTextToSpeechProfile()](partylocalchatcontrol_settexttospeechprofile.md) operation for a specified type of text-to-speech operation.  

## Syntax  
  
```cpp
PartyError GetTextToSpeechProfile(  
    PartySynthesizeTextToSpeechType type,  
    PartyTextToSpeechProfile** profile  
)  
```  
  
### Parameters  
  
**`type`** &nbsp; [PartySynthesizeTextToSpeechType](../../../enums/partysynthesizetexttospeechtype.md)  
  
The type of text-to-speech operations for which the profile should be retrieved.  
  
**`profile`** &nbsp; [PartyTextToSpeechProfile**](../../PartyTextToSpeechProfile/partytexttospeechprofile.md)  
*library-allocated output, may return nullptr*  
  
The output profile. The profile may be nullptr if none has been set for the specified type. The pointer is only valid until the next call to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If no profile has been successfully configured for the specified type of text-to-speech operation, the retrieved profile will be null. <br /><br /> The retrieved profile will update when a [PartySetTextToSpeechProfileCompletedStateChange](../../../structs/partysettexttospeechprofilecompletedstatechange.md) associated with a call to SetTextToSpeechProfile(), which specified the same value for `type`, is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](partylocalchatcontrol_settexttospeechprofile.md)
  
  
