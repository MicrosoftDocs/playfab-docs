---
author: jasonsandlin
title: "PFMultiplayerServerPartyInvitationConfiguration"
description: "PFMultiplayerServerPartyInvitationConfiguration data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerPartyInvitationConfiguration  

PFMultiplayerServerPartyInvitationConfiguration data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerPartyInvitationConfiguration {  
    PFEntityKey const* entityKeys;  
    uint32_t entityKeysCount;  
    const char* identifier;  
    const char* revocability;  
} PFMultiplayerServerPartyInvitationConfiguration;  
```
  
### Members  
  
**`entityKeys`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The list of PlayFab EntityKeys that the invitation allows to authenticate into the network. If this list is empty, all users are allowed to authenticate using the invitation's identifier. This list may contain no more than 1024 items.
  
**`entityKeysCount`** &nbsp; uint32_t  
  
Count of entityKeys
  
**`identifier`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The invite identifier for this party. If this value is specified, it must be no longer than 127 characters.
  
**`revocability`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Controls which participants can revoke this invite.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
