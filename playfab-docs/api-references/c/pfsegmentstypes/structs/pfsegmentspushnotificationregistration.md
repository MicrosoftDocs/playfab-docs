---
author: jasonsandlin
title: "PFSegmentsPushNotificationRegistration"
description: "PFSegmentsPushNotificationRegistration data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsPushNotificationRegistration  

PFSegmentsPushNotificationRegistration data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsPushNotificationRegistration {  
    const char* notificationEndpointARN;  
    PFPushNotificationPlatform const* platform;  
} PFSegmentsPushNotificationRegistration;  
```
  
### Members  
  
**`notificationEndpointARN`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Notification configured endpoint.
  
**`platform`** &nbsp; [PFPushNotificationPlatform](../../pftypes/enums/pfpushnotificationplatform.md) const*  
*may be nullptr*  
  
(Optional) Push notification platform.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
