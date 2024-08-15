---
author: jasonsandlin
title: "PFPlayerProfileViewConstraints"
description: "PFPlayerProfileViewConstraints data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerProfileViewConstraints  

PFPlayerProfileViewConstraints data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerProfileViewConstraints {  
    bool showAvatarUrl;  
    bool showBannedUntil;  
    bool showCampaignAttributions;  
    bool showContactEmailAddresses;  
    bool showCreated;  
    bool showDisplayName;  
    bool showExperimentVariants;  
    bool showLastLogin;  
    bool showLinkedAccounts;  
    bool showLocations;  
    bool showMemberships;  
    bool showOrigination;  
    bool showPushNotificationRegistrations;  
    bool showStatistics;  
    bool showTags;  
    bool showTotalValueToDateInUsd;  
    bool showValuesToDate;  
} PFPlayerProfileViewConstraints;  
```
  
### Members  
  
**`showAvatarUrl`** &nbsp; bool  
  
Whether to show player's avatar URL. Defaults to false.
  
**`showBannedUntil`** &nbsp; bool  
  
Whether to show the banned until time. Defaults to false.
  
**`showCampaignAttributions`** &nbsp; bool  
  
Whether to show campaign attributions. Defaults to false.
  
**`showContactEmailAddresses`** &nbsp; bool  
  
Whether to show contact email addresses. Defaults to false.
  
**`showCreated`** &nbsp; bool  
  
Whether to show the created date. Defaults to false.
  
**`showDisplayName`** &nbsp; bool  
  
Whether to show the display name. Defaults to false.
  
**`showExperimentVariants`** &nbsp; bool  
  
Whether to show player's experiment variants. Defaults to false.
  
**`showLastLogin`** &nbsp; bool  
  
Whether to show the last login time. Defaults to false.
  
**`showLinkedAccounts`** &nbsp; bool  
  
Whether to show the linked accounts. Defaults to false.
  
**`showLocations`** &nbsp; bool  
  
Whether to show player's locations. Defaults to false.
  
**`showMemberships`** &nbsp; bool  
  
Whether to show player's membership information. Defaults to false.
  
**`showOrigination`** &nbsp; bool  
  
Whether to show origination. Defaults to false.
  
**`showPushNotificationRegistrations`** &nbsp; bool  
  
Whether to show push notification registrations. Defaults to false.
  
**`showStatistics`** &nbsp; bool  
  
Reserved for future development.
  
**`showTags`** &nbsp; bool  
  
Whether to show tags. Defaults to false.
  
**`showTotalValueToDateInUsd`** &nbsp; bool  
  
Whether to show the total value to date in usd. Defaults to false.
  
**`showValuesToDate`** &nbsp; bool  
  
Whether to show the values to date. Defaults to false.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
