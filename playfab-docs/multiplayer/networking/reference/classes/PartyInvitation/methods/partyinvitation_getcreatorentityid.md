---
author: jdeweyMSFT
title: "PartyInvitation::GetCreatorEntityId"
description: Gets the PlayFab Entity ID of the user that created this invitation or nullptr if this invitation was generated as part of a [PartyManager::CreateNewNetwork()](../../PartyManager/methods/partymanager_createnewnetwork.md) operation.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyInvitation::GetCreatorEntityId  

Gets the PlayFab Entity ID of the user that created this invitation or nullptr if this invitation was generated as part of a [PartyManager::CreateNewNetwork()](../../PartyManager/methods/partymanager_createnewnetwork.md) operation.  

## Syntax  
  
```cpp
PartyError GetCreatorEntityId(  
    PartyString* entityId  
)  
```  
  
### Parameters  
  
**`entityId`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output, may return nullptr*  
  
The output Entity ID of the user that created this invitation, or nullptr.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyInvitation](../partyinvitation.md)  

  
  
