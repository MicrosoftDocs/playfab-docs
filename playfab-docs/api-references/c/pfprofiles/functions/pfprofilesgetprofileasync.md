---
author: jasonsandlin
title: "PFProfilesGetProfileAsync"
description: "Retrieves the entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetProfileAsync  

Retrieves the entity's profile.  

## Syntax  
  
```cpp
HRESULT PFProfilesGetProfileAsync(  
    PFEntityHandle entityHandle,  
    const PFProfilesGetEntityProfileRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFProfilesGetEntityProfileRequest*](../../pfprofilestypes/structs/pfprofilesgetentityprofilerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an entity type and entity identifier will retrieve the profile from the entity store. If the profile being retrieved is the caller's, then the read operation is consistent, if not it is an inconsistent read. An inconsistent read means that we do not guarantee all committed writes have occurred before reading the profile, allowing for a stale read. If consistency is important the Version Number on the result can be used to compare which version of the profile any reader has. When the asynchronous task is complete, call [PFProfilesGetProfileGetResultSize](pfprofilesgetprofilegetresultsize.md) and [PFProfilesGetProfileGetResult](pfprofilesgetprofilegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
