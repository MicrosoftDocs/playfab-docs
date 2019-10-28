---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile::GetName"
description: Gets the human-readable name of this profile.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyTextToSpeechProfile::GetName  

Gets the human-readable name of this profile.  

## Syntax  
  
```cpp
PartyError GetName(  
    PartyString* name  
)  
```  
  
### Parameters  
  
**`name`** &nbsp; [PartyString*](../../../typedefs.md)  
*output*  
  
The output profile name.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This name is intended for use in title UI and logs, but is not localized.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyTextToSpeechProfile](../partytexttospeechprofile.md)  

  
  
