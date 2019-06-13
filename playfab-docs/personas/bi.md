---
title: Getting Started for Business Intelligence
author: mawillia
description: Understanding how to use PlayFab for a Business Intelligence Persona
ms.author: mawillia
ms.date: 11/16/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports
ms.localizationpriority: medium
---

# Getting started with business intelligence

Getting to know your players and their behavioral patterns in your game is critical to increasing retention, engagement and monetization.

The goal of this document is to help you get up to speed on how PlayFab empowers your business intelligence, and to quickly immerse you in the tool sets that we provide.

> [!NOTE]
> Before you can use Game Manager for your title, you need to create a [PlayFab Developer Account](pfab-account.md). 

In general, you can analyze what players are doing in your game by following their event patterns. In PlayFab, these come from PlayStream events.

PlayStream is an event processing system that unifies the entire data flow from your game into a single event stream. You can then visualize and take actions on that stream in real time.

<img alt="Analytic Dashboards" src="images/analytics-dashboard.png" width="500" />

## Getting to know your players through Game Manager

Real time events are amazing and actionable. But sometimes you need to perform deeper analytics over a period of time to get retention - or a better understanding of how your players are engaging with your game.

For this, we offer a variety of solutions. Let's begin by talking about our built-in tools in Game Manager, which  is our online portal to your game title.

You can learn more about [Game Manager here](../features/config/gamemanager/quickstart.md).

In Game Manager, you can search for events, view reports, and look at specific data about each player and their actions.

Here are some resources to get you started with the Event Viewer:

- [Real-Time Analytics: Core Concepts](../features/analytics/metrics/real-time-analytics-core-concepts.md) - Gives you precise insights into what is going on inside your game.
- [Constructing Event History Searches](../features/analytics/metrics/constructing-an-event-history-search.md) - Illustrates how to construct an event history search, the components of a search, and how to use elastic search syntax in your queries.
- [Built in Analytic Reports](../features/analytics/reports/quickstart.md) - Gets reports on daily, monthly and rolling overviews, track retention and conversion reports, and view reports on your top spenders and purchases.

<img alt="Analytic Reporting" src="images/analytics-reports.png" width="500" />

## Getting to know your players outside of Game Manager

While PlayFab provides some awesome tools for getting to know your players, sometimes you may need a *bit more* customization.

PlayFab has a number of ways to reach your data outside of our Game Manager tool set. For this, we offer several ways to export data into various systems.

Here are a few great ways to access your data:

- [S3 Event Archiving](../features/analytics/metrics/s3-event-archiving.md) – PlayFab allows you to archive the entire event flow by using an Amazon S3 bucket. This guide shows step-by-step how to configure event archiving from scratch.

- **Snowflake** – See the entire event flow in Snowflake, for deep analytics query power.
- [Webhooks](../features/analytics/metrics/webhooks.md) - In complex systems you may want to provide additional event handling on your custom server. PlayFab offers Webhooks to achieve this. Whenever a new event is detected, it can be forwarded to your server by making a POST request to your custom web endpoint, and the event data is passed as the JSON body of the request.
- **PlayFab Insights** (preview) - PlayFab Insights is a premium PlayFab offering that provides a central repository for your data, whether it's generated from our services or imported from an external source.