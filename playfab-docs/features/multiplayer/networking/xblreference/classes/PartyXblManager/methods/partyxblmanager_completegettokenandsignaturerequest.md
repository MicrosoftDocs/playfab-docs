---
author: ScottMunroMS
title: "PartyXblManager::CompleteGetTokenAndSignatureRequest"
description: Completes a GetTokenAndSignature operation.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyXblManager::CompleteGetTokenAndSignatureRequest  

Completes a GetTokenAndSignature operation.  

## Syntax  
  
```cpp
PartyError CompleteGetTokenAndSignatureRequest(  
    uint32_t correlationId,  
    PartyBool succeeded,  
    PartyString token,  
    PartyString signature  
)  
```  
  
### Parameters  
  
**`correlationId`** &nbsp; uint32_t  
  
The correlation id of the web request for which the token and signature were requested.  
  
**`succeeded`** &nbsp; [PartyBool](../../../../../networking/reference/typedefs.md)  
  
The title succeeded the token and signature request.  
  
**`token`** &nbsp; [PartyString](../../../../../networking/reference/typedefs.md)  
*optional*  
  
The token for the request, if necessary, as a null terminated string.  
  
**`signature`** &nbsp; [PartyString](../../../../../networking/reference/typedefs.md)  
*optional*  
  
The signature for the request, if necessary, as a null terminated string.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
The title can use the Xbox Authentication Library (XAL) to fulfill these request by calling the ```XalUserGetTokenAndSignatureSilentlyAsync``` function.  
This should only be called in response to a [PartyXblTokenAndSignatureRequestedStateChange](../../../structs/partyxbltokenandsignaturerequestedstatechange.md).
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblTokenAndSignatureRequestedStateChange](../../../structs/partyxbltokenandsignaturerequestedstatechange.md)
  
  
