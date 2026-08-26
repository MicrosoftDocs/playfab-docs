---
author: jasonsandlin
title: "PFStatisticsIncrementStatisticVersionAsync"
description: "Increment an entity statistic definition version."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsIncrementStatisticVersionAsync  

Increment an entity statistic definition version.  

## Syntax  
  
```cpp
HRESULT PFStatisticsIncrementStatisticVersionAsync(  
    PFEntityHandle entityHandle,  
    const PFStatisticsIncrementStatisticVersionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFStatisticsIncrementStatisticVersionRequest*](../../pfstatisticstypes/structs/pfstatisticsincrementstatisticversionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. See also StatisticCreateStatisticDefinitionAsync. When the asynchronous task is complete, call [PFStatisticsIncrementStatisticVersionGetResult](pfstatisticsincrementstatisticversiongetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
