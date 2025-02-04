---
author: jasonsandlin
title: "PFMultiplayerServerSecret"
description: "PFMultiplayerServerSecret data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFMultiplayerServerSecret  

PFMultiplayerServerSecret data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerSecret {  
    time_t const* expirationDate;  
    const char* name;  
    const char* value;  
} PFMultiplayerServerSecret;  
```
  
### Members  
  
**`expirationDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Optional secret expiration date.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
A name for the secret. This is used to reference secrets in build configurations.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
Secret value.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
