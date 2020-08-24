---
author: jdeweyMSFT
title: "PartyLocalChatControl::GetLanguage"
description: Gets the language associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/05/2020
---

# PartyLocalChatControl::GetLanguage  

Gets the language associated with this chat control.  

## Syntax  
  
```cpp
PartyError GetLanguage(  
    PartyString* languageCode  
)  
```  
  
### Parameters  
  
**`languageCode`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output BCP 47 language code used by the chat control future communication. The memory for the string remains valid until the next [PartySetLanguageCompletedStateChange](../../../structs/partysetlanguagecompletedstatechange.md) is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or the chat control is destroyed.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The language is used as the spoken language associated with this chat control for transcription and the target language for incoming translations. If the language code specified is en-US, for instance, the input audio to this chat control will be treated as the English (United States) language and transcribed as such. If translation is enabled via either [SetTranscriptionOptions()](partylocalchatcontrol_settranscriptionoptions.md) or [SetTextChatOptions()](partylocalchatcontrol_settextchatoptions.md), the incoming voice chat transcriptions and/or text chat will be translated to English (United States). <br /><br /> The language code should be in BCP 47 format; supported language codes are enumerated at [https://docs.microsoft.com/azure/cognitive-services/speech-service/language-support](https://docs.microsoft.com/azure/cognitive-services/speech-service/language-support). Specifying an unsupported or invalid language code will not cause this method to fail, but will result in failure to generate transcriptions associated with this chat control. The language code can be queried via GetLanguage().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartySetLanguageCompletedStateChange](../../../structs/partysetlanguagecompletedstatechange.md)  
[PartyLocalDevice::CreateChatControl](../../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalChatControl::SetLanguage](partylocalchatcontrol_setlanguage.md)  
[PartyLocalChatControl::SetTranscriptionOptions](partylocalchatcontrol_settranscriptionoptions.md)
  
  
