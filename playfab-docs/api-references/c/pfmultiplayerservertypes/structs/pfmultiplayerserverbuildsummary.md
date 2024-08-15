---
author: jasonsandlin
title: "PFMultiplayerServerBuildSummary"
description: "PFMultiplayerServerBuildSummary data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerBuildSummary  

PFMultiplayerServerBuildSummary data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildSummary {  
    const char* buildId;  
    const char* buildName;  
    time_t const* creationTime;  
    PFStringDictionaryEntry const* metadata;  
    uint32_t metadataCount;  
    PFMultiplayerServerBuildRegion const* regionConfigurations;  
    uint32_t regionConfigurationsCount;  
} PFMultiplayerServerBuildSummary;  
```
  
### Members  
  
**`buildId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The guid string build ID of the build.
  
**`buildName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The build name.
  
**`creationTime`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time the build was created in UTC.
  
**`metadata`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The metadata of the build.
  
**`metadataCount`** &nbsp; uint32_t  
  
Count of metadata
  
**`regionConfigurations`** &nbsp; [PFMultiplayerServerBuildRegion](pfmultiplayerserverbuildregion.md) const*  
*may be nullptr*  
  
(Optional) The configuration and status for each region in the build.
  
**`regionConfigurationsCount`** &nbsp; uint32_t  
  
Count of regionConfigurations
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
