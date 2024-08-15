---
title: Manage Experiments
author: yegarci
description: Demonstrates how to manage experiments.
ms.author: yegarci
ms.date: 11/20/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, experiments, experimentation
ms.localizationpriority: medium
---

# Manage Experiments

This article explains how to manage experiments and the meaning behind each status.

The Experiments’ overview (landing) page displays the available experiments categorized based on the status, which is **Running**, **Scheduled**, **Drafted**, **Completed**. 

The **Running** and **Scheduled** experiments are shown in a timeline view. Here the high-level details on each experiment are available, like the experiment's **Name**, number of **Variants**, **Start Date & Time**, **End Date & Time**. Interestingly, for an experiment in running state, one can also see a near-real-time metric of **Player Count** which gives insights into the number of players that were assigned to the experiment in the last 8 hours. 

The **Drafted** experiments are shown in the same ‘In-progress’ tab. Just below the timeline card view. 

The **Completed** experiments after their run completion are shown in the ‘Completed’ tab with details of the experiment's **Name**, number of **Variants**, **Start Date & Time**, **End Date & Time**.

The Experiments page can also be used to **manage experiments** by selecting on any experiments’ ellipsis. Here,
-	A scheduled experiment is automatically picked to run based on the configured schedule
  * The configuration's variations mapped in each variant of the experiment is enabled to the qualifying traffic immediately at random
-	A previously scheduled experiment can be started at any time before its start date, just select the ellipsis of the intended experiment from the list of scheduled experiments and Select Run. Different actions can be taken on experiments based on their state, and the action set comprises of **Run**, **Stop**, **Clone as draft**. More precisely,
    * Stop and Clone as draft of a running experiment
    * Run, Delete and Clone as draft of a scheduled experiment
    * Delete of a drafted experiment
    * Delete and Clone of a stopped/ completed experiment 

Note: One can also **Clone** an existing experiment from the experiment's edit configuration page, which allows further edits
- A scheduled and drafted experiment's fields are modifiable and vice-versa for a stopped/ completed experiment. Select on the ellipsis to make **Edit**. Although for any experiment in running state, only Experiment description and duration modifications are possible
- A running experiment status turns **Completed**, once the duration of the experiment is reached or a user explicitly stops the experiment

![Screenshot of Manage an Experiment](media/tutorials/manage-experiments-page.PNG "Manage an Experiment")

## Next steps
* [Codeless experiments quickstart](quickstart.md)
* [Analyze Experiments](analyze-experiments.md)
* [Scorecard metrics](scorecard-metrics.md)
* [Experimentation APIs](experimentation-apis.md)
* [Integrating Experiments with other PlayFab services](experiments-other-services.md)
* [Prevent Interaction Effects with Exclusion Group](exclusion-groups.md)