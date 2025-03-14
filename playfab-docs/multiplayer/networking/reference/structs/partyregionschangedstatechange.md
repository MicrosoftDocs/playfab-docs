---
author: jdeweyMSFT
title: "PartyRegionsChangedStateChange"
description: "Information specific to the *RegionsChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# PartyRegionsChangedStateChange  

Information specific to the *RegionsChanged* type of state change.  

## Syntax  
  
```cpp
struct PartyRegionsChangedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates whether a background operation to query the list of supported regions and the latency to each region succeeded, or provides the reason that it failed.
  
When the result is [PartyStateChangeResult::Succeeded](../enums/partystatechangeresult.md), the region list provided by [PartyManager::GetRegions()](../classes/PartyManager/methods/partymanager_getregions.md) is populated with the results of the operation. On failure, the region list provided by PartyManager::GetRegions() is empty. <br /><br /> If the result is [PartyStateChangeResult::FailedToBindToLocalUdpSocket](../enums/partystatechangeresult.md), the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) option to a valid, available bind address, and reinitialize the library.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing more troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Retrieving the list of available regions and measuring connection quality to them occurs automatically in the background. This operation is first initiated when [PartyManager::Initialize()](../classes/PartyManager/methods/partymanager_initialize.md) is called unless the [PartyOption::RegionUpdateConfiguration](../enums/partyoption.md) option was used to configure an update mode of [PartyRegionUpdateMode::Deferred](../enums/partyregionupdatemode.md), in which case region updates may not happen at all. Deferred region updates only occur if the application calls [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) with a zero entry region array, or isn't connected to an existing network but calls [PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md), [PartyLocalChatControl::SetTextToSpeechProfile()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md), or [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) with option flags that include [PartyVoiceChatTranscriptionOptions::TranscribeSelfRegardlessOfNetworkState](../enums/partyvoicechattranscriptionoptions.md). The [PartyOption::RegionUpdateConfiguration](../enums/partyoption.md) option can also be used to configure the interval after which the regions are refreshed. <br /><br /> The amount of time it takes to retrieve the list of available regions and measure connection quality to them is dependent on many environmental or dynamic factors, and whether the [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) option was used to modify low-level measurement settings. The *totalMeasurementTimeoutInMilliseconds* field in the [PartyRegionQualityMeasurementConfiguration](partyregionqualitymeasurementconfiguration.md) structure is used to configure the worst case maximum timeout before considering all measurements complete and generating this state change.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetRegions](../classes/PartyManager/methods/partymanager_getregions.md)
  
  
