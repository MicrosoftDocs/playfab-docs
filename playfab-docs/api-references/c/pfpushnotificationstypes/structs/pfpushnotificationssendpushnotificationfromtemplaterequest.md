---
author: jasonsandlin
title: "PFPushNotificationsSendPushNotificationFromTemplateRequest"
description: "PFPushNotificationsSendPushNotificationFromTemplateRequest data model. Represents the request for sending a push notification template to a recipient."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPushNotificationsSendPushNotificationFromTemplateRequest  

PFPushNotificationsSendPushNotificationFromTemplateRequest data model. Represents the request for sending a push notification template to a recipient.  

## Syntax  
  
```cpp
typedef struct PFPushNotificationsSendPushNotificationFromTemplateRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* pushNotificationTemplateId;  
    const char* recipient;  
} PFPushNotificationsSendPushNotificationFromTemplateRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`pushNotificationTemplateId`** &nbsp; const char*  
*is null-terminated*  
  
Id of the push notification template.
  
**`recipient`** &nbsp; const char*  
*is null-terminated*  
  
PlayFabId of the push notification recipient.
  
  
## Requirements  
  
**Header:** PFPushNotificationsTypes.h
  
## See also  
[PFPushNotificationsTypes members](../pfpushnotificationstypes_members.md)  

  
  
