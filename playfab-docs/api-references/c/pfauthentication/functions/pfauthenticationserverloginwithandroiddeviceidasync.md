---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithAndroidDeviceIDAsync"
description: "Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithAndroidDeviceIDAsync  

Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithAndroidDeviceIDAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationServerLoginWithAndroidDeviceIDRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationServerLoginWithAndroidDeviceIDRequest*](../../pfauthenticationtypes/structs/pfauthenticationserverloginwithandroiddeviceidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. On Android devices, the recommendation is to use the Settings.Secure.ANDROID_ID as the AndroidDeviceId, as described in this blog post (http://android-developers.blogspot.com/2011/03/identifying-app-installations.html). More information on this identifier can be found in the Android documentation (http://developer.android.com/reference/android/provider/Settings.Secure.html). If this is the first time a user has signed in with the Android device and CreateAccount is set to true, a new PlayFab account will be created and linked to the Android device ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Android device, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Please note that while multiple devices of this type can be linked to a single user account, only the one most recently used to login (or most recently linked) will be reflected in the user's account information. We will be updating to show all linked devices in a future release. When the asynchronous task is complete, call [PFAuthenticationServerLoginWithAndroidDeviceIDGetResult](pfauthenticationserverloginwithandroiddeviceidgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
