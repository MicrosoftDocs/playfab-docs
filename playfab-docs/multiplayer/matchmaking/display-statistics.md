---
title: Displaying queue statistics in your title
author: keithrkline
description: Tutorial on how to use queue statistics
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, tutorial
ms.localizationpriority: medium
---

# Displaying queue statistics in your title

Titles may sometimes wish to show how active their queues are, in an effort to set user expectations for wait times. They may retrieve these statistics and display them directly to the user, or perhaps retrieve these statistics from a server to display or collect approximated telemetry as they wish. This tutorial shows the steps for retrieving these statistics from matchmaking.

## Configure your queue

First, decide if you should configure your queue to allow statistics to be retrieved by users. Servers may always retrieve statistics for each queue. Users may retrieve statistics only if the queue configuration has the **Show the
number of players matching** and/or **Show the time to match statistics** settings
checked.

An example of a queue with this configuration can be found in the
[Matchmaking Configuration Examples](config-examples.md#enabling-statistics).

## Retrieving statistics

Call the [GetQueueStatistics
](xref:titleid.playfabapi.com.multiplayer.matchmaking.getqueuestatistics) API
to retrieve the statistics. These values are aggregated and updated over time.
For this reason, the `GetQueueStatistics` API should only be called
intermittently. It is not intended to provide real-time tracking of a queue's
statistics.