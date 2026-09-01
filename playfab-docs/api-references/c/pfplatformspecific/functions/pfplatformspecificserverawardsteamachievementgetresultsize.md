---
author: jasonsandlin
title: "PFPlatformSpecificServerAwardSteamAchievementGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerAwardSteamAchievement call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificServerAwardSteamAchievementGetResultSize  

Get the size in bytes needed to store the result of a ServerAwardSteamAchievement call.  

## Syntax  
  
```cpp
HRESULT PFPlatformSpecificServerAwardSteamAchievementGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PRODUCT_DISABLED_FOR_TITLE, E_PF_USERIS_NOT_VALID or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFPlatformSpecific.h
  
## See also  
[PFPlatformSpecific members](../pfplatformspecific_members.md)  

  
  
