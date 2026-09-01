---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticDefinitionAsync"
description: "Update an existing entity statistic definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticDefinitionAsync  

Update an existing entity statistic definition.  

## Syntax  
  
```cpp
HRESULT PFStatisticsUpdateStatisticDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsUpdateStatisticDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsUpdateStatisticDefinitionRequest*](../../pfstatisticstypes/structs/pfstatisticsupdatestatisticdefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also StatisticCreateStatisticDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_API_NOT_ENABLED_FOR_TITLE, E_PF_INVALID_BASE_TIME_FOR_INTERVAL, E_PF_MAX_QUERYABLE_VERSIONS_EXCEEDED, E_PF_MAX_QUERYABLE_VERSIONS_VALUE_NOT_ALLOWED_FOR_TIER, E_PF_RESET_INTERVAL_CANNOT_BE_MODIFIED, E_PF_STATISTIC_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
