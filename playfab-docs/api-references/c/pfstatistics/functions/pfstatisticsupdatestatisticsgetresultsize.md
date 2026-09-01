---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticsGetResultSize"
description: "Get the size in bytes needed to store the result of a UpdateStatistics call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticsGetResultSize  

Get the size in bytes needed to store the result of a UpdateStatistics call.  

## Syntax  
  
```cpp
HRESULT PFStatisticsUpdateStatisticsGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_API_NOT_ENABLED_FOR_GAME_CLIENT_ACCESS, E_PF_ENTITY_TYPE_MISMATCH_WITH_STAT_DEFINITION, E_PF_INVALID_ENTITY_TYPE, E_PF_INVALID_EXTERNAL_ENTITY_ID, E_PF_INVALID_STATISTIC_SCORE, E_PF_METADATA_LENGTH_EXCEEDED, E_PF_NOT_AUTHORIZED, E_PF_STATISTIC_COLUMN_LENGTH_MISMATCH, E_PF_STATISTIC_NOT_FOUND, E_PF_TRANSACTION_ALREADY_APPLIED, E_PF_UPDATING_STATISTICS_USING_TRANSACTION_ID_NOT_AVAILABLE_FOR_FREE_TIER or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
