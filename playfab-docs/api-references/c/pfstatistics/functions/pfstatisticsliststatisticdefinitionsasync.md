---
author: jasonsandlin
title: "PFStatisticsListStatisticDefinitionsAsync"
description: "Get all current statistic definitions information"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsListStatisticDefinitionsAsync  

Get all current statistic definitions information  

## Syntax  
  
```cpp
HRESULT PFStatisticsListStatisticDefinitionsAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsListStatisticDefinitionsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsListStatisticDefinitionsRequest*](../../pfstatisticstypes/structs/pfstatisticsliststatisticdefinitionsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticCreateStatisticDefinitionAsync, StatisticDeleteStatisticDefinitionAsync. When the asynchronous task is complete, call [PFStatisticsListStatisticDefinitionsGetResultSize](pfstatisticsliststatisticdefinitionsgetresultsize.md) and [PFStatisticsListStatisticDefinitionsGetResult](pfstatisticsliststatisticdefinitionsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
