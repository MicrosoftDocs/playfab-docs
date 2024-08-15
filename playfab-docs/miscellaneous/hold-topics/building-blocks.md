---
title: Building Blocks
author: joannaleecy
description: Describes the fundamental concepts on which PlayFab is based.
ms.author: joanlee
ms.date: 02/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config
ms.localizationpriority: medium
---

# Building Blocks

Below is a list of fundamental concepts on which PlayFab is based. We have termed these *Building Blocks*, because all PlayFab-based solutions will be built around these foundational concepts.

## Accounts

The PlayFab Account system is responsible for verifying client details, and issuing authorization tickets. We support most common 3rd party providers, such as Facebook, Steam, iOS devices, Android devices, Xbox, and PlayStation&#8482;Network.

PlayFab clients must authenticate before accessing our APIs. Additionally, our data models revolve around the player account, making it easy to save and retrieve data specific to the current player.

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## Actions (PlayStream)

These are the activities triggered when an event or player data passes a corresponding rule set. Separate actions can be taken when entering or exiting a segment.

## Catalog/Virtual Goods

Catalogs contain **CatalogItems**. These offer an easy way to manage your game items. **CatalogItems** can be configured in multiple ways, offering a corollary to just about *every* type of virtual goods that your game might use.

Examples of the five most common uses for **CatalogItems** include:

1. **Durable Items** - Items that can be bought or granted and remain in the player's inventory.
2. **Consumable Items** - Items that have a set number of uses. After these uses are consumed, the item is destroyed.
3. **Bundles** - A collection of virtual currencies and virtual items that when obtained are automatically unpacked into the player's inventory.
4. **Locked and Unlocked Containers** - A collection of virtual currencies and virtual items that must me manually unpacked by the user. Containers can be unlocked or locked with a key (another item that the player must also have before unpacking).
5. **Temporal Items** - Items that exist for only a limited time. Items will be automatically removed after their expiration.

## CatalogItems/Custom data

**CatalogItems** accepts **CustomData**, a collection of **Key**->**Value** pairs of **Type** <**string,string**>. This collection can be used in numerous ways - such as storing relevant item attributes, modifiers, and durability.

## CDN (Content Delivery Network)

We offer Amazon CloudFront as a built in CDN offering. This is a premium service and separate charges will apply.

## Character inventory

Similar to player inventory, except that it is stored at a per-character level.

## Character data

Similar to player data, except that it is stored at a per-character level.

## Characters

PlayFab offers 10 character slots per player account.

## Character statistics

Similar to player statistics, except stored at a per-character level.

## CloudScript

Your JavaScript code, hosted on PlayFab, and running in a protected environment with access to the Server API set. This is very useful when you need to run secure API calls without needing to host a server.

## Drop tables

Drop tables work in conjunction with item bundles and item containers. They represent a convenient, server-side mechanism for calculating the random item distribution when opening containers and bundles.

## Events (PlayStream)

The signals that are generated through interacting with PlayFab (automatic) or by calling the WriteEvent API (manual).

## Events_Archive (PlayStream)

The recommended solution for long-term storage of PlayStream events. This keeps an external AWS S3 bucket in-sync with your event stream.

## Leaderboards

Leaderboards are derived from the aggregation of player statistics. Players will be ranked from high to low for each of the statistics for which they have data. Leaderboards can also be reset on a re-occurring cadence, making in-game contests easy.

## Photon

Photon and PlayFab are two synergistic services, bringing high-quality multilayer features to game developers. For more information see our Photon Example Project.

## Player accounts

Player accounts, at their simplest, offer authentication pathways with the most common providers (x,y,z). Beyond authentication, accounts also serve as the central pillar around which your game systems are built.

## Player data

These are Key/Value Pairs (KVPs) of data that are attached to the player account. This data can be *public* or *private*, and can also be restricted to Readable/Writable, Only Readable or Only Writable.

## Player inventory/Item instance

All player Accounts have an inventory. The inventory contains all of the owned ItemInstances as well as the item history to-date.

## Player statistics

Statistics are a special form of player data that is a set restricted to <string, int>. These statistics are saved to the player account and can be used to automatically generate leaderboards.

## Publisher data

Similar to TitleData, PublisherData represents any data stored at the publisher level. This is a special set of data that ise accessible from any title tied to the corresponding publisher ID.

This is useful for cross-game promotionals, as well as general developer and studio news that might be interesting to the community.

## Push notifications

PlayFab provides both server and client support for push notifications. For clients, PlayFab offers the ability to bind player accounts to your Developer GCM & APNS messaging channels.

For servers, we provide an API to send push messages directly to a player account. Developers can send an unlimited number of push messages at no additional charge.

## Rules (PlayStream)

These are the conditions by which PlayStream events are evaluated.

1. **Filters** (**Logical AND**) - Provides the ability to add logical conditions, where all conditions must be passed before triggering actions.
2. **Groups** (**Logical OR**) - Provides the ability to add optional *logical* conditions, where at least *one* *group must be evaluated as *True** before triggering actions.

## Segments / Segmentation (PlayStream)

Provides subsets of players, grouped by their event history. For example, the Frequent Players segment is comprised of players that have logged in more than 100 times.

## Servers

PlayFab offers dedicated server hosting. You can upload a game server build via the Game Manager, configure build parameters, and let the PlayFab GameWrangler handle scaling your servers to meet player demand in real time.

## Shared group data

Provides permission-based arbitrary key/value storage. Groups are collections of players that must be added manually. All players have the ability to view and edit keys and values.

## Stores/store items

Stores serve a subset of **CatalogItems**. These items can be offered at alternative prices when compared to those set on the corresponding **CatalogItem**.

## Title Data

**TitleData** represents any data stored at the title level. This is the broadest data set; all clients and servers may view **TitleData**.

General game configuration settings are often stored in **TitleData**, and are typically one of the first **APIs** called when clients connect.

## Title ID

The unique identifier for a title. This ID can be obtained from the **Game Manager** under **Settings** > **Credentials**. This value must be *manually* set in the SDK prior to calling in to the service.

## Trading

Using our trade API flow, players and characters can trade items to other players and characters.

## Virtual currency

PlayFab offers up to 10 virtual currencies per title. By default, these arbitrary currencies can be used to purchase virtual goods from the catalog or store, as a soft currency converted from IAPs or as a generic mechanic to derive game play. Additionally, currencies can be configured to *recharge* over time to a predetermined limit.

## Title news

This is a simple catalog of news items. This feature makes sending the **Message Of The Day** (**M.O.T.D.**) accessible with a single API call.

## Webhooks (PlayStream)

Enables the calling of external web services with customized HTTP parameters.
