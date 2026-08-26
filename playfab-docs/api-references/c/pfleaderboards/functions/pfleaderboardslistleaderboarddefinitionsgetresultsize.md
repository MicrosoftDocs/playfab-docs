---
author: jasonsandlin
title: "PFLeaderboardsListLeaderboardDefinitionsGetResultSize"
description: "Get the size in bytes needed to store the result of a ListLeaderboardDefinitions call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsListLeaderboardDefinitionsGetResultSize  

Get the size in bytes needed to store the result of a ListLeaderboardDefinitions call.  

## Syntax  
  
```cpp
HRESULT PFLeaderboardsListLeaderboardDefinitionsGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFLeaderboards.h
  
## See also  
[PFLeaderboards members](../pfleaderboards_members.md)  

  
  
