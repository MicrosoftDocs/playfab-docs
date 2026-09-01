---
author: jasonsandlin
title: "PFPushNotificationsPushNotificationPackage"
description: "PFPushNotificationsPushNotificationPackage data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPushNotificationsPushNotificationPackage  

PFPushNotificationsPushNotificationPackage data model.  

## Syntax  
  
```cpp
typedef struct PFPushNotificationsPushNotificationPackage {  
    int32_t badge;  
    const char* customData;  
    const char* icon;  
    const char* message;  
    const char* sound;  
    const char* title;  
} PFPushNotificationsPushNotificationPackage;  
```
  
### Members  
  
**`badge`** &nbsp; int32_t  
  
Numerical badge to display on App icon (iOS only).
  
**`customData`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) This must be a JSON formatted object. For use with developer-created custom Push Notification plugins.
  
**`icon`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Icon file to display with the message (Not supported for iOS).
  
**`message`** &nbsp; const char*  
*is null-terminated*  
  
Content of the message (all platforms).
  
**`sound`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Sound file to play with the message (all platforms).
  
**`title`** &nbsp; const char*  
*is null-terminated*  
  
Title/Subject of the message. Not supported for iOS.
  
  
## Requirements  
  
**Header:** PFPushNotificationsTypes.h
  
## See also  
[PFPushNotificationsTypes members](../pfpushnotificationstypes_members.md)  

  
  
