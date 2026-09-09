---
author: jasonsandlin
title: "PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest"
description: "PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest data model. More information can be found on configuring your game for the Google Cloud Messaging service in the Google developer documentation, here: http://developer.android.com/google/gcm/client.html. The steps to configure and send Push Notifications is described in the PlayFab tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest  

PFPlatformSpecificAndroidDevicePushNotificationRegistrationRequest data model. More information can be found on configuring your game for the Google Cloud Messaging service in the Google developer documentation, here: http://developer.android.com/google/gcm/client.html. The steps to configure and send Push Notifications is described in the PlayFab tutorials, here: https://docs.microsoft.com/gaming/playfab/features/engagement/push-notifications/quickstart.  

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

  
  
