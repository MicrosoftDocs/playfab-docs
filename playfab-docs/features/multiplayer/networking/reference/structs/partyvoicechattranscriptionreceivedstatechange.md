---
author: jdeweyMSFT
title: "PartyVoiceChatTranscriptionReceivedStateChange"
description: "Information specific to the *VoiceChatTranscriptionReceived* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyVoiceChatTranscriptionReceivedStateChange  

Information specific to the *VoiceChatTranscriptionReceived* type of state change.  

## Syntax  
  
```cpp
struct PartyVoiceChatTranscriptionReceivedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyChatControl* senderChatControl;  
    uint32_t receiverChatControlCount;  
    PartyLocalChatControlArray receiverChatControls;  
    PartyAudioSourceType sourceType;  
    PartyString languageCode;  
    PartyString transcription;  
    PartyVoiceChatTranscriptionPhraseType type;  
    uint32_t translationCount;  
    PartyTranslation* translations;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the transcription operation Succeeded or provides the reason that it failed.
  
On success, the ```transcription``` field is a string of non-zero length. On failure, the string is empty. Failure indicates that a transcription operation was attempted for the speaker but could not be completed. If transcription is enabled at the request of the user associated with the chat control, and the transcription messages are shown via UI, it is recommended that failures also be indicated to the user in order to provide feedback as to whether transcriptions are pending or have failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`senderChatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control object that originated the transcription message.
  
**`receiverChatControlCount`** &nbsp; uint32_t  
  
The number of local receiver chat controls to which the transcription is addressed.
  
**`receiverChatControls`** &nbsp; [PartyLocalChatControlArray](../typedefs.md)  
*array of size `receiverChatControlCount`*  
  
The local receiver chat controls to which the transcription is addressed.
  
**`sourceType`** &nbsp; [PartyAudioSourceType](../enums/partyaudiosourcetype.md)  
  
The type of audio source this transcription represents.
  
The audio source type can optionally be used for game scenarios in which transcriptions from different source types should be treated differently. For instance, different iconography may be shown depending on whether the transcription is associated with microphone or text-to-speech audio.
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language code of the transcription.
  
The language code is always provided when the ```result``` field indicates success. Otherwise, the language code is an empty string. <br /><br /> The language code is in BCP 47 format, such as en-US for English (United States). Supported language codes are enumerated in [Language support](/azure/ai-services/speech-service/language-support).
  
**`transcription`** &nbsp; [PartyString](../typedefs.md)  
  
The transcribed voice chat text.
  
The string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator. The string is always empty when the ```result``` field indicates failures.
  
**`type`** &nbsp; [PartyVoiceChatTranscriptionPhraseType](../enums/partyvoicechattranscriptionphrasetype.md)  
  
Indicates the phrase type of the text provided in the ```transcription``` field.
  
The type is always [PartyVoiceChatTranscriptionPhraseType::Final](../enums/partyvoicechattranscriptionphrasetype.md) when the ```result``` field indicates failure.
  
**`translationCount`** &nbsp; uint32_t  
  
The number of translations associated with the transcribed voice chat text.
  
Translations are provided if [PartyVoiceChatTranscriptionOptions::TranslateToLocalLanguage](../enums/partyvoicechattranscriptionoptions.md) has previously been specified via [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation.
  
**`translations`** &nbsp; [PartyTranslation](partytranslation.md)*  
*array of size `translationCount`*  
  
An array containing the translations of the voice chat transcription string.
  
Translations are provided if [PartyVoiceChatTranscriptionOptions::TranslateToLocalLanguage](../enums/partyvoicechattranscriptionoptions.md) has previously been specified via [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) on a chat control local to this device. There may be more than one translation if multiple local chat controls have enabled translation and the local chat controls have specified different languages via [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md). In that case, the app can compare the ```languageCode``` field of each PartyTranslation in ```translations``` against the language code, obtained via [PartyLocalChatControl::GetLanguage()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getlanguage.md), for each local chat control in ```receiverChatControls``` to determine the target local chat control for each translation. <br /><br /> A translation corresponding to the language for each chat control in ```receiverChatControls``` that has enabled translation is provided, even if the speaking chat control's language is the same as the local chat control's language. In such a case, the transcription and translation strings are identical.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalDevice::CreateChatControl](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)
  
  
