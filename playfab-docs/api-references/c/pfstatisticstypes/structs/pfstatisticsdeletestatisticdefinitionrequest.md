---
author: jasonsandlin
title: "PFStatisticsDeleteStatisticDefinitionRequest"
description: "PFStatisticsDeleteStatisticDefinitionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsDeleteStatisticDefinitionRequest  

PFStatisticsDeleteStatisticDefinitionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsDeleteStatisticDefinitionRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* name;  
} PFStatisticsDeleteStatisticDefinitionRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic to delete.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
