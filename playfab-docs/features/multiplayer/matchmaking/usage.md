---
title: Analyzing Your Matchmaking Queue Usage 
author: joelwi 
description: Describes how developers can use the Matchmaking Usage Charts 
ms.author: kkline 
ms.date: 03/30/2020
ms.topic: article 
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, usage, telemetry
ms.localizationpriority: medium
---

# Matchmaking Queue Usage

PlayFab matchmaking provides charts that help developers understand their
customer's matchmaking usage patterns.  The Matchmaking Usage view can be
accessed within the GameManager portal under the Muliplayer->Matchmaking tab.
Once a specific queue is selected, there will appear a "Usage" sub tab adjacent
to the "Edit Queue" sub tab.  As long as matchmaking activity is occuring in
that queue, selecting the Usage tab will render various charts that depict
matchmaking activity (or possibly lack thereof) within it.

![Matchmaking Usage](media/matchusage.png)


## Charts

Each of the charts described below can render data over the past hour,  4 hours,
day, 3 days, week, or month (4 weeks).  To change the time window, click the
time duration dropdown and select a different time window.  All graphs will
render using the same time window.

### Average Matchmaking Time

This chart shows how long it takes for a match to be found in this matchmaking
queue.  If the time seems to take longer than expected, it's worth re-examining
the rules for this queue to see if those rules are overly restrictive resulting
in longer matchmaking times.  It also is worth looking at the other charts to
see how active this queue is and if other issues may be preventing timely
matches.

> Y-Axis: seconds

### Average Time to Cancel a Ticket

This chart shows how long it takes to cancel a ticket.  Tickets can be canceled
by the matchmaking service or by players.  This graph can be used in conjuction
with the Canceled Ticket Rate graph to better understand not only how long
tickets take to be canceled, but what is driving those cancellations and how
many of each cancellation type is happening.

> Y-Axis: seconds

### Match Completion Rate

This chart shows how frequently matches are found for players in that
matchmaking queue.  If the rate is lower than expected or bouncing off of zero,
that may indicate either an issue with the matchmaking service, or how the
matchmaking queue rules are configured.  This graph can be used in conjunction
with the "Average Matchmaking Time" graph to acertain how successfully matches
in this queue are occuring (or not).  

> Y-Axis: # of completed matches /sec

### Canceled Ticket Rate

This chart shows the rate of ticket cancellations within this matchmaking queue,
and also shows what cancellation types are occuring by kind. If matches are not
happening as quickly or frequently as expected, this graph may indicate a higher
than expected rate of ticket cancellations that is hindering the
matchmaking process.

#### Cancellation Types

Each of the ticket cancellation types is listed below, along with its purpose
and what entity initiated it.

| Cancellation Type   | Description | Origin |
|---------------------|-------------|----------------|
| Requested | A user manually canceled a ticket from this queue's matchmaking process. | User |
| Timeout | The matchmaking process for this ticket exceeded its maximum configured time to find a match. | Server |
| TicketUnmatchable | The ticket in this queue will never find a match based on its current queue rules. | Server |
| ServerAllocationFailed | A match was successfully created, but for some reason could not be allocated to a PlayFab server. | Server |
| Internal | An unknown internal error occurred. If these errors occur often, please contact support. | Server |

> Y-Axis: ticket cancellations /sec

### Tickets Waiting for a Match

This chart shows how many tickets are still waiting to be matched with other
tickets in that queue.  If this number is low, it may indicate that the
matchmaking queue is not popular with users, but alternatively could indicate
that new matches are occuring very quickly in this queue.  If this number is
high, it is worth looking at the "Average Matchmaking Time" graph to see if the
high number is related to a slow matchmaking process in this queue, or if this
queue is merely popular with players.

> Y-Axis: # of waiting tickets

## Other Common Issues Identified with Matchmaking Usage Data

As mentioned in some of the chart descriptions above, charts can be used and
cross-referenced to pinpoint issues with matchmaking queues.  The following
table suggests how to use one or more charts to quickly diagnose common problems.

| Issue   | Probable Meaning |
|---------------------|-------------|----------------|
| Zero or erratic match completion rate | Queue configured incorrectly, queue doesn't match with title |
| Low match completion rate, long matchmaking times | Queue rules are too restrictive |
| High match completion rate, high ticket cancellation rate | Quitters, unsatisfactory matches |