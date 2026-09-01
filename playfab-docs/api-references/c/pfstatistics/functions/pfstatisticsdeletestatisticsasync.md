---
author: jasonsandlin
title: "PFStatisticsDeleteStatisticsAsync"
description: "Delete statistics on an entity profile. This will remove all rankings from associated leaderboards."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsDeleteStatisticsAsync  

Delete statistics on an entity profile. This will remove all rankings from associated leaderboards.  

## Syntax  
  
```cpp
HRESULT PFStatisticsDeleteStatisticsAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsDeleteStatisticsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsDeleteStatisticsRequest*](../../pfstatisticstypes/structs/pfstatisticsdeletestatisticsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also StatisticUpdateStatisticsAsync. When the asynchronous task is complete, call [PFStatisticsDeleteStatisticsGetResultSize](pfstatisticsdeletestatisticsgetresultsize.md) and [PFStatisticsDeleteStatisticsGetResult](pfstatisticsdeletestatisticsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
