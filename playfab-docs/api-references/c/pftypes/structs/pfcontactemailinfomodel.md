---
author: jasonsandlin
title: "PFContactEmailInfoModel"
description: "PFContactEmailInfoModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFContactEmailInfoModel  

PFContactEmailInfoModel data model.  

## Syntax  
  
```cpp
typedef struct PFContactEmailInfoModel {  
    const char* emailAddress;  
    const char* name;  
    PFEmailVerificationStatus const* verificationStatus;  
} PFContactEmailInfoModel;  
```
  
### Members  
  
**`emailAddress`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The email address.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the email info data.
  
**`verificationStatus`** &nbsp; [PFEmailVerificationStatus](../enums/pfemailverificationstatus.md) const*  
*may be nullptr*  
  
(Optional) The verification status of the email.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
