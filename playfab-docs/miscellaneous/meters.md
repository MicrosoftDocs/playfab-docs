---
title: Meters
author: tcrawf23
description: Describes each of the meters in the new pricing model.
ms.author: tcrawf23
ms.date: 08/30/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing, meter, meters
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# Meters
> [!WARNING]
> This page is a WiP - all warning blocks either have open questions or other notes that will be removed in the final version

In the new pricing model, instead of being billed on a single MAU (monthly active users) meter, customers in the Pay-As-You-Go Plan are billed on a set of consumption-based meters. This page outlines and defines the full set of PlayFab's billable meters. For more information on the new pricing model, you can learn more on our [New Pricing Model](https://www.playfab.com) page.

> [!NOTE]
> This page does not include Add-ons like Community Sift, Snowflake, or Photon, and is subject to change as new services and capabilities are added to the PlayFab platform

## Players
These are the set of meters that enable the core functionality in PlayFab - personlizing for the player.

### Custom Events
The number of custom PlayStream events processed over the course of the calendar month. If the average size of events during the month exceeds 1KB per event, then the effective number of events will be proportionally based on the average size in KBs. This meter excludes telemetry events and standard PlayStream events

> [!NOTE]
> The size of the event is uncompressed and only includes the payload

These APIs can create custom events:
* PlayStream Events
  * [Write Events](xref:titleid.playfabapi.com.events.playstreamevents.writeevents)
* Analytics
  * Write Title Event
    * [Client](xref:titleid.playfabapi.com.client.analytics.writetitleevent)
    * [Server](xref:titleid.playfabapi.com.server.analytics.writetitleevent)
  * Write Player Event
    * [Client](xref:titleid.playfabapi.com.client.analytics.writeplayerevent)
    * [Server](xref:titleid.playfabapi.com.server.analytics.writeplayerevent)
  * Write Character Event
    * [Client](xref:titleid.playfabapi.com.client.analytics.writecharacterevent)
    * [Server](xref:titleid.playfabapi.com.server.analytics.writecharacterevent)


#### Example
Let's take a look at a sample title's API calls for the previous month:

API Name | Event Name | Count
--- | --- | :---:
/event/writeevents | player_leveled_up | 70
/client/writeplayerevent | player_bought_item | 30
/event/writetelemetryevents | player_started_multiplayer | 100
/client/updateuserdata | player_statistic_changed | 30
/client/executecloudscript | player_executed_cloudscript | 20

Of these API calls, only the first two will spin the Custom Events meter, as the third is a telemetry event, and the last two are standard events. Now let's look at the total size for each of these event types:

Event Name | Count | Size
--- | :---: | :---:
player_leveled_up | 70 | 90KB
player_bought_item | 30 | 20KB

By adding up the total size (110KB) and dividing by the total count (100), we get an average size of 1.1KB. Therefore, we need to multiply the total count by 1.1 to get the effective count of 110 Custom Events. Let's look at the same example with some adjusted numbers:

Event Name | Count | Size
--- | :---: | :---:
player_leveled_up | 70 | 80KB
player_bought_item | 30 | 10KB

By adding up the total size (90KB) and dividing by the total count (100), we get an average size of 0.9KB. Therefore, we don't multiply the total count by anything - we stick with 100 Custom Events, even though the *player_leveled_up* custom event had an average size larger than 1KB.


### Updates
The number of writes to profile data over the course of the calendar month. If the average size of data written to custom fields during the month exceeds X KB per udpate, then the effective number of updates for custom fields will be proportionally based on the average size in KBs. Writes to standard profile fields will always count as a single update.

> [!WARNING] 
> **Question:** What should the average size be?
> 
> **Question:** Should updates include all updates across a title (everything in Entities), or only the player profile?

> [!NOTE]
> A single API call can trigger multiple write operations, resulting in many updates. You can learn more on our [API to Number of Updates](https://www.playfab.com) page.

> [!WARNING]
> Based on the [Player Profile](xref:titleid.playfabapi.com.events.datatypes.playerprofile) docs page, will a player login result in 6 updates?

#### Example
Let's take a look at a sample title's updates for the previous month:

Field Name | Count
--- | :---:
LastLogin | 100
Statistics | 80
Tags | 20
Created | 10

Statistics is the only custom field in the player profile - the other three fields are standard, which means we simply add up the count on those to get 130 Updates. Now let's look at the total size for the statistics Updates:

Field Name | Count | Size
--- | :---: | :---:
Statistics | 80 | 120KB

By adding up the total size (120KB) and dividing by the total count (80), we get an average size of 1.5KB. Therefore, we need to multiply the total count by 1.5 to get the effective count of 120 Updates. Adding this to our standard fields count (130), we get a total count of 250 Updates. Let's look at the same example with some adjusted numbers:

Event Name | Count | Size
--- | :---: | :---:
Statistics | 80 | 60KB

By adding up the total size (60KB) and dividing by the total count (80), we get an average size of 0.75KB. Therefore, we don't multiply the total count by anything - we stick with 80 Updates. Adding this to our standard fields count (130), we get a total count of 210 Updates.


## Infrastructure
These are the IaaS meters that many of the PlayFab services and capabilities leverage. These meters are the total from multiple different sources.

### Network Egress
The total volume of data sent out of our servers to the clients over the course of the calendar month. There are multiple sources that contribute to this meter:
* **API Call Volume** - the total response size across all APIs
* **Multiplayer Servers** - the volume of data transmitted by your game servers to the Internet

> [!WARNING]
> **Question:** Where do all the API responses come from? Do we need to split out be Zones? (MPS has 3 zones)


### Storage
The average volume of data at-rest over the course of the calendar month. The average is calculated by taking hourly snapshots of the total volume of  data and then taking the mean across those snapshots. There are multiple sources that contribute to this meter:
* **Profile Data** - this includes Title Data, Player Data, Inventory Data, Groups Data, Catalog Data, and all Entity Data
* **Insights** - the total volume of data held in Azure Data Explorer’s binary format atop Azure Blob storage containers


## CloudScript
CloudScript allows developers to define custom logic and workflows with triggers and/or schedules to enable powerful and personalized experiences for players. These are the meters that CloudScript is billed off of.

### Execution Time
The per-second resource consumption across all executions over the course of the calendar month, measured in GB-s (average memory size in GBs * total execution time in milliseconds)

> [!NOTE]
> The minimum memory size and execution time per execution is 128MB and 1ms, respectively


### Total Executions
The total number of executions over the course of the calendar month


## Frequently Asked Questions (FAQs)
**How will limit upgrades work in this new pricing model?**
There will no longer be individual limit upgrades - if you would like higher limits for your title, you can upgrade from either the legacy Free Tier or the new Evaluation Mode to the Pay-As-You-Go Plan. These upgraded limits are the same as in the legacy Indie, Pro, and Enterprise Tiers.