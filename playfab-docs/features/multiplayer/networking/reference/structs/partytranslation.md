---
author: jdeweyMSFT
title: "PartyTranslation"
description: "A translation."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyTranslation  

A translation.  

## Syntax  
  
```cpp
typedef struct PartyTranslation {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyString languageCode;  
    PartyTranslationReceivedOptions options;  
    PartyString translation;  
} PartyTranslation  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates whether the translation operation succeeded.
  
On success, ```translation``` will be a string of non-zero length containing the translated text. On failure, the string will be empty.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language code of the translation.
  
The language code will be in BCP 47 format, such as en-US for English (United States). Supported language codes are enumerated at [https://docs.microsoft.com/azure/cognitive-services/speech-service/language-support](https://docs.microsoft.com/azure/cognitive-services/speech-service/language-support).
  
**`options`** &nbsp; [PartyTranslationReceivedOptions](../enums/partytranslationreceivedoptions.md)  
  
Additional options describing the translation.
  
**`translation`** &nbsp; [PartyString](../typedefs.md)  
  
The translation string.
  
The translation string may be up to ```c_maxChatTextMessageLength``` characters long, not including the null terminator. Truncation occurs if the translated string length would exceed that limit, which can happen due to language differences even though the original string length is less than or equal to ```c_maxChatTextMessageLength```. In such a case, ```options``` will contain [PartyTranslationReceivedOptions::Truncated](../enums/partytranslationreceivedoptions.md). Truncation may occur at an arbitrary point in the UTF-8 byte sequence and may not result in a complete, valid character or word. Strings are always null terminated, even when truncated.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
