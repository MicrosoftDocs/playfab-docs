---
title: Constructing an Event History Search
author: v-thopra
description: Illustrates how to construct an Event History Search.
ms.author: v-thopra
ms.date: 01/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, event history
ms.localizationpriority: medium
---

# Constructing an Event History search

This tutorial illustrates how to construct an Event History search, the components of a search, and how to use elastic search syntax in your queries.

Let's start by looking at the final results of a successful search, displaying a comparison of how much money goes through each payment provider in the most recent week.

![Event History Chart - player-realmoney-purchase](media/tutorials/event-history-chart-player-realmoney-purchase.png)  

Searches are constructed from three fields:

- The **Query** field
- The **Group by** field
- The **Sum by** field

The first field to edit will usually be the Query field, which is constructed by selecting an event type, a start date, and an end date.

![Event Query - Event Type and Dates](media/tutorials/event-query-event-type-and-dates.png)  

By editing anything within the Event Type, Start Date, or End Date, the Query field itself will be constructed.

![Event Query Field - Date range](media/tutorials/event-query-field-date-range.png)  

At this point, the search will result in showing only [player_realmoney_purchase](https://api.playfab.com/playstream/events/player_realmoney_purchase) events, as shown below.

![Event History Chart - player-realmoney-purchase](media/tutorials/event-history-chart-player-realmoney-purchase.png)  

By default, **Group by** will aggregate events by their event type. Here, we are only querying for a *single* event type.

Instead, let's group by a property of the event. Looking at the [documentation for the event](https://api.playfab.com/playstream/events/player_realmoney_purchase), we can see that **paymentProvider** is a property.

![Event Query - Group by paymentProvider](media/tutorials/event-query-group-by-paymentprovider.png)  

Now, the chart shows the counts of how many events occurred for each group, as shown below.

![Event History Chart - Group by paymentProvider](media/tutorials/event-history-chart-group-by-paymentprovider.png)  

By default, **Sum by** will count the number of events per group. We can sum a property of the event instead. We could find a property by again looking at the [event documentation](https://api.playfab.com/playstream/events/player_realmoney_purchase).

There is another way to see the properties of the events - you query by looking at the event **JSON** itself.

We do this by selecting the **Show JSON** button to the left of the **Event name** column, as seen in the following screen capture.

![Event - Show JSON Button](media/tutorials/event-show-json-button.png)  

Now we can find for a value to compute with. Looking at the **JSON**, an appropriate value (a number value, not an ID) is **OrderTotal**.

![Event - JSON](media/tutorials/event-json.png)  

Let's set the **Sum by** to that value.

![Event Query - Sum by OrderTotal](media/tutorials/event-query-sum-by-ordertotal.png)  

After searching again, we can see that our chart is now what we want, as shown in the following example.

![Event History Chart - Sum by OrderTotal](media/tutorials/event-history-chart-sum-by-ordertotal.png)  

We could be done here, but there's one issue - If you want to *save* this search, the dates will still be the week of **Aug 25** to **Aug 31**!

We can do better by *manually editing* the Query field.

The constructed Query field uses elastic search syntax, meaning that you can use elastic search's features, such as Logical Operators (see the **AND** between **eventName** and **timestamp**) in your queries. Or, what we want here, [date math expressions](https://www.elastic.co/guide/en/elasticsearch/client/net-api/current/date-math-expressions.html).

We can directly substitute the dates in the Query field for relative dates, as indicated in the following example.

![Event Query Field - RElative dates](media/tutorials/event-query-field-relative-dates.png)  

Now, if we save the search...

![Event Query Field - Save search](media/tutorials/event-query-field-save-search.png)  

When you select the **Search** from your **Saved Searches** drop-down, your search will be reconstructed, and the dates will be relative to the current time.

![Event Query - Saved Searches Dropdown](media/tutorials/event-query-saved-searches-dropdown.png)
