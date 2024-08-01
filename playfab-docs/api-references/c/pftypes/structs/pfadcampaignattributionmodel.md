---
author: jasonsandlin
title: "PFAdCampaignAttributionModel"
description: "PFAdCampaignAttributionModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAdCampaignAttributionModel  

PFAdCampaignAttributionModel data model.  

## Syntax  
  
```cpp
typedef struct PFAdCampaignAttributionModel {  
    time_t attributedAt;  
    const char* campaignId;  
    const char* platform;  
} PFAdCampaignAttributionModel;  
```
  
### Members  
  
**`attributedAt`** &nbsp; time_t  
  
UTC time stamp of attribution.
  
**`campaignId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Attribution campaign identifier.
  
**`platform`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Attribution network name.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
