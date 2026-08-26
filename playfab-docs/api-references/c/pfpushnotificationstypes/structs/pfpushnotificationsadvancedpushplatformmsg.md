---
author: jasonsandlin
title: "PFPushNotificationsAdvancedPushPlatformMsg"
description: "PFPushNotificationsAdvancedPushPlatformMsg data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPushNotificationsAdvancedPushPlatformMsg  

PFPushNotificationsAdvancedPushPlatformMsg data model.  

## Syntax  
  
```cpp
typedef struct PFPushNotificationsAdvancedPushPlatformMsg {  
    bool const* gCMDataOnly;  
    const char* json;  
    PFPushNotificationPlatform platform;  
} PFPushNotificationsAdvancedPushPlatformMsg;  
```
  
### Members  
  
**`gCMDataOnly`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Stops GoogleCloudMessaging notifications from including both notification and data properties and instead only sends the data property.
  
**`json`** &nbsp; const char*  
*is null-terminated*  
  
The Json the platform should receive.
  
**`platform`** &nbsp; [PFPushNotificationPlatform](../../pftypes/enums/pfpushnotificationplatform.md)  
  
The platform that should receive the Json.
  
  
## Requirements  
  
**Header:** PFPushNotificationsTypes.h
  
## See also  
[PFPushNotificationsTypes members](../pfpushnotificationstypes_members.md)  

  
  
