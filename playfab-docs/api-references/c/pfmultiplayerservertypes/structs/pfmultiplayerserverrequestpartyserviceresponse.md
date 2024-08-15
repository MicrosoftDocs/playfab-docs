---
author: jasonsandlin
title: "PFMultiplayerServerRequestPartyServiceResponse"
description: "PFMultiplayerServerRequestPartyServiceResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerRequestPartyServiceResponse  

PFMultiplayerServerRequestPartyServiceResponse data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerRequestPartyServiceResponse {  
    const char* invitationId;  
    const char* partyId;  
    const char* serializedNetworkDescriptor;  
} PFMultiplayerServerRequestPartyServiceResponse;  
```
  
### Members  
  
**`invitationId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The invitation identifier supplied in the PartyInvitationConfiguration, or the PlayFab-generated guid if none was supplied.
  
**`partyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The guid string party ID of the party session.
  
**`serializedNetworkDescriptor`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A base-64 encoded string containing the serialized network descriptor for this party.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
