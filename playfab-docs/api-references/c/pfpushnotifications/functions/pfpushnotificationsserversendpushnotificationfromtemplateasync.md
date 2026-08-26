---
author: jasonsandlin
title: "PFPushNotificationsServerSendPushNotificationFromTemplateAsync"
description: "Sends an iOS/Android Push Notification template to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPushNotificationsServerSendPushNotificationFromTemplateAsync  

Sends an iOS/Android Push Notification template to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.  

## Syntax  
  
```cpp
HRESULT PFPushNotificationsServerSendPushNotificationFromTemplateAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPushNotificationsSendPushNotificationFromTemplateRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPushNotificationsSendPushNotificationFromTemplateRequest*](../../pfpushnotificationstypes/structs/pfpushnotificationssendpushnotificationfromtemplaterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_PUSH_NOT_ENABLED_FOR_ACCOUNT, E_PF_PUSH_NOTIFICATION_TEMPLATE_NOT_FOUND, E_PF_PUSH_SERVICE_ERROR or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFPushNotifications.h
  
## See also  
[PFPushNotifications members](../pfpushnotifications_members.md)  

  
  
