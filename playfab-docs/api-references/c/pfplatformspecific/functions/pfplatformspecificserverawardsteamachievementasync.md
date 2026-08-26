---
author: jasonsandlin
title: "PFPlatformSpecificServerAwardSteamAchievementAsync"
description: "Awards the specified users the specified Steam achievements"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificServerAwardSteamAchievementAsync  

Awards the specified users the specified Steam achievements  

## Syntax  
  
```cpp
HRESULT PFPlatformSpecificServerAwardSteamAchievementAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlatformSpecificAwardSteamAchievementRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlatformSpecificAwardSteamAchievementRequest*](../../pfplatformspecifictypes/structs/pfplatformspecificawardsteamachievementrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. When the asynchronous task is complete, call [PFPlatformSpecificServerAwardSteamAchievementGetResultSize](pfplatformspecificserverawardsteamachievementgetresultsize.md) and [PFPlatformSpecificServerAwardSteamAchievementGetResult](pfplatformspecificserverawardsteamachievementgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlatformSpecific.h
  
## See also  
[PFPlatformSpecific members](../pfplatformspecific_members.md)  

  
  
