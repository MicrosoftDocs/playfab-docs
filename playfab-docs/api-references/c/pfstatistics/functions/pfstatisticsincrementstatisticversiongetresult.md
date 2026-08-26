---
author: jasonsandlin
title: "PFStatisticsIncrementStatisticVersionGetResult"
description: "Gets the result of a successful PFStatisticsIncrementStatisticVersionAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsIncrementStatisticVersionGetResult  

Gets the result of a successful PFStatisticsIncrementStatisticVersionAsync call.  

## Syntax  
  
```cpp
HRESULT PFStatisticsIncrementStatisticVersionGetResult(  
    XAsyncBlock* async,  
    PFStatisticsIncrementStatisticVersionResponse* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFStatisticsIncrementStatisticVersionResponse*](../../pfstatisticstypes/structs/pfstatisticsincrementstatisticversionresponse.md)  
*output*  
  
PFStatisticsIncrementStatisticVersionResponse object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_EXTERNAL_ENTITY_NOT_ALLOWED_FOR_TIER, E_PF_STATISTIC_NOT_FOUND, E_PF_STATISTIC_UPDATE_IN_PROGRESS, E_PF_STATISTIC_VERSION_INCREMENT_RATE_EXCEEDED, E_PF_VERSION_INCREMENT_RATE_EXCEEDED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
