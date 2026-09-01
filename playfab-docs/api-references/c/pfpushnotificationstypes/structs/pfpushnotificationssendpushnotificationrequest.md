---
author: jasonsandlin
title: "PFPushNotificationsSendPushNotificationRequest"
description: "PFPushNotificationsSendPushNotificationRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPushNotificationsSendPushNotificationRequest  

PFPushNotificationsSendPushNotificationRequest data model.  

## Syntax  
  
```cpp
typedef struct PFPushNotificationsSendPushNotificationRequest {  
    PFPushNotificationsAdvancedPushPlatformMsg const* advancedPlatformDelivery;  
    uint32_t advancedPlatformDeliveryCount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* message;  
    PFPushNotificationsPushNotificationPackage const* package;  
    const char* recipient;  
    const char* subject;  
    PFPushNotificationPlatform const* targetPlatforms;  
    uint32_t targetPlatformsCount;  
} PFPushNotificationsSendPushNotificationRequest;  
```
  
### Members  
  
**`advancedPlatformDelivery`** &nbsp; [PFPushNotificationsAdvancedPushPlatformMsg](pfpushnotificationsadvancedpushplatformmsg.md) const*  
*may be nullptr*  
  
(Optional) Allows you to provide precisely formatted json to target devices. This is an advanced feature, allowing you to deliver to custom plugin logic, fields, or functionality not natively supported by PlayFab.
  
**`advancedPlatformDeliveryCount`** &nbsp; uint32_t  
  
Count of advancedPlatformDelivery
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`message`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Text of message to send.
  
**`package`** &nbsp; [PFPushNotificationsPushNotificationPackage](pfpushnotificationspushnotificationpackage.md) const*  
*may be nullptr*  
  
(Optional) Defines all possible push attributes like message, title, icon, etc. Some parameters are device specific - please see the PushNotificationPackage documentation for details.
  
**`recipient`** &nbsp; const char*  
*is null-terminated*  
  
PlayFabId of the recipient of the push notification.
  
**`subject`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Subject of message to send (may not be displayed in all platforms).
  
**`targetPlatforms`** &nbsp; [PFPushNotificationPlatform](../../pftypes/enums/pfpushnotificationplatform.md) const*  
*may be nullptr*  
  
(Optional) Target Platforms that should receive the Message or Package. If omitted, we will send to all available platforms.
  
**`targetPlatformsCount`** &nbsp; uint32_t  
  
Count of targetPlatforms
  
  
## Requirements  
  
**Header:** PFPushNotificationsTypes.h
  
## See also  
[PFPushNotificationsTypes members](../pfpushnotificationstypes_members.md)  

  
  
