---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticDefinitionRequest"
description: "PFStatisticsUpdateStatisticDefinitionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticDefinitionRequest  

PFStatisticsUpdateStatisticDefinitionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsUpdateStatisticDefinitionRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFStatisticsStatisticsEventEmissionConfig const* eventEmissionConfig;  
    const char* name;  
    PFVersionConfiguration const* versionConfiguration;  
} PFStatisticsUpdateStatisticDefinitionRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`eventEmissionConfig`** &nbsp; [PFStatisticsStatisticsEventEmissionConfig](pfstatisticsstatisticseventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: Configurations for different Statistics events that can be emitted by the service.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic. Must be less than 150 characters. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
*may be nullptr*  
  
(Optional) The version reset configuration for the statistic definition.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
