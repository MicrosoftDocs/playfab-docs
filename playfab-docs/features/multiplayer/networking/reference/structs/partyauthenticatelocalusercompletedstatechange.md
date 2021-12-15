---
author: jdeweyMSFT
title: "PartyAuthenticateLocalUserCompletedStateChange"
description: "Information specific to the *AuthenticateLocalUserCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyAuthenticateLocalUserCompletedStateChange  

Information specific to the *AuthenticateLocalUserCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyAuthenticateLocalUserCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    PartyString invitationIdentifier;  
    void* asyncIdentifier;  
} PartyAuthenticateLocalUserCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the authenticate local user operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`invitationIdentifier`** &nbsp; [PartyString](../typedefs.md)  
  
The identifier of the invitation used to authenticate into the network.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::AuthenticateLocalUser](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md)
  
  
