---
title: Integrating Experiments with other PlayFab services
author: yegarci
description: Gives details on how to integrate experiments with other PlayFab services.
ms.author: yegarci
ms.date: 11/20/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, experiments
ms.localizationpriority: medium
---

# Integrating Experiments with other PlayFab services 
The Experiments feature is compatible with Player Profile, PlayStream events, CloudScript and Insights Explorer. For example, you can:

- **Make configuration changes using CloudScript:** Virtually any configuration-related game code variation can be enabled using a combination of CloudScript and Experiment's getTreatmentAssignment API.
- **Make configuration changes using PlayStream events:** Use the [getTreatmentAssignment](/rest/api/playfab/experimentation/experimentation/get-treatment-assignment) API to trigger game configuration changes based on PlayStream events. 
- **Do a drill-down analysis using Insights Explorer:** A unique identifier of each variant (VariantID) is stamped on all PlayStream v2 events and two specific PlayStream v1 events (player_logged_in and player_realmoney_purchase). This can be used to do further analysis on specific metrics. (The metrics can be based on the PlayStream events or your own game telemetry.) To query, use the Insights Explorer service or connect your own analytics platform.

> [!WARNING]
> A new player login only has attributes associated with the [player_logged_in PlayStream](../../../api-references/events/player-logged-in.md) event. An experiment that targets a new player with PlayStream event-based configuration variations can only use attributes that are part of the player_logged_in PlayStream event. This ensures treatment assignment to the new players who have no PlayStream events associated yet.

## Next steps
* [Codeless experiments quickstart](quickstart.md)
* [Manage Experiments](manage-experiments.md)
* [Analyze Experiments](analyze-experiments.md)
* [Scorecard metrics](scorecard-metrics.md)
* [Experimentation APIs](experimentation-apis.md)
* [Prevent Interaction Effects with Exclusion Group](exclusion-groups.md)