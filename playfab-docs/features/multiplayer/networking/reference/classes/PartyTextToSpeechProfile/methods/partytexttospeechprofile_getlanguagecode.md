---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile::GetLanguageCode"
description: Gets the language code associated with this profile.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyTextToSpeechProfile::GetLanguageCode  

Gets the language code associated with this profile.  

## Syntax  
  
```cpp
PartyError GetLanguageCode(  
    PartyString* languageCode  
)  
```  
  
### Parameters  
  
**`languageCode`** &nbsp; [PartyString*](../../../typedefs.md)  
*output*  
  
The output profile language.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyTextToSpeechProfile](../partytexttospeechprofile.md)  

  
  
