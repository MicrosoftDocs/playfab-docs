---
author: jasonsandlin
title: "PFSegmentsAdCampaignAttribution"
description: "PFSegmentsAdCampaignAttribution data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsAdCampaignAttribution  

PFSegmentsAdCampaignAttribution data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsAdCampaignAttribution {  
    time_t attributedAt;  
    const char* campaignId;  
    const char* platform;  
} PFSegmentsAdCampaignAttribution;  
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
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
