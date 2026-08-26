---
author: jasonsandlin
title: "PFStatisticsGetStatisticsGetResultSize"
description: "Get the size in bytes needed to store the result of a GetStatistics call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsGetResultSize  

Get the size in bytes needed to store the result of a GetStatistics call.  

## Syntax  
  
```cpp
HRESULT PFStatisticsGetStatisticsGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_API_NOT_ENABLED_FOR_GAME_CLIENT_ACCESS, E_PF_INVALID_ENTITY_TYPE, E_PF_NOT_AUTHORIZED, E_PF_STATISTIC_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
