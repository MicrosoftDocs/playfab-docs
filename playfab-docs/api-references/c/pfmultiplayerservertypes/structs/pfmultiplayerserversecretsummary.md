---
author: jasonsandlin
title: "PFMultiplayerServerSecretSummary"
description: "PFMultiplayerServerSecretSummary data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFMultiplayerServerSecretSummary  

PFMultiplayerServerSecretSummary data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerSecretSummary {  
    time_t const* expirationDate;  
    const char* name;  
    const char* version;  
} PFMultiplayerServerSecretSummary;  
```
  
### Members  
  
**`expirationDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Optional secret expiration date.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the secret.
  
**`version`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The secret version auto-generated after upload.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
