---
author: ScottMunroMS
title: "PFLobbyGetMemberPropertyKeys"
description: "Get a list of the specified member's property keys."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyGetMemberPropertyKeys  

Get a list of the specified member's property keys.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetMemberPropertyKeys(  
    PFLobbyHandle lobby,  
    const PFEntityKey* member,  
    uint32_t* propertyCount,  
    const char* const** keys  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`member`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The member being queried.  
  
**`propertyCount`** &nbsp; uint32_t*  
*output*  
  
The output count of member properties.  
  
**`keys`** &nbsp; char* const**  
*library-allocated output array of size `*propertyCount`*  
  
The output array of member property keys.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
Per-member properties are only visible to members of the lobby and the server if this is a server-owned lobby. <br /><br /> If the member is still in the process of asynchronously joining this lobby either via [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), or [PFLobbyAddMember](pflobbyaddmember.md), this method will return no keys.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
