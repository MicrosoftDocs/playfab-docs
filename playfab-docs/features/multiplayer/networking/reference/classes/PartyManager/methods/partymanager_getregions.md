---
author: jdeweyMSFT
title: "PartyManager::GetRegions"
description: Gets an array containing the set of regions for which your title is configured, along with round trip latency information.
ms.author: jdewey
ms.topic: reference
ms.service: playfab
ms.date: 08/05/2020
---

# PartyManager::GetRegions  

Gets an array containing the set of regions for which your title is configured, along with round trip latency information.  

## Syntax  
  
```cpp
PartyError GetRegions(  
    uint32_t* regionCount,  
    const PartyRegion** regions  
)  
```  
  
### Parameters  
  
**`regionCount`** &nbsp; uint32_t*  
*output*  
  
The output number of regions provided in `regions`.  
  
**`regions`** &nbsp; [PartyRegion**](../../../structs/partyregion.md)  
*library-allocated output array of size `*regionCount`*  
  
A library-allocated output array containing the set of regions.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
The array provided by this method is not populated until the first [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided. Each subsequent PartyRegionsChangedStateChange indicates an update to this set of regions. Background operations to populate this set begin when [Initialize()](partymanager_initialize.md) is called and, if this set hasn't yet been successfully populated, when [CreateNewNetwork()](partymanager_createnewnetwork.md) is called. <br /><br /> The array will be sorted in order of increasing latency. Latency for a region is defined as the end-to-end time it takes to send a UDP datagram to the PlayFab Quality of Service beacon for that region and receive a response. The library will measure latency for each region several times in order to calculate high fidelity results.   <br /><br /> A latency equivalent to UINT32_MAX indicates that the region is supported but latency information could not be determined, either due to failures internal to the library or a ping timeout was reached without receiving a response from the beacon. This can be used for diagnostic purposes (a UINT32_MAX latency to every region likely indicates a local configuration problem) or used to filter out regions that are unlikely to be viable during region selection.   <br /><br /> The returned names in the [PartyRegion](../../../structs/partyregion.md) structures are not localized to the current user's language, and showing the strings directly in UI is not recommended outside of troubleshooting.   <br /><br /> You shouldn't assume the set of regions returned will remain the same over the life of your title. The PlayFab Party library will automatically take advantage of additions and changes to available regions over time to continually improve the experience for end users.   <br /><br /> After internally retrieving the set of regions, the worst-case time for failing latency measurements to every region would be approximately 500 milliseconds multiplied by the number of regions, but measurements are actually performed in parallel to reduce the overall duration. Successful latency measurement time varies by network environment. Currently most devices worldwide successfully complete the entire measurement process in 2.2 seconds or less, and 95% of devices successfully complete in less than 6 seconds. This may increase slightly over time as additional regions are introduced.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md)  
[PartyManager::CreateNewNetwork](partymanager_createnewnetwork.md)
  
  
