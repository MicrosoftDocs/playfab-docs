---
title: Building Blocks
author: v-thopra
description: Describes the fundamental concepts on which PlayFab is based.
ms.author: v-thopra
ms.date: 02/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config
ms.localizationpriority: medium
---

# Building Blocks

Below is a list of fundamental concepts on which **PlayFab** is based. We have termed these **Building Blocks**, because all **PlayFab**-based solutions will be built around these foundational concepts.

## Accounts

The **PlayFab Account** system is responsible for verifying **Client** details, and issuing authorization tickets. We support most common 3rd party providers, such as **Facebook**, **Steam**, **iOS** devices, **Android** devices, **Xbox**, and **PSN**.

**PlayFab Clients** must authenticate before accessing our **APIs**. Additionally, our data models revolve around the **Player Account**, making it easy to save and retrieve data specific to the current **Player**.

## Actions (PlayStream)

These are the activities triggered when an **Event** or **Player** data passes a corresponding rule set. Separate actions can be taken when entering or exiting a **Segment**.

## Catalog / Virtual Goods

**Catalogs** contain **CatalogItems**. These offer an easy way to manage your game's **Items**. **CatalogItems** can be configured in multiple ways, offering a corollary to just about every type of **Virtual Goods** that your game might use.

Examples of the five most common uses for **CatalogItems** include:

1. **Durable Items** - **Items** that can be bought or granted and remain in the **Player's** inventory.
2. **Consumable Items** - **Items** that have a set number of uses. After these uses are consumed, the **Item** is destroyed.
3. **Bundles** - A collection of **Virtual Currencies** and **Virtual Items** that when obtained are automatically unpacked into the **Player's** inventory.
4. **Locked and Unlocked Containers** - A collection of **Virtual Currencies** and **Virtual Items** that must me manually unpacked by the **User**. Containers can be unlocked or locked with a **Key** (another **Item** that the **Player** must also have before unpacking).
5. **Temporal Items** - **Items** that exist for only a limited time. **Items** will be automatically removed after their expiration.

## CatalogItems/Custom Data

**CatalogItems** accept **CustomData**, a collection of **Key**->**Value** pairs of **Yype** <**string,string**>. This collection can be used in numerous ways - such as storing relevant item attributes, modifiers, and durability.

## CDN (Content Delivery Network)

We offer **Amazon CloudFront** as a built in **CDN** offering. This is a premium service and separate charges will apply.

## Character Inventory

Similar to **Player Inventory**, except that it is stored at a **per-Character Level**.

## Character Data

Similar to **Player Data**, except that it is stored at a **per-Character Level**.

## Characters

**PlayFab** offers 10 character slots per **Player Account**.

**Character Statistics**
Similar to **Player Statistics**, except stored at a **per-Character Level**.

## CloudScript

Your **JavaScript** code, hosted on **PlayFab**, and running in a protected environment with access to the **Server API** set. This is very useful when you need to run secure **API** calls without needing to host a server.

## Drop Table

**Drop Tables** work in conjunction with **Item Bundles** and **Item Containers**. They represent a convenient, server-side mechanism for calculating the random **Item** distribution when opening **Containers** and **Bundles**.

## Events (PlayStream)

The signals that are generated through interacting with **PlayFab** (automatic) or by calling the **WriteEvent API** (manual).

## Events_Archive (PlayStream)

The recommended solution for long-term storage of **PlayStream Events**. This keeps an external **AWS S3** bucket in-sync with your **Event** stream.

## Leaderboards

**Leaderboards** are derived from the aggregation of **PlayerStatistics**. **Players** will be ranked from **High** to **Low** for each of the **Statistics** for which they have data. **Leaderboards** can also be reset on a re-occurring cadence, making in-game contests easy.

## Photon

**Photon** and **PlayFab** are two synergistic services, bringing high-quality multilayer features to game developers. For more information see our **Photon Example Project**.

## Player Accounts

**Player Accounts**, at their simplest, offer authentication pathways with the most common providers (x,y,z). Beyond authentication, accounts also serve as the central pillar around which your game systems are built.

## Player Data

These are **Key-Value Pairs** of data that are attached to the **Player Account**. This data can be *public* or *private*, and can also be restricted to **Readable/Writable**, **Only Readable** or **Only Writable**.

## Player Inventory / Item Instance

All **PlayerAccounts** have an **Inventory**. The **Inventory** contains all of the owned **ItemInstances** as well as the **Item** history to-date.

## Player Statistics

**Statistics** are a special form of **PlayerData** that is a set restricted to <**string, int**>. These **Statistics** are saved to the **Player Account** and can be used to automatically generate **Leaderboards**.

## Publisher Data

Similar to **TitleData**, **PublisherData** represents any data stored at the **Publisher Level**. This is a special set of data that can be accessible from any **Title** tied to the corresponding **Publisher ID**.

This is useful for cross-game promotionals, as well as general developer and studio news that might be interesting to the community.

## Push Notifications

**PlayFab** provides both server and **Client** support for **Push Notifications**. For **Clients**, **PlayFab** offers the ability to bind **Player Accounts** to your developer **GCM** & **APNS** messaging channels.

For servers, we provide an **API** to send **Push Messages** directly to a **Player Account**. Developers can send an unlimited number of **Push Messages** at no additional charge.

## Rules (PlayStream)

These are the conditions by which **PlayStream Events** are evaluated.

1. **Filters** (Logical AND) - Provides the ability to add logical conditions, where all conditions must be passed before triggering actions.
2. **Groups** (Logical OR) - Provides the ability to add optional *logical* conditions, where at least *one* **Group** must be evaluated as **true** before triggering actions.

## Segments / Segmentation (PlayStream)

Provides subsets of **Players**, grouped by their **Event** history. For example, the **Frequent Players Segment** is comprised of **Players** that have logged in more than 100 times.

## Servers

**PlayFab** offers dedicated server hosting. You can upload a game server build via **Game Manager**, configure build parameters, and let the **PlayFab GameWrangler** handle scaling your servers to meet **Player** demand in real-time.

## Shared Group Data

Provides permission-based arbitrary **Key-Value** storage. **Groups** are collections of **Players** that must be added manually. All **Players** have the ability to view and edit **Keys** and **Values**.

## Stores/Store Items

**Stores** serve a subset of **CatalogItems**. These items can be offered at alternative prices when compared to those set on the corresponding **CatalogItem**.

## Title Data

**TitleData** represents any data stored at the **Title Level**. This is the broadest data set, all **Clients** and servers may view **TitleData**.

General game configuration settings are often stored in **TitleData**, and are typically one of the first **APIs** called when **Clients** connect.

## Title ID

The unique identifier for a **Title**. This **ID** can be obtained from the **Game Manager** under **Settings** > **Credentials**. This value must be *manually* set in the **SDK** prior to calling in to the service.

## Trading

Using our **Trade API** flow, **Players** and **Characters** can trade **Items** to other **Players** and **Characters**.

## Virtual Currency

**PlayFab** offers up to 10 **Virtual Currencies** per **Title**. By default, these arbitrary **Currencies** can be used to purchase **Virtual Goods** from the **Catalog** or **Store**, as a **Soft Currency** converted from **IAPs** or as a generic mechanic to derive game play. Additionally, **Currencies** can be configured to *recharge* over time to a predetermined limit.

## Title News

This is a simple **Catalog** of **News** items. This feature makes sending **Message Of The Days** (**M.O.T.D.**) accessible with a single **API** call.

## Webhooks (PlayStream)

Enables the calling of external web services with customized **HTTP** parameters.
