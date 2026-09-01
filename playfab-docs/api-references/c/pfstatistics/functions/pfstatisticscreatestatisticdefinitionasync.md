---
author: jasonsandlin
title: "PFStatisticsCreateStatisticDefinitionAsync"
description: "Create a new entity statistic definition."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsCreateStatisticDefinitionAsync  

Create a new entity statistic definition.  

## Syntax  
  
```cpp
HRESULT PFStatisticsCreateStatisticDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsCreateStatisticDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsCreateStatisticDefinitionRequest*](../../pfstatisticstypes/structs/pfstatisticscreatestatisticdefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticDeleteStatisticDefinitionAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_AGGREGATION_TYPE_NOT_ALLOWED_FOR_LINKED_STAT, E_PF_AGGREGATION_TYPE_NOT_ALLOWED_FOR_MULTI_COLUMN_STATISTIC, E_PF_API_NOT_ENABLED_FOR_TITLE, E_PF_DUPLICATE_COLUMN_NAME_FOUND, E_PF_DUPLICATE_STATISTIC_NAME, E_PF_ENTITY_TYPE_SPECIFIED_REQUIRES_AGGREGATION_SOURCE, E_PF_EXTERNAL_ENTITY_NOT_ALLOWED_FOR_TIER, E_PF_INVALID_BASE_TIME_FOR_INTERVAL, E_PF_INVALID_ENTITY_TYPE_FOR_AGGREGATION, E_PF_MAX_QUERYABLE_VERSIONS_EXCEEDED, E_PF_MAX_QUERYABLE_VERSIONS_VALUE_NOT_ALLOWED_FOR_TIER, E_PF_MULTI_LEVEL_AGGREGATION_NOT_ALLOWED, E_PF_PLAY_FAB_ERROR_EVENT_NOT_SUPPORTED_FOR_ENTITY_TYPE, E_PF_STATISTIC_COLUMN_AGGREGATION_MISMATCH, E_PF_STATISTIC_COLUMN_LENGTH_MISMATCH, E_PF_STATISTIC_COUNT_LIMIT_EXCEEDED, E_PF_STATISTIC_DEFINITION_HAS_NULL_OR_EMPTY_VERSION_CONFIGURATION, E_PF_STATISTIC_NAME_CONFLICT, E_PF_STATISTIC_NOT_FOUND, E_PF_VERSION_CONFIGURATION_CANNOT_BE_SPECIFIED_FOR_LINKED_STAT, E_PF_VERSION_CONFIGURATION_IS_REQUIRED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
