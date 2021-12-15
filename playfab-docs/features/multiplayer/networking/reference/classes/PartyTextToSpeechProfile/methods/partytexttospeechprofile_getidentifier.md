---
author: jdeweyMSFT
title: "PartyTextToSpeechProfile::GetIdentifier"
description: Gets the unique identifier associated with this profile.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyTextToSpeechProfile::GetIdentifier  

Gets the unique identifier associated with this profile.  

## Syntax  
  
```cpp
PartyError GetIdentifier(  
    PartyString* identifier  
)  
```  
  
### Parameters  
  
**`identifier`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output unique identifier.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyTextToSpeechProfile](../partytexttospeechprofile.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](../../PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md)
  
  
