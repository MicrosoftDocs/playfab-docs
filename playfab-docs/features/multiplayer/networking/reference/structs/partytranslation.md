---
author: jdeweyMSFT
title: "PartyTranslation"
description: "A translation."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/22/2024
---

# PartyTranslation  

A translation.  

## Syntax  
  
```cpp
struct PartyTranslation {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyString languageCode;  
    PartyTranslationReceivedOptions options;  
    PartyString translation;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates whether the translation operation succeeded.
  
On success, ```translation``` is a string of nonzero length containing the translated text. On failure, the string is empty.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language code of the translation.
  
The language code is in BCP 47 format, such as en-US for English (United States). Supported language codes are enumerated in [Language support](/azure/ai-services/speech-service/language-support).
  
**`options`** &nbsp; [PartyTranslationReceivedOptions](../enums/partytranslationreceivedoptions.md)  
  
Additional options describing the translation.
  
**`translation`** &nbsp; [PartyString](../typedefs.md)  
  
The translation string.
  
By default, profanity masking is enabled and replaces each character of a profane word with an asterisk. Profanity masking is applied after translating the unmasked source transcription. Depending on context, it's possible for the transcription to contain masked profanity but not the translation. Similarly, it's possible for the translation to contain masked profanity but not the original transcription. Profanity masking can be disabled via [PartyVoiceChatTranscriptionOptions::DisableProfanityMasking](../enums/partyvoicechattranscriptionoptions.md). <br /><br /> The translation string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator. Truncation occurs if the translated string length would exceed that limit, which can happen due to language differences even though the original string length is less than or equal to ```c_maxChatTextMessageLength```. In such a case, ```options``` contains [PartyTranslationReceivedOptions::Truncated](../enums/partytranslationreceivedoptions.md). Truncation may occur at an arbitrary point in the UTF-8 byte sequence and may not result in a complete, valid character or word. Strings are always null terminated, even when truncated.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
