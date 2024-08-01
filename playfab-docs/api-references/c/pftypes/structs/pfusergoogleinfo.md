---
author: jasonsandlin
title: "PFUserGoogleInfo"
description: "PFUserGoogleInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserGoogleInfo  

PFUserGoogleInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserGoogleInfo {  
    const char* googleEmail;  
    const char* googleGender;  
    const char* googleId;  
    const char* googleLocale;  
    const char* googleName;  
} PFUserGoogleInfo;  
```
  
### Members  
  
**`googleEmail`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Email address of the Google account.
  
**`googleGender`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Gender information of the Google account.
  
**`googleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Google ID.
  
**`googleLocale`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Locale of the Google account.
  
**`googleName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the Google account user.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
