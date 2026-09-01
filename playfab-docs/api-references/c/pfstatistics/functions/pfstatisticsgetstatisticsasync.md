---
author: jasonsandlin
title: "PFStatisticsGetStatisticsAsync"
description: "Gets statistics for the specified entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsAsync  

Gets statistics for the specified entity.  

## Syntax  
  
```cpp
HRESULT PFStatisticsGetStatisticsAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsGetStatisticsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsGetStatisticsRequest*](../../pfstatisticstypes/structs/pfstatisticsgetstatisticsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also StatisticDeleteStatisticsAsync. When the asynchronous task is complete, call [PFStatisticsGetStatisticsGetResultSize](pfstatisticsgetstatisticsgetresultsize.md) and [PFStatisticsGetStatisticsGetResult](pfstatisticsgetstatisticsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
