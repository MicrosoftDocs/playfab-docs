---
title: Experiments Pricing
author: shikha-tarware
description: Demonstrates how to experiments pricing works.
ms.author: shtarwar
ms.date: 08/04/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, experiments pricing, experiments, experimentation 
ms.localizationpriority: medium
---

# Billing for PlayFab Experiments

This document describes how Experiments are metered and billed. In PlayFab's free Development mode, titles can use Experiments without a fee as long the aggregate number of player accounts is less than 100,000 (attempts to create additional player accounts will fail). For Live titles (on the pay-as-you-go model – Standard, Premium, or Enterprise), Experiments is billed under the [Insights credit system](../../../features/pricing/Meters/meters.md#insights) with no consumption limits. Insights credits are a virtual currency that allows all Insights services to be billed through a common value. Please note, Experiments service operation has no association with the performance characteristics control of Insights service.

The [billing summary page](../../../features/pricing/billingDetails.md) page provides a daily snapshot of your month-to-date estimate charges with Experiments service’s Insights credit as breakdown. Admin or billing permissions are required to view the Billing Summary page. The comprising factors, which account for the accrued Insights credits based on the consumption of the Experiments service are below. 

What factors contribute to the consumption billing for Experiments service under Insights meter?
The metering starts only during the run of an experiment and stops when the experiment is completed or stopped. There are three key factors used to bill additional Insights credit utilization for Experiments service. 
1.	Size of the target audience for treatment assignment. The participating audience of an experiment is either all the active players or is determined based on the selected Segment’s computation in a real-time manner. Also, the process of assignment and instrumentation of a treatment configuration is done by stamping variant IDs onto the player profile. So, the larger the target audience, the more resources are consumed, which results in higher Insights metering. 
2.	Computation of metrics. This is measured in analysis computation job minutes for each scorecard. This is variable and the determining factors are the set of metrics (that is, each metric’s definition and complexity) and the number of relevant Entity events (with type ‘player’) associated with the involved metric set. So, the larger the associated event set (PlayStream or Telemetry) for a metric set, the higher the Insights metering. Please note, currently, we support a predefined metric set, so there are only two events—player_logged_in and player_realmoney_purchase—for which the scorecard computation happens, and the events’ variable size could add to the computation job minutes. 
3.	Experiment duration. The longer the duration of an experiment, the higher the consumption of the Experiments service, which results in higher Insights metering. 

Please note, the [Experiment APIs](/rest/api/playfab/experimentation/experimentation) and [PlayStream events](../../../api-references/events/index.md) are accounted for outside of the Insights credit system. The Experiment APIs along with the Overrides assignment usage are accrued under the [profile read/ writes meters](../../../features/pricing/Meters/meters.md#profile). Also, the Experiments’ PlayStream events are accrued under the [events meters](../../../features/pricing/Meters/meters.md#events). 
