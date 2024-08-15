---
author: jasonsandlin
title: "PFAccountManagementClientLinkIOSDeviceIDAsync"
description: "Links the vendor-specific iOS device identifier to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkIOSDeviceIDAsync  

Links the vendor-specific iOS device identifier to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkIOSDeviceIDAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkIOSDeviceIDRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkIOSDeviceIDRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkiosdeviceidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ClientLoginWithIOSDeviceIDAsync, ClientUnlinkIOSDeviceIDAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_LINKED_DEVICE_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
