---
title: Experimentation
author: shtarwar
description: Demonstrates how to use experimentation.
ms.author: shtarwar
ms.date: 11/07/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, a/b testing, experimentation
ms.localizationpriority: medium
---

# Experimentation

> [!IMPORTANT]
> This improvised experimentation feature is currently in **Private Preview**. 
> It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development. 
> 
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com). 

## Overview

PlayFab’s Experimentation feature enables you to elevate the player experience by helping you identify the best strategies for your game via A/B experiment. It does so by helping you run multiple simultaneous trustworthy experiment and analysis. You can compare different versions of game configurations, pricing models, and outreach mechanisms to determine which is better in bringing conversions. This enables you to make data-informed decisions an area like your game’s roll-out strategy or feature changes of the game, ensuring that every change produces positive results.

### Capabilities of PlayFab’s Experimentation 

PlayFab’s Experiment is a tailored solution for A/B experimentation in gaming. It is powered by Microsoft’s scalable and reliable experiment and statistics computation platform. This feature empowers you in your A/B experiment journey by providing the following capabilities:

- Create, manage, and analyze A/B experiments via Game Manager or APIs. 
- Run multiple concurrent experiments 
- Target audience by making use of existing traffic. One can in-flight the experiment on specific audience by running experiment on a segment 
- Get reliable results of the experiment as scorecard. The scorecard is enriched, and detailed
- Support of end-to-end A/B experiment workflow with simple, easy-to-use APIs
- Integration into PlayFab’s though the player profile, cloud script and PlayFab Explorer

### PlayFab Experimentation at a Glance

![Screenshot of Experimentation at a Glance](media/tutorials/game-manager-new-ab-test.png/playFab-Experimentation-at-a-glance.png "Experimentation at a Glance")

PlayFab’s Experiments enables to run multiple concurrent experiments in random and controlled manner. In the process, 
- A unique identifier for each running experiment’s variant groups called variant ID is tagged to each player profile. These variant IDs enables you to assign different treatments via any client or server-side code
- Each variant group is supported and defined by variables. These variables are attributes on variant groups that allow you to bundle a different set of game experience via parameterization
- The computation of the experiment for reliable results takes care of statistical significance level
- Despite your best attempt to in-flight the traffic to suitable audience, there are certain cases where ratio of traffic allocation is way off. PlayFab’s experimentation feature flags such issues enabling you to run reliable experiment 

## Quick Start

### Create an Experiment

An experiment is created to compare a control variant against one or more treatment variant (up to 9). The experiment is controlled and managed as the target audience is as per the user-input. 

From the Game Manager, 	
- Navigate to your Title 
- Select Experimentation from the menu on the left 
- Click on New A/B Experiment, experiment configuration page is opened 
- Enter Experiment Name, Description, Duration and Flight to Population % 
- Under Settings, define the Control Variant and Treatment Variant 
  * Each variant is supported and defined by Variables (up to 10). These variables are attributes on variant groups that allow you to bundle different set of user-experience via parameterization. This variable parametrization configures the feature settings for variants without deploying new code. This allows you to iterate faster on changes and make fixes and updates to live games. It is recommended to have name variable name in each of the variant group as a best practice of experimentation  
  * A/B Experimentation is a controlled experiment, hence, a weight % determines the traffic ratio to be in-flighted for target audience. Ideally, a ratio of 1:1 is recommended  
  * An experiment can be configured to run on a Segment
- Click Save Experiment or Save and Run Experiment 
  * With Save Experiment the experiment will be in Drafted status in the manage experiment page
  * With Save and Run Experiment the experiment will be in Running status in the manage experiment page 

![Screenshot of Experimentation at a Glance](media/tutorials/game-manager-new-ab-test.png/create_edit-an-experiment.JPG "Create an Experiment")

### Manage Experiment

One can modify an experiment when it is in drafted status. Each field is modifiable. Although, for any experiment in running state, no modification is possible.

- To start the experiment, select the desired experiment from the list of drafted experiment and click ‘Start’
  * The experience/ behavior in each variant of experiment is in-flighted to the qualifying traffic immediately at random 
  * A few other actions can be taken in an experiment, like, ‘Clone’, ‘Rerun’, ‘Delete’. The applicability and availability of the option is based on the state the experiment

![Screenshot of Experimentation at a Glance](media/tutorials/game-manager-new-ab-test.png/manage-an-experiment.JPG "Manage an Experiment")

### Analyze Experiment  

Experiments results will be showed in a scorecard which is generated in a regular and near-real-time cadence. The cadence is 12 hours, 1 day, 2 day, 3 day, 5 day, 7 day, 14 day, 21 day.

From the manage experiment page, click on the **View Scorecard** link 

At the run, 
 * If an issue of Statistical Ratio Mismatch (SRM) is identified, then it is flagged to the user for investigation
  * SRM indicates sampling bias in the randomization which leads to the options of resolving bugs (if any), wait till certain duration of the experiment for auto-resolution or immediately stop the experiment based on the estimated impact 

At completion,   
 * Th overall statistical computation of each metric is available for analysis

![Screenshot of Experimentation at a Glance](media/tutorials/game-manager-new-ab-test.png/manage-an-experiment.JPG "Manage an Experiment")