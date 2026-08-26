---
author: jasonsandlin
title: "PFLocalizationGetLanguageListResponse"
description: "PFLocalizationGetLanguageListResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLocalizationGetLanguageListResponse  

PFLocalizationGetLanguageListResponse data model.  

## Syntax  
  
```cpp
typedef struct PFLocalizationGetLanguageListResponse {  
    const char* const* languageList;  
    uint32_t languageListCount;  
} PFLocalizationGetLanguageListResponse;  
```
  
### Members  
  
**`languageList`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of allowed languages, in BCP47 two-letter format.
  
**`languageListCount`** &nbsp; uint32_t  
  
Count of languageList
  
  
## Requirements  
  
**Header:** PFLocalizationTypes.h
  
## See also  
[PFLocalizationTypes members](../pflocalizationtypes_members.md)  

  
  
