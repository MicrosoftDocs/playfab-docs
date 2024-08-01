---
author: jasonsandlin
title: "PFProfilesSetProfileLanguageResponse"
description: "PFProfilesSetProfileLanguageResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesSetProfileLanguageResponse  

PFProfilesSetProfileLanguageResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesSetProfileLanguageResponse {  
    PFOperationTypes const* operationResult;  
    int32_t const* versionNumber;  
} PFProfilesSetProfileLanguageResponse;  
```
  
### Members  
  
**`operationResult`** &nbsp; [PFOperationTypes](../../pftypes/enums/pfoperationtypes.md) const*  
*may be nullptr*  
  
(Optional) The type of operation that occured on the profile's language.
  
**`versionNumber`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The updated version of the profile after the language update.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
