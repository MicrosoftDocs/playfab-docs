---
author: jdeweyMSFT
title: "PartyLocalChatControl::SetLanguage"
description: Configures the language associated with this chat control.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyLocalChatControl::SetLanguage  

Configures the language associated with this chat control.  

## Syntax  
  
```cpp
PartyError SetLanguage(  
    PartyString languageCode,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`languageCode`** &nbsp; [PartyString](../../../typedefs.md)  
*optional*  
  
The new BCP 47 language code the chat control should use with future communication. If this value is nullptr, the user's default, as determined by the platform, will be used.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to set the language began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
If no language is specified, the user's default, as determined by the platform, will be used. The language is used as the spoken language associated with this chat control for transcription and the target language for incoming translations. If the language code specified is en-US, for instance, the input audio to this chat control will be treated as the English (United States) language and transcribed as such. If translation is enabled via either [SetTranscriptionOptions()](partylocalchatcontrol_settranscriptionoptions.md) or [SetTextChatOptions()](partylocalchatcontrol_settextchatoptions.md), the incoming voice chat transcriptions and/or text chat will be translated to English (United States). <br /><br /> The language code should be in BCP 47 format; supported language codes are enumerated at [https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support). Specifying an unsupported or invalid language code will not cause this method to fail, but will result in failure to generate transcriptions associated with this chat control. The language code can be queried via [GetLanguage()](partylocalchatcontrol_getlanguage.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalChatControl](../partylocalchatcontrol.md)  
[PartyLocalChatControl::GetLanguage](partylocalchatcontrol_getlanguage.md)  
[PartyLocalChatControl::SetTranscriptionOptions](partylocalchatcontrol_settranscriptionoptions.md)
  
  
