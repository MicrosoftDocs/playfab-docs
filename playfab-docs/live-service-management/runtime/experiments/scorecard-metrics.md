---
title: Scorecard metrics
author: yegarci
description: Provides descriptions for each scorecard metric.
ms.author: yegarci
ms.date: 11/20/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, experiments, experimentation
ms.localizationpriority: medium
---

# Scorecard metrics

PlayFab has preidentified a set of simple, effective, and actionable metrics for analysis of experiment results. These are tracked and categorized to measure impact on the acquisition, activation, retention, and revenue of the title. These are computed based on the player_logged_in and player_realmoney_purchase events. 

The identified metrics are calculated for the time the experiment ran so far based on the configured duration. The metrics are:  


| **Type**                    | **Metric**                              | **Description**                           |
|:---------------------------------- |:-----------------------------------|:-----------------------------------| 
| **Acquisition**        | Average Login Per User | Average number of times a user has logged in |
| **Activation**         | Payer Conversion Rate | Percentage of active users who made a purchase |
| **Revenue**            | Average Revenue Per User | Average amount of revenue generated per user, including users that didn't make any purchases |
| **Retention**          | Day N Retention (N = 1, 2, 3, 5, 7, 14, 21 day) |Percentage of users who logged in N days after seeing the experiment |

## Next steps
* [Codeless experiments quickstart](quickstart.md)
* [Manage Experiments](manage-experiments.md)
* [Analyze Experiments](analyze-experiments.md)
* [Experimentation APIs](experimentation-apis.md)
* [Integrating Experiments with other PlayFab services](experiments-other-services.md)
* [Prevent Interaction Effects with Exclusion Group](exclusion-groups.md)