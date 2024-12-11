---
title: PlayFab Party QoS measurements
description: The role of QoS measurements in PlayFab Party.
author: ScottMunroMS
ms.author: scmunro
ms.date: 04/15/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, qos, regions, accessible, chat
---

# PlayFab Party QoS measurements

PlayFab Party performs background Quality of Service (QoS) measurements to provide titles low-latency access to remote Azure resources. Here we'll outline the core scenarios where titles should expect to encounter Party's QoS features.

## Understanding when QoS is measured

The Party library begins measuring QoS as soon as Party is initialized. Once Party successfully measures QoS, the only way to refresh these measurements is to cleanup and re-initialize the Party library. If measuring QoS fails, the Party library will retry the measurement the next time you call [PartyManager::CreateNewNetwork](reference/classes/PartyManager/methods/partymanager_createnewnetwork.md).

## Selecting regions for Party networks

The primary reason PlayFab Party measures QoS is to enable titles to use latency data when selecting the Azure region in which a Party network is hosted.

Without waiting to inspect QoS measurement results, titles can call [PartyManager::CreateNewNetwork](reference/classes/PartyManager/methods/partymanager_createnewnetwork.md) with an empty list of preferred regions to allocate a network in the current lowest-latency region.

```cpp
uint32_t regionCount = 0;
const PartyRegion* regionList = nullptr;

PartyError error = PartyManager::GetSingleton().CreateNewNetwork(
    localUser,
    &networkConfiguration,
    regionCount,
    regionList,
    nullptr,
    nullptr,
    nullptr,
    nullptr);
```

Alternatively, titles can inspect the Party library's QoS measurement results and select a list of preferred regions based on title-specific criteria.

To inspect QoS measurement results, wait to receive a successful [PartyRegionsChangedStateChange](reference/structs/partyregionschangedstatechange.md) from [PartyManager::StartProcessingStateChanges](reference/classes/PartyManager/methods/partymanager_startprocessingstatechanges.md).

```cpp
switch (stateChange->stateChangeType)
{
    case PartyStateChangeType::RegionsChanged:
    {
        auto regionsChanged = static_cast<PartyRegionsChangedStateChange*>(stateChange);
        if (regionsChanged.result == PartyStateChangeResult::Succeeded)
        {
            m_qosResultsReady = true;
        }
    }

    // ...
}
```

Then call [PartyManager::GetRegions](reference/classes/PartyManager/methods/partymanager_getregions.md) to inspect and evaluate the current list of regions and latencies.

```cpp
if (m_qosResultsReady)
{
    uint32_t regionCount;
    const PartyRegion* regionList;

    PartyError error = PartyManager::GetSingleton().GetRegions(
        &regionCount,
        &regionList);
    if (PARTY_FAILED(error))
    {
        DEBUGLOG("PartyManager::GetRegions failed: %s\n", PartyManager::GetErrorMessage(error));
        return;
    }

    // Prevent Party from using Azure regions above some latency threshold.
    // The game is unplayable in those scenarios.
    std::vector<PartyRegion> filteredRegionList = OmitRegionsAboveMaxLatency(regionCount, regionList, maxLatency);

    error = PartyManager::GetSingleton().CreateNewNetwork(
        localUser,
        &networkConfiguration,
        filteredRegionList.size(),
        filteredRegionList.data(),
        nullptr,
        nullptr,
        nullptr,
        nullptr);
    if (PARTY_FAILED(error))
    {
        DEBUGLOG("PartyManager::CreateNewNetwork failed: %s\n", PartyManager::GetErrorMessage(error));
        return;
    }
```

### Regional price differences

Keep in mind that all Party regions are not charged equally. For information about regional price differences, see [our pricing page](https://playfab.com/pricing/).

## Using optimal regions for accessible chat features

The other reason PlayFab Party measures QoS is to enable more responsive chat accessibility features: text-to-speech synthesis, speech-to-text transcription, and translation. These accessibility features use regional Azure Cognitive Services resources, and measuring QoS enables optimal use of the different regions.

## Understanding failures to measure QoS

Because network creation and chat accessibility features rely on QoS measurements, it's valuable to inspect the result and error detail of the [PartyRegionsChangedStateChange](reference/structs/partyregionschangedstatechange.md). Failures in this state change may provide helpful debugging context for later failures.
