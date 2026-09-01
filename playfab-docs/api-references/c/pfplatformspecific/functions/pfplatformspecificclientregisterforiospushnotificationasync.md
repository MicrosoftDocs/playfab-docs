---
author: jasonsandlin
title: "PFPlatformSpecificClientRegisterForIOSPushNotificationAsync"
description: "Registers the iOS device to receive push notifications"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificClientRegisterForIOSPushNotificationAsync  

Registers the iOS device to receive push notifications  

## Syntax  
  
```cpp
HRESULT PFPlatformSpecificClientRegisterForIOSPushNotificationAsync(  
    PFEntityHandle entityHandle,  
    const PFPlatformSpecificRegisterForIOSPushNotificationRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlatformSpecificRegisterForIOSPushNotificationRequest*](../../pfplatformspecifictypes/structs/pfplatformspecificregisterforiospushnotificationrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on iOS. For the steps to configure and send push notifications, see the [push notifications quickstart](../../../../live-service-management/game-configuration/title-communications/push-notifications/quickstart.md). Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_NO_PUSH_NOTIFICATION_ARN_FOR_TITLE, E_PF_PUSH_SERVICE_ERROR or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFPlatformSpecific.h
  
## See also  
[PFPlatformSpecific members](../pfplatformspecific_members.md)  

  
  
