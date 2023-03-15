---
author: jasonsandlin
title: "PFProfilesSetProfileLanguageAsync"
description: "Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account language, Master Player Account language, and then title default language if the first two aren't set or supported."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesSetProfileLanguageAsync  

Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account language, Master Player Account language, and then title default language if the first two aren't set or supported.  

## Syntax  
  
```cpp
HRESULT PFProfilesSetProfileLanguageAsync(  
    PFEntityHandle entityHandle,  
    const PFProfilesSetProfileLanguageRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFProfilesSetProfileLanguageRequest*](../../pfprofilestypes/structs/pfprofilessetprofilelanguagerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in. If successful, call [PFProfilesSetProfileLanguageGetResult](pfprofilessetprofilelanguagegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
