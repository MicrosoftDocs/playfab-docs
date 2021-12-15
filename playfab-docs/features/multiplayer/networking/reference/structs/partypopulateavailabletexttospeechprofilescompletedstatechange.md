---
author: jdeweyMSFT
title: "PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange"
description: "Information specific to the *PopulateAvailableTextToSpeechProfilesCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange  

Information specific to the *PopulateAvailableTextToSpeechProfilesCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    void* asyncIdentifier;  
} PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
On success, the profile list provided by [PartyLocalChatControl::GetAvailableTextToSpeechProfiles()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_getavailabletexttospeechprofiles.md) will be populated with the results of the operation. On failure, the profile list will remain unchanged.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md)
  
  
