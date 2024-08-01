---
author: jasonsandlin
title: "PFTitleDataManagementClientGetTitleDataAsync"
description: "Retrieves the key-value store of custom title settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementClientGetTitleDataAsync  

Retrieves the key-value store of custom title settings  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementClientGetTitleDataAsync(  
    PFEntityHandle entityHandle,  
    const PFTitleDataManagementGetTitleDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFTitleDataManagementGetTitleDataRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgettitledatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This API is designed to return title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. If the player belongs to an experiment variant that uses title data overrides, the overrides are applied automatically and returned with the title data. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. When the asynchronous task is complete, call [PFTitleDataManagementClientGetTitleDataGetResultSize](pftitledatamanagementclientgettitledatagetresultsize.md) and [PFTitleDataManagementClientGetTitleDataGetResult](pftitledatamanagementclientgettitledatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
