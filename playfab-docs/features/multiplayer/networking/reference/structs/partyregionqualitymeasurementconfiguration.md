---
author: jdeweyMSFT
title: "PartyRegionQualityMeasurementConfiguration"
description: "The configuration used by the Party library to control region quality measurement behavior."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
---

# PartyRegionQualityMeasurementConfiguration  

The configuration used by the Party library to control region quality measurement behavior.  

## Syntax  
  
```cpp
struct PartyRegionQualityMeasurementConfiguration {  
    uint32_t totalMeasurementTimeoutInMilliseconds;  
    uint16_t highLatencyHintInMilliseconds;  
    uint16_t minRequiredSuccessfulResponses;  
    uint16_t idealNumberOfSuccessfulResponses;  
    uint16_t maxRetriesWithNoResponse;  
    uint16_t maxTimeoutsAfterResponse;  
}  
```
  
### Members  
  
**`totalMeasurementTimeoutInMilliseconds`** &nbsp; uint32_t  
  
The maximum number of milliseconds to allow for resolving hostnames and attempting to measure networking conditions between the local device and PlayFab Quality of Service beacon servers.
  
This value controls the maximum allowed time, in milliseconds, for the Party library to resolve the PlayFab Quality of Service beacon server hostnames for all available regions and to send lightweight messages to measure connection quality to them. If environmental issues cause slow name resolution or high latency/packet loss to some regions, then only those regions that were successfully contacted at least once within this timeout are reported in the [PartyRegionsChangedStateChange](partyregionschangedstatechange.md) result. <br /><br /> This value does not include or affect the time it takes for the Party library to retrieve the list of available regions from the PlayFab service.   <br /><br /> Applications should typically define this timeout in terms of user experience goals/worst cases rather than attempting to derive some number based on technical assumptions. The exact amount of time required to measure any given region or all regions can vary greatly depending on factors like the number of available regions, the current networking environment conditions, the Party library's dynamically tuned timeouts based on observed latency, and more.   <br /><br /> This value is effectively a worst case timeout for devices that experience complete or partial failures. This may be useful to contrast with real-world observations of typical successes. Using the default PartyRegionQualityMeasurementConfiguration values, region availability, and player usage patterns, the Party library currently observes that most devices worldwide complete the entire measurement process successfully in 2.3 seconds or less, and 97% of devices successfully complete in less than 6 seconds. This duration is expected to increase slightly over time as more regions are introduced.   <br /><br /> The default value is 15000 (15 seconds) when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.   <br /><br /> A value of zero means there's no timeout, and all measurements are therefore allowed to complete regardless of how long any regions take to succeed or fail. Otherwise, the minimum value is 50 milliseconds.
  
**`highLatencyHintInMilliseconds`** &nbsp; uint16_t  
  
A hint indicating the highest latency threshold, in milliseconds, above which the application deems a region to be too latent to spend additional time performing detailed measurement.
  
This target value represents a soft upper limit for region latency. It doesn't directly prevent including regions measured to have higher latency, but it does cause the Party library to choose timeout and retry values optimized for regions with less latency than this number. It's also inspected for each region after the minimum number of responses (configured in the *minRequiredSuccessfulResponses* field) is received. If the median measured latency for a region is greater than this target, then the ideal number of responses (configured in the *idealNumberOfSuccessfulResponses* field) isn't used and no more measurement attempts are sent. <br /><br /> This value can't be zero.   <br /><br /> The default value is 200 when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.
  
**`minRequiredSuccessfulResponses`** &nbsp; uint16_t  
  
The minimum number of successful measurement message responses needed for each region for basic evaluation.
  
