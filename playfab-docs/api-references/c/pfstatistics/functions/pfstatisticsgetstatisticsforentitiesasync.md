---
author: jasonsandlin
title: "PFStatisticsGetStatisticsForEntitiesAsync"
description: "Gets statistics for the specified collection of entities."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsForEntitiesAsync  

Gets statistics for the specified collection of entities.  

## Syntax  
  
```cpp
HRESULT PFStatisticsGetStatisticsForEntitiesAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsGetStatisticsForEntitiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsGetStatisticsForEntitiesRequest*](../../pfstatisticstypes/structs/pfstatisticsgetstatisticsforentitiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticDeleteStatisticsAsync. When the asynchronous task is complete, call [PFStatisticsGetStatisticsForEntitiesGetResultSize](pfstatisticsgetstatisticsforentitiesgetresultsize.md) and [PFStatisticsGetStatisticsForEntitiesGetResult](pfstatisticsgetstatisticsforentitiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
