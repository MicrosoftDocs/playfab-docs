---
author: jasonsandlin
title: "PFProfilesSetProfilePolicyAsync"
description: "Sets the profiles access policy"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesSetProfilePolicyAsync  

Sets the profiles access policy  

## Syntax  
  
```cpp
HRESULT PFProfilesSetProfilePolicyAsync(  
    PFEntityHandle entityHandle,  
    const PFProfilesSetEntityProfilePolicyRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFProfilesSetEntityProfilePolicyRequest*](../../pfprofilestypes/structs/pfprofilessetentityprofilepolicyrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This will set the access policy statements on the given entity profile. This is not additive, any existing statements will be replaced with the statements in this request. See also ProfileGetProfileAsync. When the asynchronous task is complete, call [PFProfilesSetProfilePolicyGetResultSize](pfprofilessetprofilepolicygetresultsize.md) and [PFProfilesSetProfilePolicyGetResult](pfprofilessetprofilepolicygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
