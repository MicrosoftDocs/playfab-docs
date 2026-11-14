---
author: ScottMunroMS
title: "PartyXblAccessibilitySettings"
description: "Accessibility settings associated with an XBOX Live account."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblAccessibilitySettings  

Accessibility settings associated with an XBOX Live account.  

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
  
**`speechToTextEnabled`** &nbsp; [PartyBool](../../reference/typedefs.md)  
  
True if the user has enabled speech to text in its XBOX Live settings
  
**`textToSpeechEnabled`** &nbsp; [PartyBool](../../reference/typedefs.md)  
  
True if the user has enabled text to speech in its XBOX Live settings
  
**`languageCode`** &nbsp; char[c_maxLanguageCodeStringLength + 1]  
  
Language code associated with this user's accessibility settings. Can be used as a hint when choosing the PartyTextToSpeechProfile for this user.
  
**`gender`** &nbsp; [PartyGender](../../reference/enums/partygender.md)  
  
Gender associated with this user's accessibility settings. Can be used as a hint when choosing the PartyTextToSpeechProfile for this user.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
