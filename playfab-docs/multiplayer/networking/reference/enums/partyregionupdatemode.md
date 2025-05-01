---
author: jdeweyMSFT
title: "PartyRegionUpdateMode"
description: "Configuration modes representing how the Party library performs automatic region discovery and connection quality measurement as part of the [PartyRegionUpdateConfiguration](../structs/partyregionupdateconfiguration.md) structure."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
---

# PartyRegionUpdateMode  

Configuration modes representing how the Party library performs automatic region discovery and connection quality measurement as part of the [PartyRegionUpdateConfiguration](../structs/partyregionupdateconfiguration.md) structure.    

## Syntax  
  
```cpp
enum class PartyRegionUpdateMode    
{  
    Immediate = 0,  
    Deferred = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Immediate | Automatically begin retrieving the list of available regions and measuring connection quality to them as soon as possible.<br/><br/> The Party library automatically discovers the available regions and measures connection quality to them when PartyManager::Initialize() is first invoked. <br /><br /> The Party library also periodically refreshes the list and quality measurements until PartyManager::Cleanup() is called. If already connected or in the process of connecting to an existing Party network, then refreshing is delayed until disconnected from all Party networks. The periodic refresh interval can be configured using the *refreshIntervalInSeconds* field in the containing [PartyRegionUpdateConfiguration](../structs/partyregionupdateconfiguration.md) structure.   <br /><br /> The application is automatically provided a [PartyRegionsChangedStateChange](../structs/partyregionschangedstatechange.md) indicating available regions or the failure [PartyStateChangeResult](partystatechangeresult.md) whenever a measurement operation completes.   <br /><br /> This mode is the default value when [PartyOption::RegionUpdateConfiguration](partyoption.md) hasn't been configured. |  
| Deferred | Delay retrieving the list of available regions and measuring connection quality to them until creating a new Party network or using certain text-to-speech or speech-to-text functionality.<br/><br/> The Party library doesn't automatically discover the available regions or measure connection quality to them unless the application calls [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) with a region list array with zero entries, or isn't connected to an existing network but calls [PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md), [PartyLocalChatControl::SetTextToSpeechProfile()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md), or [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) with option flags that include [PartyVoiceChatTranscriptionOptions::TranscribeSelfRegardlessOfNetworkState](partyvoicechattranscriptionoptions.md). Once deferred region discovery and quality measurement start, a [PartyRegionsChangedStateChange](../structs/partyregionschangedstatechange.md) indicating available regions or the failure [PartyStateChangeResult](partystatechangeresult.md) is provided prior to the triggering operation's [PartyCreateNewNetworkCompletedStateChange](../structs/partycreatenewnetworkcompletedstatechange.md), [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md), [PartySetTextToSpeechProfileCompletedStateChange](../structs/partysettexttospeechprofilecompletedstatechange.md), or [PartySetTranscriptionOptionsCompletedStateChange](../structs/partysettranscriptionoptionscompletedstatechange.md) completion state change. <br /><br /> On subsequent calls to the above functions with the described parameters, the region list is retrieved and measured again if the refresh interval has elapsed since the last measurements were successfully performed. If already connected or in the process of connecting to an existing Party network, then refreshing is delayed until disconnected from all Party networks. The refresh interval can be configured using the *refreshIntervalInSeconds* field in the containing [PartyRegionUpdateConfiguration](../structs/partyregionupdateconfiguration.md) structure.   <br /><br /> Chat controls internally use local device region latency estimates to optimize service usage for text-to-speech synthesis, speech-to-text transcription, and translation. Using PartyRegionUpdateMode::Deferred may result in these features experiencing higher latency. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyOption::RegionUpdateConfiguration](partyoption.md)  
[PartyRegionUpdateConfiguration](../structs/partyregionupdateconfiguration.md)  
[PartyRegionsChangedStateChange](../structs/partyregionschangedstatechange.md)  
[PartyCreateNewNetworkCompletedStateChange](../structs/partycreatenewnetworkcompletedstatechange.md)  
[PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md)  
[PartySetTextToSpeechProfileCompletedStateChange](../structs/partysettexttospeechprofilecompletedstatechange.md)  
[PartySetTranscriptionOptionsCompletedStateChange](../structs/partysettranscriptionoptionscompletedstatechange.md)  
[PartyManager::Initialize](../classes/PartyManager/methods/partymanager_initialize.md)  
[PartyManager::CreateNewNetwork](../classes/PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md)  
[PartyLocalChatControl::SetTextToSpeechProfile](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md)  
[PartyLocalChatControl::SetTranscriptionOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md)
  
  
