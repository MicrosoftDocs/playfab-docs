---
author: jasonsandlin
title: "PFUserOpenIdInfo"
description: "PFUserOpenIdInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserOpenIdInfo  

PFUserOpenIdInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserOpenIdInfo {  
    const char* connectionId;  
    const char* issuer;  
    const char* subject;  
} PFUserOpenIdInfo;  
```
  
### Members  
  
**`connectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) OpenID Connection ID.
  
**`issuer`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) OpenID Issuer.
  
**`subject`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) OpenID Subject.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
