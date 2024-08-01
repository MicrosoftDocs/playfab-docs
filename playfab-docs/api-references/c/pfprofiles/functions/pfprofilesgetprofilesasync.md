---
author: jasonsandlin
title: "PFProfilesGetProfilesAsync"
description: "Retrieves the entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetProfilesAsync  

Retrieves the entity's profile.  

## Syntax  
  
```cpp
HRESULT PFProfilesGetProfilesAsync(  
    PFEntityHandle entityHandle,  
    const PFProfilesGetEntityProfilesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFProfilesGetEntityProfilesRequest*](../../pfprofilestypes/structs/pfprofilesgetentityprofilesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given a set of entity types and entity identifiers will retrieve all readable profiles properties for the caller. Profiles that the caller is not allowed to read will silently not be included in the results. When the asynchronous task is complete, call [PFProfilesGetProfilesGetResultSize](pfprofilesgetprofilesgetresultsize.md) and [PFProfilesGetProfilesGetResult](pfprofilesgetprofilesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
