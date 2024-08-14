---
author: jdeweyMSFT
title: "PartyNetwork::GetNetworkStatistics"
description: Gets one or more statistic counter values for the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetNetworkStatistics  

Gets one or more statistic counter values for the network.  

## Syntax  
  
```cpp
PartyError GetNetworkStatistics(  
    uint32_t statisticCount,  
    const PartyNetworkStatistic* statisticTypes,  
    uint64_t* statisticValues  
)  
```  
  
### Parameters  
  
**`statisticCount`** &nbsp; uint32_t  
  
The number of statistics in the input `statisticTypes` array and to be written in the `statisticValues` output array. This must be at least 1.  
  
**`statisticTypes`** &nbsp; [PartyNetworkStatistic*](../../../enums/partynetworkstatistic.md)  
*input array of size `statisticCount`*  
  
The `statisticCount` entry input array of unique PartyNetworkStatistic types to retrieve.  
  
**`statisticValues`** &nbsp; uint64_t*  
*output array of size `statisticCount`*  
  
The `statisticCount` entry output array where the statistic values should be written. Each statistic value will be written at the same entry index corresponding to where the requested PartyNetworkStatistic appears in the `statisticTypes` input array.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if retrieving the network statistics succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method is used to retrieve performance counters, queue lengths, historical usage metrics, or other statistical information recorded for this network. <br /><br /> A given PartyNetworkStatistic type may appear in any order in the `statisticTypes` array, but must not be specified more than once. Each corresponding statistic value will be written to the `statisticValues` array in the same order.   <br /><br /> The returned statistic values are always the most current ones available. There is no guarantee they will report the same value from one GetNetworkStatistics() call to the next, even if there were no intervening calls to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetworkStatistic](../../../enums/partynetworkstatistic.md)  
[PartyLocalEndpoint::GetEndpointStatistics](../../PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md)
  
  
