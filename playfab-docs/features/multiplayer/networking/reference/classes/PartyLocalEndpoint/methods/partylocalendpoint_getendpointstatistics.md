---
author: jdeweyMSFT
title: "PartyLocalEndpoint::GetEndpointStatistics"
description: Gets one or more statistic counter values for the specified target endpoints.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyLocalEndpoint::GetEndpointStatistics  

Gets one or more statistic counter values for the specified target endpoints.  

## Syntax  
  
```cpp
PartyError GetEndpointStatistics(  
    uint32_t targetEndpointCount,  
    PartyEndpointArray targetEndpoints,  
    uint32_t statisticCount,  
    const PartyEndpointStatistic* statisticTypes,  
    uint64_t* statisticValues  
)  
```  
  
### Parameters  
  
**`targetEndpointCount`** &nbsp; uint32_t  
  
The number of target endpoints in the `targetEndpoints` array. May be 0 to retrieve statistics for all endpoints currently in the network, including this local one.  
  
**`targetEndpoints`** &nbsp; [PartyEndpointArray](../../../typedefs.md)  
*input array of size `targetEndpointCount`*  
  
The `targetEndpointCount` entry array of target PartyEndpoint object pointers for which statistics should be retrieved. This is ignored when `targetEndpointCount` is zero.  
  
**`statisticCount`** &nbsp; uint32_t  
  
The number of statistics in the input `statisticTypes` array and to be written in the `statisticValues` output array. This must be at least 1.  
  
**`statisticTypes`** &nbsp; [PartyEndpointStatistic*](../../../enums/partyendpointstatistic.md)  
*input array of size `statisticCount`*  
  
The `statisticCount` entry input array of unique PartyEndpointStatistic types to retrieve.  
  
**`statisticValues`** &nbsp; uint64_t*  
*output array of size `statisticCount`*  
  
The `statisticCount` entry output array where the statistic values should be written. Each statistic value will be written at the same entry index corresponding to where the requested PartyEndpointStatistic appears in the `statisticTypes` input array.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if retrieving the endpoint statistics succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method is used to retrieve performance counters, queue lengths, historical usage metrics, or other statistical information recorded between this local endpoint and a target endpoint. <br /><br /> Alternatively, multiple target endpoints can be provided, or a zero-entry array to retrieve statistics for all target endpoints currently in the network, including this local one. If multiple target endpoints are requested, then the values returned are the combined statistics for those endpoints. The particular method used to combine multiple endpoint statistics into a single value depends on and is described by the specific PartyEndpointStatistic type.   <br /><br /> A given PartyEndpointStatistic type may appear in any order in the `statisticTypes` array, but must not be specified more than once. Each corresponding statistic value will be written to the `statisticValues` array in the same order.   <br /><br /> The returned statistic values are always the most current ones available. There is no guarantee they will report the same value from one GetEndpointStatistics() call to the next, even if there were no intervening calls to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyLocalEndpoint](../partylocalendpoint.md)  
[PartyEndpointStatistic](../../../enums/partyendpointstatistic.md)  
[PartyNetwork::GetNetworkStatistics](../../PartyNetwork/methods/partynetwork_getnetworkstatistics.md)
  
  
