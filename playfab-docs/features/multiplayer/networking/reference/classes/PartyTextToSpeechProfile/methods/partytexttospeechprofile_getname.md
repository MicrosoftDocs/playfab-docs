---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile::GetName"
description: Gets the human-readable name of this profile.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/05/2020
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
*library-allocated output*  
  
The output profile name. The memory for the string remains valid for the lifetime of the profile.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This name is intended for use in title UI and logs, but is not localized.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyTextToSpeechProfile](../partytexttospeechprofile.md)  

  
  
