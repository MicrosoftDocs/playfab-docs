---
author: ScottMunroMS
title: "PartyXblAccessibilitySettings"
description: "Accessibility settings associated with an Xbox Live account."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/01/2019
---

# PartyXblAccessibilitySettings  

Accessibility settings associated with an Xbox Live account.  

## Syntax  
  
```cpp
struct PartyXblAccessibilitySettings {  
    PartyBool speechToTextEnabled;  
    PartyBool textToSpeechEnabled;  
    char languageCode[c_maxLanguageCodeStringLength + 1];  
    PartyGender gender;  
}  
```
  
### Members  
  
**`speechToTextEnabled`** &nbsp; [PartyBool](../../../networking/reference/typedefs.md)  
  
True if the user has enabled speech to text in its Xbox Live settings
  
**`textToSpeechEnabled`** &nbsp; [PartyBool](../../../networking/reference/typedefs.md)  
  
True if the user has enabled text to speech in its Xbox Live settings
  
**`languageCode`** &nbsp; char[c_maxLanguageCodeStringLength + 1]  
  
Language code associated with this user's accessibility settings. Can be used as a hint when choosing the PartyTextToSpeechProfile for this user.
  
**`gender`** &nbsp; [PartyGender](../../../networking/reference/enums/partygender.md)  
  
Gender associated with this user's accessibility settings. Can be used as a hint when choosing the PartyTextToSpeechProfile for this user.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
