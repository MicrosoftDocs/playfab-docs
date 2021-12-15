---
author: alexatxbox
title: "PartyXblTokenAndSignatureRequestedStateChange"
description: "Information specific to the *TokenAndSignatureRequested* type of state change."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblTokenAndSignatureRequestedStateChange  

Information specific to the *TokenAndSignatureRequested* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyXblTokenAndSignatureRequestedStateChange {  
    uint32_t correlationId;  
    PartyString method;  
    PartyString url;  
    uint32_t headerCount;  
    PartyXblHttpHeader* headers;  
    uint32_t bodySize;  
    const void* body;  
    PartyBool forceRefresh;  
    PartyBool allUsers;  
    PartyXblLocalChatUser* localChatUser;  
} PartyXblTokenAndSignatureRequestedStateChange  
```
  
### Members  
  
**`correlationId`** &nbsp; uint32_t  
  
Opaque identifier used to associate the token and signature request with the internal HTTP request. Use this identifier when calling [PartyXblManager::CompleteGetTokenAndSignatureRequest()](../classes/PartyXblManager/methods/partyxblmanager_completegettokenandsignaturerequest.md) to complete the operation.
  
**`method`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The HTTP method for the request, such as "GET" or "POST".
  
**`url`** &nbsp; [PartyString](../../../networking/reference/typedefs.md)  
  
The URL for the HTTP request that needs a token and signature (fully escaped).
  
**`headerCount`** &nbsp; uint32_t  
  
The number of headers for the HTTP request.
  
**`headers`** &nbsp; [PartyXblHttpHeader](partyxblhttpheader.md)*  
*array of size `headerCount`*  
  
The headers for the HTTP request.
  
**`bodySize`** &nbsp; uint32_t  
  
The size of the request body in bytes.
  
**`body`** &nbsp; const void*  
*buffer of size `bodySize` bytes*  
  
The request body.
  
**`forceRefresh`** &nbsp; [PartyBool](../../../networking/reference/typedefs.md)  
  
If ```true``` the token must be refreshed, ignoring any cached token.
  
**`allUsers`** &nbsp; [PartyBool](../../../networking/reference/typedefs.md)  
  
If ```true```, a token should be requested for all users rather than a specific user. In the case ```localChatUser``` will be nullptr.
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
*may be nullptr*  
  
The local chat user that should be used to retrieve the token and signature.
  
This field is only valid when ```allUsers``` is set to ```false```.
  
## Remarks  
  
The title can use the Xbox Authentication Library (XAL) to fulfil these requests by calling the XalUserGetTokenAndSignatureSilentlyAsync() function. <br /><br /> Use [PartyXblManager::CompleteGetTokenAndSignatureRequest()](../classes/PartyXblManager/methods/partyxblmanager_completegettokenandsignaturerequest.md) to provide the token and signature and complete the operation.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
