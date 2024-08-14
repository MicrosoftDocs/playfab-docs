---
title: Experiments Quickstart
author: shikha-tarware
description: Demonstrates how to use experimentation.
ms.author: shtarwar
ms.date: 08/03/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, a/b testing, experiments, experimentation 
ms.localizationpriority: medium
---

# Codeless experiments quickstart
Learn to create an experiment on PlayFab's Game Manager to help you gain more insights on your customers.

## Create an Experiment

An experiment is created to compare a control variant against one or more treatment variants (up to 9). The experiment is managed through a target audience controlled by the user.

From the Game Manager:
1. Navigate to your **Title**
1. Select **Experiments** from the menu on the left
1. Select **New Experiment**, experiment configuration page is opened
1. Enter **Experiment Name**, **Description**, **Start Date & Time**, **Duration** (up to 90 days)
1. Select your target **Audience** for the experiment. By default, the experiment's audience is **“Run across all title players”**
1. Configure to run the experiment on a Segment by selecting the radio button **“Select player segment”** and select on the drop-down 
    - (Optional) Under **Exclusion Group**, select exclusion group from the drop-down list of the existing **Exclusion group name** and enter **% traffic allocation to**, to run a mutually exclusive experiment
1.	Under **Variants**, define the **Control Variant** and **Treatment Variant(s)**
    *	Enter **Variant name** and **Description** 
    * Each variant is supported and defined by **Variables** (up to 10) and **Overrides**
      * The variables are attributes on variant groups that allow you to bundle different sets of user-experience via parameterization
      * This variable parameterization configures the feature settings for variants without deploying new code. This allows you to iterate faster on changes and make fixes and updates to live games. It's recommended to have the same variable name in each of the variant group as part of best practices of experimentation
      * The overrides are attributes on variant groups that allow you to bundle different sets of configurations of PlayFab services via parameterization, that is, no game code is required. Currently, overrides are available for title data remote configuration service only 
    * Each variant is associated with the **% of target audience**. For a controlled experiment, it determines the traffic stream and instrumentation of variants
      * Sufficient traffic is required to make the changes from your experiments more detectable. An experiment with equal traffic in each variant has the best ability to detect a change
      * For concurrent experiments using overrides, it's recommended to experiment on a mutually exclusive target audience 
- Select **Schedule**, **Save as Draft**, or **Run Now**
  *	With Schedule, the experiment is in **Scheduled** status in the experiments overview and timeline page  
  *	With Save as Draft, the experiment is in the **Draft** status in the experiments overview and timeline page  
  *	With Run Now, the experiment is in **Running** status in the experiments overview and timeline page  

![Screenshot of Create an Experiment](media/tutorials/create-experiment-with-exclsuion-group-and-overrides.PNG "Create an Experiment")

## Next steps
* [Manage Experiments](manage-experiments.md)
* [Analyze Experiments](analyze-experiments.md)
* [Scorecard metrics](scorecard-metrics.md)
* [Experimentation APIs](experimentation-apis.md)
* [Integrating Experiments with other PlayFab services](experiments-other-services.md)
* [Prevent Interaction Effects with Exclusion Group](exclusion-groups.md)