---
author: jdeweyMSFT
title: "PartySetLanguageCompletedStateChange"
description: "Information specific to the *SetLanguageCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartySetLanguageCompletedStateChange  

Information specific to the *SetLanguageCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartySetLanguageCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyLocalChatControl* localChatControl;  
    PartyString languageCode;  
    void* asyncIdentifier;  
} PartySetLanguageCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the operation Succeeded or the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`localChatControl`** &nbsp; [PartyLocalChatControl](../classes/PartyLocalChatControl/partylocalchatcontrol.md)*  
  
The chat control used in the call associated with this state change.
  
**`languageCode`** &nbsp; [PartyString](../typedefs.md)  
  
The language code provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalChatControl::SetLanguage](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setlanguage.md)
  
  
