---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile"
description: Represents the voice profile used to synthesize speech.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyTextToSpeechProfile  

Represents the voice profile used to synthesize speech.  

## Syntax  
  
```cpp  
class PartyTextToSpeechProfile  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetIdentifier](methods/partytexttospeechprofile_getidentifier.md) | Gets the unique identifier associated with this profile. |  
| [GetName](methods/partytexttospeechprofile_getname.md) | Gets the human-readable name of this profile. |  
| [GetLanguageCode](methods/partytexttospeechprofile_getlanguagecode.md) | Gets the language code associated with this profile. |  
| [GetGender](methods/partytexttospeechprofile_getgender.md) | Gets the gender associated with this profile. |  
| [GetCustomContext](methods/partytexttospeechprofile_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this profile. |  
| [SetCustomContext](methods/partytexttospeechprofile_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this profile. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles](../PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md)  
[PartyLocalChatControl::GetAvailableTextToSpeechProfiles](../PartyLocalChatControl/methods/partylocalchatcontrol_getavailabletexttospeechprofiles.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](../PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md)  
[PartyLocalChatControl::GetTextToSpeechProfile](../PartyLocalChatControl/methods/partylocalchatcontrol_gettexttospeechprofile.md)
  
  
  
