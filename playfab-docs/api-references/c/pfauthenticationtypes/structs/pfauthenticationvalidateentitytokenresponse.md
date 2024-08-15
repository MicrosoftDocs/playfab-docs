---
author: jasonsandlin
title: "PFAuthenticationValidateEntityTokenResponse"
description: "PFAuthenticationValidateEntityTokenResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationValidateEntityTokenResponse  

PFAuthenticationValidateEntityTokenResponse data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationValidateEntityTokenResponse {  
    PFEntityKey const* entity;  
    PFAuthenticationIdentifiedDeviceType const* identifiedDeviceType;  
    PFLoginIdentityProvider const* identityProvider;  
    const char* identityProviderIssuedId;  
    PFEntityLineage const* lineage;  
} PFAuthenticationValidateEntityTokenResponse;  
```
  
### Members  
  
**`entity`** &nbsp; PFEntityKey const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`identifiedDeviceType`** &nbsp; [PFAuthenticationIdentifiedDeviceType](../enums/pfauthenticationidentifieddevicetype.md) const*  
*may be nullptr*  
  
(Optional) The authenticated device for this entity, for the given login.
  
**`identityProvider`** &nbsp; [PFLoginIdentityProvider](../../pftypes/enums/pfloginidentityprovider.md) const*  
*may be nullptr*  
  
(Optional) The identity provider for this entity, for the given login.
  
**`identityProviderIssuedId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID issued by the identity provider, e.g. a XUID on Xbox Live.
  
**`lineage`** &nbsp; PFEntityLineage const*  
*may be nullptr*  
  
(Optional) The lineage of this profile.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
