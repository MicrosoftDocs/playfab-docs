---
author: jasonsandlin
title: "Services C API overview - PFAuthenticationTypes.h"
description: "Services C API overview - PFAuthenticationTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# Services C API overview - PFAuthenticationTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFAuthenticationLoginResult](structs/pfauthenticationloginresult.md) | PFAuthenticationLoginResult data model. |  
| [PFAuthenticationLoginWithXUserRequest](structs/pfauthenticationloginwithxuserrequest.md) | PFAuthenticationLoginWithXUserRequest data model. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Request object for PFAuthenticationLoginWithXUserAsync. |  
| [PFAuthenticationUserSettings](structs/pfauthenticationusersettings.md) | PFAuthenticationUserSettings data model. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFAuthenticationIdentifiedDeviceType](enums/pfauthenticationidentifieddevicetype.md) | IdentifiedDeviceType enum.|  
