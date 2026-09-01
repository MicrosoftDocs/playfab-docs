---
author: jasonsandlin
title: "PFLocalizationGetLanguageListRequest"
description: "PFLocalizationGetLanguageListRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLocalizationGetLanguageListRequest  

PFLocalizationGetLanguageListRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLocalizationGetLanguageListRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFLocalizationGetLanguageListRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFLocalizationTypes.h
  
## See also  
[PFLocalizationTypes members](../pflocalizationtypes_members.md)  

  
  
