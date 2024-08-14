---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile::GetGender"
description: Gets the gender associated with this profile.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyTextToSpeechProfile::GetGender  

Gets the gender associated with this profile.  

## Syntax  
  
```cpp
PartyError GetGender(  
    PartyGender* gender  
)  
```  
  
### Parameters  
  
**`gender`** &nbsp; [PartyGender*](../../../enums/partygender.md)  
*output*  
  
The output profile gender.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyTextToSpeechProfile](../partytexttospeechprofile.md)  

  
  
