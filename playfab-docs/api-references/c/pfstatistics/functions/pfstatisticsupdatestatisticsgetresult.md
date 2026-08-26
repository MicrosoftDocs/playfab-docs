---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticsGetResult"
description: "Gets the result of a successful PFStatisticsUpdateStatisticsAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticsGetResult  

Gets the result of a successful PFStatisticsUpdateStatisticsAsync call.  

## Syntax  
  
```cpp
HRESULT PFStatisticsUpdateStatisticsGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFStatisticsUpdateStatisticsResponse** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFStatisticsUpdateStatisticsResponse**](../../pfstatisticstypes/structs/pfstatisticsupdatestatisticsresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_API_NOT_ENABLED_FOR_GAME_CLIENT_ACCESS, E_PF_ENTITY_TYPE_MISMATCH_WITH_STAT_DEFINITION, E_PF_INVALID_ENTITY_TYPE, E_PF_INVALID_EXTERNAL_ENTITY_ID, E_PF_INVALID_STATISTIC_SCORE, E_PF_METADATA_LENGTH_EXCEEDED, E_PF_NOT_AUTHORIZED, E_PF_STATISTIC_COLUMN_LENGTH_MISMATCH, E_PF_STATISTIC_NOT_FOUND, E_PF_TRANSACTION_ALREADY_APPLIED, E_PF_UPDATING_STATISTICS_USING_TRANSACTION_ID_NOT_AVAILABLE_FOR_FREE_TIER or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFStatistics.h
  
## See also  
[PFStatistics members](../pfstatistics_members.md)  

  
  
