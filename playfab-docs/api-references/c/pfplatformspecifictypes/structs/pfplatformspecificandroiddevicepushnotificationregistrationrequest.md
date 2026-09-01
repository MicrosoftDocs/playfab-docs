---
author: jasonsandlin
title: "PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest"
description: "Request for registering an Android device to receive push notifications."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest  

PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest data model. More information can be found on configuring your game for the Google Cloud Messaging service in the Google developer documentation, here: http://developer.android.com/google/gcm/client.html. For the steps to configure and send push notifications, see the [push notifications quickstart](../../../../live-service-management/game-configuration/title-communications/push-notifications/quickstart.md).

## Syntax  
  
```cpp
typedef struct PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest {  
    const char* confirmationMessage;  
    const char* deviceToken;  
    bool const* sendPushNotificationConfirmation;  
} PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest;  
```
  
### Members  
  
**`confirmationMessage`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Message to display when confirming push notification.
  
**`deviceToken`** &nbsp; const char*  
*is null-terminated*  
  
Registration ID provided by the Google Cloud Messaging service when the title registered to receive push notifications (see the GCM documentation, here: http://developer.android.com/google/gcm/client.html).
  
**`sendPushNotificationConfirmation`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If true, send a test push message immediately after sucessful registration. Defaults to false.
  
  
## Requirements  
  
**Header:** PFPlatformSpecificTypes.h
  
## See also  
[PFPlatformSpecificTypes members](../pfplatformspecifictypes_members.md)  

  
  
