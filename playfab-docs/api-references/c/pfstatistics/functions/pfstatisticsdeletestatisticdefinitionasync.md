---
author: jasonsandlin
title: "PFStatisticsDeleteStatisticDefinitionAsync"
description: "Delete an entity statistic definition. Will delete all statistics on entity profiles and leaderboards."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsDeleteStatisticDefinitionAsync  

Delete an entity statistic definition. Will delete all statistics on entity profiles and leaderboards.  

## Syntax  
  
```cpp
HRESULT PFStatisticsDeleteStatisticDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsDeleteStatisticDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsDeleteStatisticDefinitionRequest*](../../pfstatisticstypes/structs/pfstatisticsdeletestatisticdefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticCreateStatisticDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_STATISTIC_DEFINITION_MODIFICATION_NOT_ALLOWED_WHILE_LINKED, E_PF_STATISTIC_NOT_FOUND, E_PF_STATISTIC_UPDATE_IN_PROGRESS or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
