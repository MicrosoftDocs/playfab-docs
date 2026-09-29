---
author: jasonsandlin
title: "PFAccountManagementOpenIdSubjectIdentifier"
description: "PFAccountManagementOpenIdSubjectIdentifier data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementOpenIdSubjectIdentifier  

PFAccountManagementOpenIdSubjectIdentifier data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementOpenIdSubjectIdentifier {  
    const char* issuer;  
    const char* subject;  
} PFAccountManagementOpenIdSubjectIdentifier;  
```
  
### Members  
  
**`issuer`** &nbsp; const char*  
*is null-terminated*  
  
The issuer URL for the OpenId Connect provider, or the override URL if an override exists.
  
**`subject`** &nbsp; const char*  
*is null-terminated*  
  
The unique subject identifier within the context of the issuer.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
