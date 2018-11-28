---
title: Event History
author: v-thopra
description: How to access and utilize the Event History in PlayFab.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, playstream, events, event history
ms.localizationpriority: medium
---

# Event History

This tutorial shows you how to access and utilize the Event History in PlayFab.

> [!IMPORTANT]
> Before using this tutorial, make sure that you already have some recent events posted to your title. Otherwise, the event flow will render empty. Most PlayFab APIs will post PlayStream events, or you can post your own custom events. For an overview of automatic and custom events, see the [PlayStream Quickstart](playstream-quickstart.md).

## Access Event History

![Game Manager - Access Event History](media/tutorials/game-manager-access-event-history.png)  

1. Open the PlayFab Game Manager and select Analytics from the navigation sidebar.
2. Locate the tabs panel and select the Event History tab.

### Event History Page Overview

![Game Manager - Event History Page Overview](media/tutorials/game-manager-event-history-page-overview.png)  

#### Legend

1. Event Data Retention, this label shows the time interval for the events. For example, when it says "7 Days", only events that happened a week ago or later will be queried.
2. [Event Search Query Panel](../../analytics/metrics/real-time-analytics-event-search-query-panel.md), allows the changing of graph behavior and the filtering of event flow by different event properties.
3. [Event History Chart Panel](../../analytics/metrics/real-time-analytics-event-history-chart-panel.md), this chart shows the number and types of events happening in your title during the specified time interval.
4. [Events Timeline Panel](../../analytics/metrics/real-time-analytics-events-timeline-panel.md), this is a list of events data sorted by time (starting with the most recent).

### Search and inspect events

In this section we have the following goals:

1. Sign player in and produce a "player_logged_in" event.
2. Use the [Event Search Query Panel](../../analytics/metrics/real-time-analytics-event-search-query-panel.md) to find this event using search query.
3. Inspect this event using the [Events Timeline Panel](../../analytics/metrics/real-time-analytics-events-timeline-panel.md).
4. Observe how this event effects the [Event History Chart](../../analytics/metrics/real-time-analytics-event-history-chart-panel.md).

#### Demonstration

We are going to use the CustomID method to sign the player in and **produce** a "player_logged_in" event. 

Execute the following API call:

```csharp
PlayFabClientAPI.LoginWithCustomID(new LoginWithCustomIDRequest()
{
    CreateAccount = true,
    CustomId = "12345QWERY"
}, 
result => Debug.Log("Logged in"), 
error => Debug.LogError(error.GenerateErrorReport()));
```

If no player is registered with the given customID "12345QWERY", the player will be generated thanks to the second parameter that we passed: 

```csharp
CreateAccount = true
```

We now have to **locate** the event. The easiest way to do this is by means of the [Event Search Query Panel](../../analytics/metrics/real-time-analytics-event-search-query-panel.md). We know the custom ID, and we can use it as a search query:

![Game Manager - Event History Chart - Search Query](media/tutorials/game-manager-event-history-chart-search-query.png)  

Once you have located the event in the [Events Timeline Panel](
../../analytics/metrics/real-time-analytics-events-timeline-panel.md) you can further **inspect** it by clicking the timestamp label:

![Game Manager - Event History - Timestamp](media/tutorials/game-manager-event-history-timestamp.png)  

Finally, you may analyze how this event effects the overall event flow using the [Event History Chart](
../../analytics/metrics/real-time-analytics-event-history-chart-panel.md):

![Game Manager - Event History Chart - Event graph](media/tutorials/game-manager-event-history-event-graph.png)  

The graph shows the "player_logged_in" event being a part of several events (that match the current query) produced on May 5th.

### How to inspect player events

It is possible to access the Event History for a specific player:

![Game Manager - Inspect a Player Event](media/tutorials/game-manager-inspect-player-event.png)  

1. Use Game Manager and navigate to "Players" in the left-menu.
2. Select the "Players" tab.
3. Locate the player you want to inspect, and click the player ID label.
4. Select "Event History" from the toolbar.

You will be presented with an Event History page where only events related to the inspected player are shown.
