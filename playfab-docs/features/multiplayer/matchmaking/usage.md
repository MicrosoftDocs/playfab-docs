---
title: Matchmaking Usage author: joelwi description: Describes how developers
can use the Matchmaking Usage charts ms.author: multiplayer ms.date: 03/28/2020
ms.topic: article ms.prod: playfab keywords: playfab, multiplayer, matchmaking,
match, usage, telemetry ms.localizationpriority: medium
---

# Matchmaking Usage

PlayFab matchmaking provides some graphical charts that attempt to help
developers understand how their customers are using their matchmaking features
of their game.  Each chart shows a different aspect to how data is flowing
through each matchmaking queue over a period of time, ranging from the past hour
up to the past 28 days.  The Machmaking Usage view can be accessed within the
GameManager portal under the Muliplayer->Matchmaking tab.  Once a specific queue
is selected, there will appear a "Usage" sub tab adjacent to the "Edit Queue"
sub tab.  As long as matchmaking activity is occuring in that queue, selecting
the Usage tab will render various charts that depict matchmaking activity (or
possibly lack thereof) within it.

## Charts

Each of the charts described below can render data over the past hour,  4 hours,
day, 3 days, week, or month (4 weeks).  To change the time window, click the
time duration dropdown and select a different time window.  All graphs will
render using the same time window.

### Average Matchmaking Time

This chart shows how long it takes for a match to be found in this matchmaking
queue.  If the time seems to take longer than expected, its worth re-examining
the rules for this queue to see if those rules are perhaps a bit too
restrictive.  It also is worth looking at the other charts to see how active
this queue is and if potentially other issues may be preventing timely matches.

> Y-Axis: seconds

### Average Time to Cancel a Ticket

This chart shows how long it takes to cancel a ticket.  Tickets can be canceled
by the matchmaking service or by players.  This graph can be used in conjuction
with the Cancelled Ticket Rate graph to better understand not only how long
tickets take to be canceled, but what is driving those cancelations and how many
of each cancelation type is happening.

> Y-Axis: seconds

### Match Completion Rate

This chart informs developers how frequently matches are found for players in
that matchmaking queue.  If the rate is lower than expected or bouncing off of
zero, that may indicate either an issue with the matchmaking service, or how the
matchmaking queue is currently configured.  This graph can be used in
conjunction with the "Average Matchmaking Time" graph to acertain how
successfully matches in this queue are occuring (or not).  

> Y-Axis: # of completed matches /sec

### Canceled Ticket Rate

The Canceled Ticket Rate chart shows the rate of ticket cancelations within this
matchmaking queue, and also shows what cancelation types are occuring by kind.
If matches are not happening as quickly or frequently as expected, this graph
may indicate a higher than expected rate of ticket cancelations by reason, and
may assist understanding what is hindering succesful matchmaking efforts.

> Y-Axis: Cancellations /sec

### Tickets Waiting for a Match

This queue depicts how many tickets are still in the queue waiting to be matched
with other tickets in that queue.  If this number is low, it may indicate that
the matchmaking queue is not popular with users, but alternatively could
indicate that new matches are occuring very quickly in this queue.  If this
number is high, it is worth looking at the "Average Matchmaking Time" graph to
see if the high number is related to a slow matchmaking process in this queue,
or if this queue is merely popular with players.

> Y-Axis: # of Tickets Waiting for a Match