---
author: jasonsandlin
title: "PFStatisticsGetStatisticDefinitionAsync"
description: "Get current statistic definition information"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticDefinitionAsync  

Get current statistic definition information  

## Syntax  
  
```cpp
HRESULT PFStatisticsGetStatisticDefinitionAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsGetStatisticDefinitionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsGetStatisticDefinitionRequest*](../../pfstatisticstypes/structs/pfstatisticsgetstatisticdefinitionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticCreateStatisticDefinitionAsync, StatisticDeleteStatisticDefinitionAsync. When the asynchronous task is complete, call [PFStatisticsGetStatisticDefinitionGetResultSize](pfstatisticsgetstatisticdefinitiongetresultsize.md) and [PFStatisticsGetStatisticDefinitionGetResult](pfstatisticsgetstatisticdefinitiongetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
