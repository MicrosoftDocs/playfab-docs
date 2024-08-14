---
author: jdeweyMSFT
title: "PartyInvitation::GetInvitationConfiguration"
description: Gets this invitation's configuration.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyInvitation::GetInvitationConfiguration  

Gets this invitation's configuration.  

## Syntax  
  
```cpp
PartyError GetInvitationConfiguration(  
    const PartyInvitationConfiguration** configuration  
)  
```  
  
### Parameters  
  
**`configuration`** &nbsp; [PartyInvitationConfiguration**](../../../structs/partyinvitationconfiguration.md)  
*library-allocated output*  
  
The output configuration of this invitation.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The memory for the [PartyInvitationConfiguration](../../../structs/partyinvitationconfiguration.md) and all memory it references are valid for the lifetime of the invitation object.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyInvitation](../partyinvitation.md)  
[PartyInvitationConfiguration](../../../structs/partyinvitationconfiguration.md)
  
  
