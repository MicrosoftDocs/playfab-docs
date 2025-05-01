---
author: jdeweyMSFT
title: "PartyManager::GetRegions"
description: Gets an array containing the set of regions for which your title is configured, along with round trip latency information.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
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
  
The array provided by this method isn't populated until the first [PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md) is provided. Each subsequent PartyRegionsChangedStateChange indicates an update to this set of regions. Background operations populating this set begin when [Initialize()](partymanager_initialize.md) is called, unless the [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../../../enums/partyregionupdatemode.md). The deferred mode means region retrieval and connection quality measurement doesn't begin until the application calls [CreateNewNetwork()](partymanager_createnewnetwork.md) with a zero entry region array, or isn't connected to any network and calls [PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles()](../../PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md), [PartyLocalChatControl::SetTextToSpeechProfile()](../../PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md), or [PartyLocalChatControl::SetTranscriptionOptions()](../../PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) with option flags that include [PartyVoiceChatTranscriptionOptions::TranscribeSelfRegardlessOfNetworkState](../../../enums/partyvoicechattranscriptionoptions.md). The [PartyOption::RegionUpdateConfiguration](../../../enums/partyoption.md) option can also be used to configure the interval after which the regions array is to be refreshed. <br /><br /> The returned array is sorted in order of increasing latency. Latency for a region is defined as the end-to-end time it takes to send a UDP datagram to the region's PlayFab Quality of Service beacon and receive a response. The library measures latency for each region several times in order to calculate high fidelity results. Applications can alter low-level aspects of this connection quality measurement procedure using the [PartyOption::RegionQualityMeasurementConfiguration](../../../enums/partyoption.md) option.   <br /><br /> A latency equivalent to UINT32_MAX indicates that the region is supported but latency information couldn't be determined, either due to failures internal to the library or a timeout was reached without receiving a response from the beacon. This can be used for diagnostic purposes (a UINT32_MAX latency to every region likely indicates a local configuration problem) or used to filter out regions that are unlikely to be viable during region selection.   <br /><br /> The returned names in the [PartyRegion](../../../structs/partyregion.md) structures aren't localized to the current user's language, and showing the strings directly in UI isn't recommended outside of troubleshooting.   <br /><br /> Don't assume the set of regions returned remain the same over the life of your title. The PlayFab Party library will automatically take advantage of additions and changes to available regions over time to continually improve the experience for end users.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyRegionsChangedStateChange](../../../structs/partyregionschangedstatechange.md)  
[PartyManager::CreateNewNetwork](partymanager_createnewnetwork.md)
  
  
