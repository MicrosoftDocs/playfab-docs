---
author: jasonsandlin
title: "PFTitleDataManagementGetTitleDataRequest"
description: "PFTitleDataManagementGetTitleDataRequest data model. This API is designed to return title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. If the player belongs to an experiment variant that uses title data overrides, the overrides are applied automatically and returned with the title data. Note that there may up to a minute delay in between updating title data and this API call returning the newest value."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetTitleDataRequest  

PFTitleDataManagementGetTitleDataRequest data model. This API is designed to return title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. If the player belongs to an experiment variant that uses title data overrides, the overrides are applied automatically and returned with the title data. Note that there may up to a minute delay in between updating title data and this API call returning the newest value.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetTitleDataRequest {  
    const char* const* keys;  
    uint32_t keysCount;  
    const char* overrideLabel;  
} PFTitleDataManagementGetTitleDataRequest;  
```
  
### Members  
  
**`keys`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Specific keys to search for in the title data (leave null to get all keys).
  
**`keysCount`** &nbsp; uint32_t  
  
Count of keys
  
**`overrideLabel`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional field that specifies the name of an override. This value is ignored when used by the game client; otherwise, the overrides are applied automatically to the title data.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
