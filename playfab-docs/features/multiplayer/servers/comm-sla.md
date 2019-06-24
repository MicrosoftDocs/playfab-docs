---
title: PlayFab incident response procedures
author: chpalm
description: Describes how customers can raise incidents and how PlayFab communicates status during incident mitigation.
ms.author: chpalm
ms.date: 06/12/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, outages, incidents, mitigation
ms.localizationpriority: medium
---

# PlayFab incident response procedures

PlayFab is committed to the reliable operation of our services 24/7. However, incidents do occur. This page describes how you can raise incidents to our attention and how PlayFab communicates our status during incident mitigation. 

## Paging PlayFab

If you are a PlayFab enterprise customer, you will have been provided a confidential email address to alert us to any urgent issues. This email inbox pages our engineering team 24/7, and you will be provided an acknowledgement within 30 minutes of email receipt. 

## Ongoing communication of incidents

PlayFab’s communication procedures vary depending on the severity of the incident. The taxonomy we use to assess incident severity is shown in the table below: 

|Severity|PlayFab Status Label|Description| Response Expectation |
|-|-|-|-|
|1|Critical |Critial outage across multiple systems. These are exceptionally rare outages that impact multiple PlayFab systems and a wide swatch of player activity. For example, an inability to log-in or create entity tokens. | Worked 24x7 until resolved. Initial Response in 15 minutes or less. External Communication in <20 minutes.|
|2| Major |	These outages impact a limited set of PlayFab sub-systems but are causing player-facing impact for a wide swatch of customers. |	Worked 24x7 until resolved. Initial Response in 15 minutess or less. External Communication in <20 minutes.|
|3|	Degradation |	These incidents are impacting players but are limited to a specific region or not typically fatal to the gameplay experience.	| Worked 24x7 until resolved. Initial Response in 30 minutes or less. External Communication in <60 minutes.

> [!NOTE]
> The **Status Labels** listed in the table are the ones used on our System Status site [status.playfab.com](https://status.playfab.com/).

Severity 1 and 2 outages will be reported as a Major Outage on status.playfab.com. On-going updates will be provided every 30 minutes through status.playfab.com, Slack, and Teams.

Severity 3 outages will be reported as a Degradation on status.playfab.com, with on-going updates every 60 minutes. These incidents are not communicated through Slack or Teams. 

In some cases, PlayFab may detect that a Severity 2 or Severity 3 outage is occurring but only impacting one or two titles. In these situations, we will not post to status.playfab.com. Instead, we will post to your specific Slack or Teams channel and provide updates every 30-60 minutes.