Each potential region to be measured is expected to respond successfully at least this many times during the quality measurement lightweight message exchange before results are considered accurate enough to evaluate against the *highLatencyHintInMilliseconds* field target latency. Setting larger minimum requirements results in more measurement samples, and therefore more consistency and accuracy in the face of any outlier packet fluctuations, at the expense of taking more time to complete. <br /><br /> Even without sufficient successful responses, measuring a particular region is considered complete if any of the following occur: no successful responses arrive at all and the number of attempts exceeds the value configured in the *maxRetriesWithNoResponse* field, at least one response arrived and the number of attempts exceeds the value configured in the *maxTimeoutsAfterResponse* field, or the overall timeout for all regions configured in the *totalMeasurementTimeoutInMilliseconds* field elapses.   <br /><br /> This value can't be zero.   <br /><br /> The default value is 3 when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.   <br /><br />
  
**`idealNumberOfSuccessfulResponses`** &nbsp; uint16_t  
  
The number of successful measurement message responses desired for each region in order to achieve thorough evaluation.
  
This value represents the total preferred number of successful responses to achieve the desired accuracy in latency measurements for regions of interest. This value must be the same or higher than the minimum value in the *minRequiredSuccessfulResponses* field. The Party library only attempts to obtain the additional response count difference between the minimum and this ideal value for a region if that region was already measured to have a median latency less than or equal to the threshold configured in the *highLatencyHintInMilliseconds* field. This field's ideal number of responses allows continuing to refine measurement accuracy for regions likely to be of more value to the local device without also spending that additional time for the higher latency regions. <br /><br /> If the minimum number of responses for a region wasn't obtained, then this additional ideal target isn't attempted. Otherwise, if the *maxTimeoutsAfterResponse* limit for the region is reached or the overall *totalMeasurementTimeoutInMilliseconds* field timeout for all regions elapses, then measuring the region is considered complete even without receiving this ideal number of successful responses.   <br /><br /> The default value is 4 when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.
  
**`maxRetriesWithNoResponse`** &nbsp; uint16_t  
  
The maximum number of additional times to resend an initial measurement message to a region without any responses before considering the region unreachable.
  
This value configures the total number of additional attempts beyond the first that the Party library makes when retrying the first quality measurement lightweight message to a region before considering that region unavailable. If at least one successful response is received from the region's Quality of Service beacon server, then this maximum is no longer used and instead the *maxTimeoutsAfterResponse* field governs the number of attempts allowed to time out. <br /><br /> Larger maximum retry values are more tolerant of temporary environmental issues such as packet loss, at the expense of taking longer to abandon unreachable regions. The absolute maximum time permitted for measuring all regions is capped by the separate *totalMeasurementTimeoutInMilliseconds* field value.   <br /><br /> The default value is 3 when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.
  
**`maxTimeoutsAfterResponse`** &nbsp; uint16_t  
  
The maximum number of measurement message attempts allowed to time out for a region that has previously responded before considering the networking path too unreliable to continue measuring.
  
If at least one successful response has been received from a region's Quality of Service beacon server, this value determines the total number of timed-out attempts the Party library will permit while trying to obtain *minRequiredSuccessfulResponses* and *idealNumberOfSuccessfulResponses* measurement results for the region. <br /><br /> Larger maximum timeout values are more tolerant of temporary environmental issues such as packet loss, at the expense of potentially taking longer to finish measuring regions with those poor quality characteristics. The absolute maximum time permitted for measuring all regions is capped by the separate *totalMeasurementTimeoutInMilliseconds* field value.   <br /><br /> The default value is 3 when [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) hasn't been configured.
  
## Remarks  
  
This structure can be used together with [PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md) to either override or query the Party library's current configuration via [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) or [PartyManager::GetOption()](../classes/PartyManager/methods/partymanager_getoption.md) respectively. It configures the low-level behavior of the region quality measurement process associated with [PartyRegionsChangedStateChange](partyregionschangedstatechange.md) state changes.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyOption::RegionQualityMeasurementConfiguration](../enums/partyoption.md)  
[PartyRegionsChangedStateChange](partyregionschangedstatechange.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md)
  
  
