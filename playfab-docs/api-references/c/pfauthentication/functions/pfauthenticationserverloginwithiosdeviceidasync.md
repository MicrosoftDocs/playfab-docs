---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithIOSDeviceIDAsync"
description: "Signs the user in using the iOS device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithIOSDeviceIDAsync  

Signs the user in using the iOS device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithIOSDeviceIDAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationServerLoginWithIOSDeviceIDRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationServerLoginWithIOSDeviceIDRequest*](../../pfauthenticationtypes/structs/pfauthenticationserverloginwithiosdeviceidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. On iOS devices, the identifierForVendor (https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html# // apple_ref/occ/instp/UIDevice/identifierForVendor) must be used as the DeviceId, as the UIDevice uniqueIdentifier has been deprecated as of iOS 5, and use of the advertisingIdentifier for this purpose will result in failure of Apple's certification process. If this is the first time a user has signed in with the iOS device and CreateAccount is set to true, a new PlayFab account will be created and linked to the vendor-specific iOS device ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the iOS device, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. When the asynchronous task is complete, call [PFAuthenticationServerLoginWithIOSDeviceIDGetResult](pfauthenticationserverloginwithiosdeviceidgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
