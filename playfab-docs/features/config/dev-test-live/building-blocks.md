---
title: Building Blocks
author: v-thopra
description: Describes the fundamental concepts on which PlayFab is based.
ms.author: v-thopra
ms.date: 02/11/2018
ms.topic: article
ms.prod: gaming
ms.technology: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Building Blocks

Below is a list of fundamental concepts on which PlayFab is based. We have termed these "Building Blocks"; because all PlayFab-based solutions will be built around these foundational concepts.

**Accounts**
The PlayFab account system is responsible for verifying client details and issuing authorization tickets. We support most common 3rd party providers (including, but not limited to: Facebook, Steam, iOS devices, Android devices, Xbox, and PSN). PlayFab clients must authenticate before accessing our APIs. Additionally our data models revolve around the Player Account, making it easy to save and retrieve data specific to the current player.

**Actions (PlayStream)**
These are the activities triggered when an event or player data passes a corresponding rule set. Separate actions can be taken when entering or exiting a segment.

**Catalog / Virtual Goods**
Catalogs contain CatalogItems. CatalogItems offer an easy way to manage your game's items. CatalogItems can be configured in multiple ways, offering a corollary to just about every type of virtual good that your game might use. Examples of the five most common uses for CatalogItems include:

1. Durable Items - Items that can be bought or granted and remain in the player's inventory.
2. Consumable Items - Items that have a set number of uses. After these uses are consumed, the item is destroyed.
3. Bundles - A collection of virtual currencies and virtual items that when obtained are automatically unpacked into the player's inventory. 
4. Locked & Unlocked Containers - A collection of virtual currencies and virtual items that must me manually unpacked by the User. Containers can be unlocked or locked with a key (another item that the player must also have before unpacking).
5. Temporal Items - Items that exist for only a limited time. Items will be automatically removed after the expiration.

**CatalogItems / Custom Data**
CatalogItems accept CustomData, a collection of Key->Value pairs of type <string,string>. This collection can be used in numerous ways; such as, storing relevant item attributes, modifiers, and durability.

**CDN (Content Delivery Network)**
We offer Amazon CloudFront as a built in CDN offering. This is a premium service and separate charges will apply.

**Character Inventory**
Similar to Player Inventory, except stored at a per-character level.

**Character Data**
Similar to Player Data, except stored at a per-character level.

**Characters**
PlayFab offers 10 character slots per player Account.

**Character Statistics**
Similar to CharacterStatistics, except stored at a per-character level.

**CloudScript**
Your JavaScript code hosted on PlayFab, running in a protected environment with access to the Server API set. This is very useful when you need to run secure API calls without needing to host a server.

**Drop Table**
Drop Tables work in conjunction with Item Bundles and Item Containers. They represent a convenient, server-side mechanism for calculating the random item distribution when opening containers and bundles.

**Events (PlayStream)**
The signals generated through interacting with PlayFab(automatic) or by calling the WriteEvent API(manual).

**Events_Archive (PlayStream)**
The recommended solution for long-term storage of PlayStream events. This keeps an external AWS S3 bucket in-sync with your event stream.

**Leaderboards**
Leaderboards are derived from the aggregation of PlayerStatistics. Players will be ranked from High->Low for each of the statistics for which they have data. Leaderboards can also be reset on a re-occurring cadence, making in-game contests easy.

**Photon**
Photon and PlayFab are two synergistic services bringing high-quality multilayer features to game developers. For more information see our **Photon Example Project**.

**Player Accounts**
Player Accounts, at their simplest, offer authentication pathways with the most common providers (x,y,z). Beyond authentication, accounts also serve as the central pillar around which your game systems are built.

**Player Data**
Key-Value pairs of data attached to the Player account. This data can be public or private and can also be restricted to Readable/Writable, Only Readable or Only Writable.

**Player Inventory / Item Instance**
All PlayerAccounts have an inventory. The inventory contains all of the owned ItemInstances as well as the item history to-date.

**Player Statistics**
Statistics are a special form of PlayerData that is a set restricted to <string, int>. These statistics are saved to the player account and can be used to automatically generate leaderboards.

**Publisher Data**
Similar to TitleData, PublisherData represents any data stored at the publisher level. This is a special set of data that can be accessible from any title tied to the corresponding publisher id. This is useful for cross-game promotionals as well as general developer and studio news that might be interesting to the community.

**Push Notifications**
PlayFab provides both server and client support for Push Notifications. For Clients, PlayFab offers the ability to bind player accounts to your developer GCM & APNS messaging channels. For servers we provide an API to send Push Messages directly to a player account. Developers can send an unlimited number of Push Messages at no additional charge.

**Rules (PlayStream)**
These are the conditions by which PlayStream events are evaluated.

1. Filters (Logical AND) - Provides the ability to add logical conditions where all conditions must be passed before triggering actions.
2. Groups (Logical OR) - Provides the ability to add optional logical conditions where at least one group must evaluate to true before triggering actions.

**Segments / Segmentation (PlayStream)**
Provide subsets of players grouped by their event history. For example, the "Frequent Players" segment is comprised of players that have logged in more than 100 times.

**Servers**
PlayFab offers dedicated server hosting. You can upload a game server build via Game Manager, configure build parameters, and let PlayFab's GameWrangler handle scaling your servers to meet player demand in real-time.

**Shared Group Data**
Provides permission-based arbitrary Key-Value storage. Groups are collections of players that must be added manually. All players have the ability to view and edit keys and values.

**Stores / Store Items**
Stores serve a subset of CatalogItems; these items can be offered at alternative prices when compared to those set on the corresponding CatalogItem.

**Title Data**
TitleData represents any data stored at the title level. This is the broadest data set, all clients and servers may view TitleData. Often times, general game configuration settings are stored in TitleData and are typically one of the first APIs called when clients connect.

**Title ID**
Your title's unique identifier. This ID can be obtained from the Game Manager under Settings > Credentials. This value must be manually set in the SDK before calling into the service.

**Trading**
Using our Trade API flow, Players and Characters can trade items to other players and characters.

**Virtual Currency**
PlayFab offers up to 10 virtual currencies per title. By default, these arbitrary currencies can be used to purchase virtual goods from the catalog or store, as a soft currency converted from IAPs or as a generic mechanic to derive gameplay. Additionally, currencies can be configured to "recharge" over time to a predetermined limit.

**Title News**
This is a simple catalog of news items. This feature makes sending Message Of The Days (M.O.T.D.) accessible with a single API call.

**Webhooks (PlayStream)**
Enables the calling of external web services with customized HTTP parameters.
