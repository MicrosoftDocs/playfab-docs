---
author: jasonsandlin
title: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsAsync"
description: "Retrieves the title player accounts associated with the given master player account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsAsync  

Retrieves the title player accounts associated with the given master player account.  

## Syntax  
  
```cpp
HRESULT PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest*](../../pfprofilestypes/structs/pfprofilesgettitleplayersfrommasterplayeraccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given a master player account id (PlayFab ID), returns all title player accounts associated with it. When the asynchronous task is complete, call [PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsGetResultSize](pfprofilesgettitleplayersfrommasterplayeraccountidsgetresultsize.md) and [PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsGetResult](pfprofilesgettitleplayersfrommasterplayeraccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
