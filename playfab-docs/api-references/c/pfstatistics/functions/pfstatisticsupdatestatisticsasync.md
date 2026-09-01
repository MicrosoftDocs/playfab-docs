---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticsAsync"
description: "Update statistics on an entity profile. Depending on the statistic definition, this may result in entity being ranked on various leaderboards."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticsAsync  

Update statistics on an entity profile. Depending on the statistic definition, this may result in entity being ranked on various leaderboards.  

## Syntax  
  
```cpp
HRESULT PFStatisticsUpdateStatisticsAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsUpdateStatisticsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsUpdateStatisticsRequest*](../../pfstatisticstypes/structs/pfstatisticsupdatestatisticsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also StatisticDeleteStatisticsAsync. When the asynchronous task is complete, call [PFStatisticsUpdateStatisticsGetResultSize](pfstatisticsupdatestatisticsgetresultsize.md) and [PFStatisticsUpdateStatisticsGetResult](pfstatisticsupdatestatisticsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
