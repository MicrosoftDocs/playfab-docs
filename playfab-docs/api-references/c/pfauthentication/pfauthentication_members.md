---
author: jasonsandlin
title: "Services C API overview - PFAuthentication.h"
description: "Services C API overview - PFAuthentication.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# Services C API overview - PFAuthentication.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFAuthenticationLoginWithXUserAsync](functions/pfauthenticationloginwithxuserasync.md) | Signs the user in using an XUserHandle, returning a session identifier that can subsequently be used for API calls which require an authenticated user |  
| [PFAuthenticationLoginWithXUserGetResult](functions/pfauthenticationloginwithxusergetresult.md) | Get the result from a PFAuthenticationLoginWithXUserAsync call. The PFEntityHandle will always be returned, but the additional info in the PFAuthenticationLoginResult is only returned if a buffer is provided. |  
| [PFAuthenticationLoginWithXUserGetResultSize](functions/pfauthenticationloginwithxusergetresultsize.md) | Get the size in bytes needed to store the result of a PFAuthenticationLoginWithXUserAsync call. |  
| [PFAuthenticationReLoginWithXUserAsync](functions/pfauthenticationreloginwithxuserasync.md) | Reauthenticates an existing PFEntityHandle using an XUserHandle. Used to address situations where the EntityToken expired and the PlayFab SDK is unable to refresh it. |  
