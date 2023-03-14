---
author: jasonsandlin
title: "PFMultiplayerServerBuildSummary"
description: "PFMultiplayerServerBuildSummary data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerBuildSummary  

PFMultiplayerServerBuildSummary data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildSummary {  
    const char* buildId;  
    const char* buildName;  
    time_t const* creationTime;  
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
  
**`metadataCount`** &nbsp; uint32_t  
*array of size `metadataCount`*  
  
(Optional) The metadata of the build.
  
**`regionConfigurations`** &nbsp; [PFMultiplayerServerBuildRegion](pfmultiplayerserverbuildregion.md) const*  
*array of size `regionConfigurationsCount`*  
  
(Optional) The configuration and status for each region in the build.
  
**`regionConfigurationsCount`** &nbsp; uint32_t  
  
Count of regionConfigurations
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
