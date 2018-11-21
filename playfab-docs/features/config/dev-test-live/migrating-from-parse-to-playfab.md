---
title: Migrating from Parse to PlayFab
author: v-thopra
description: Provides step-by-step instructions for migrating from Parse to PlayFab.
ms.author: v-thopra
ms.date: 02/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config
ms.localizationpriority: medium
---

# Migrating from Parse to PlayFab

## How does PlayFab compare to Parse?

Both PlayFab and Parse provide back-end tools and services for building and operating your game, but there are several differences. Understanding these differences is important for planning a migration from Parse to PlayFab.

The most important difference is that Parse is a general purpose mobile backend, with very few game-specific features. With Parse, you need to write and test game-specific systems yourself using the basic building blocks that Parse provides.

PlayFab, however, is specifically designed for games, and includes a large number of game-specific systems that you can immediately start using without writing any custom code. Most developers tell us that building their game on PlayFab is much faster than building their game on Parse, but it is less flexible. There may be tasks that you could do in Parse that you cannot easily do in PlayFab -- at least, not without writing some custom code yourself.

This migration tutorial assumes that you have already familiarized yourself with PlayFab’s features. If you haven’t, we recommend you start by reading our tutorial [Getting started with PlayFab](getting-started-with-playfab.md), then come back to this tutorial to learn more about the migration process.

### Storing Files and data

Both PlayFab and Parse provide systems for storing files and data for your game and players, but they do it differently.

Parse uses MongoDB and loosely-typed objects to allow clients to store whatever information they would like in whatever format is convenient. Games can write arbitrary SQL queries to retrieve data for the game. This is very flexible, but it’s also easy to make mistakes that impact your game’s performance. It’s also hard to scale -- if your game suddenly takes off, you may need to shard your database to keep up with growth.

PlayFab takes a different approach. PlayFab also stores data in an underlying database, but the raw database is hidden from the developer. Instead, all data is accessed via a set of game-and-player-specific APIs. This is slightly less flexible, but much more scalable. In fact, using the PlayFab APIs, you don’t need to worry about growth. Whether you have 100 players each day or 10,000,000 - PlayFab will handle it.

With PlayFab, custom data is stored in these places:

- **Game title data**. Game-wide data which can be accessed by all players and game clients. This data is typically used for game content or configuration, such as level maps, upcoming events, or current promotions. For more, see [Using Title Data](../../config/titledata/using-title-data.md).
- **Files**. PlayFab provides support for uploading files, and then delivering them via an integrated CDN. For more, see [How to use PlayFab's Content Management API](https://playfab.com/blog/how-use-playfabs-content-management-api/).
- **Catalog data**. Every item in the catalog can have custom properties associated with it, such as rate-of-fire for a weapon, or mana points for a collectible card. For more, see [Catalogs](../../commerce/items/catalogs.md).
- **Inventory data**. Every item in a player’s inventory can have custom properties associated with it, such as item hit-points, or config data for procedurally generated items.
- **Group data**. Data shared among a specific group of players, such as a guild or lobby. Examples include a guild name or message of the day. Players can be added and removed from a shared group; all members in the group can read or write shared group data.
- **Player data**. Data stored per player account, like Parse “Keyed User Data”; see our tutorial [Using Player Data](../../data/playerdata/using-player-data.md). 
Data can be:
  - **Private** (accessed only by the players), **Public** (accessed by other players)
  - Scoped at either the **publisher-level** (shared across games by the same publisher), **game-level**, or **character-level** (tied to one of several characters the player controls in the game).
  - **Read/write** from the client, **read-only** from the client, or **invisible** to the client. Player data is always read/write from the server.
- **Player Stats**. Stats are a special type of player data. They must be integers, and they have special properties:
  - **Leaderboards** Any stat can be used to define a leaderboard (see social features).
  - **Segmentation** Stats can be used to define player segmentation rules.
  - **Match-making** Stats can be used as part of the match-making logic (e.g., find a match based on player’s level or weapon rating)

One limitation of the PlayFab approach is that it is not possible to write your own SQL queries directly against data stored in PlayFab. With PlayFab you can, however, segment players into different groups based on player stats and other properties. You can then trigger actions automatically as players enter and exit these segments, and soon you will be able to execute batch actions across an entire segment (e.g., give a gift, or send a message). Also on our short-term roadmap is searching for specific players based on their properties for match-making or challenges.

### Cloud Code

Both Parse and PlayFab provide server-side JavaScript for writing custom game code. With PlayFab, it’s called [CloudScript](../../automation/cloudscript/cloudscript-quickstart.md). Today Parse has better tools for debugging Cloud Code, but this is on the PlayFab roadmap. PlayFab does provide GitHub integration for managing CloudScript, and it’s very easy to call any of the powerful and trusted PlayFab Server API functions from CloudScript.

### User Management and Authentication

Like Parse, PlayFab provides rich support for creating and managing player profiles. Player accounts can be linked to multiple different authentication mechanisms, such as [Facebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook), [Steam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam), an[email/password](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress), an [iOS](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid) or [Android](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid) device ID, or your own [custom identifiers](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid), in order to make it easy to share a single player profile across multiple devices or platforms.

PlayFab’s Game Manager tool also provides a powerful set of tools for viewing and managing player profiles, ideal for debugging a game in production or providing customer support for a game post-launch. 

Using the Game Manager you can:

- View a player’s login history
- View and modify all player data and stats
- View and modify a player’s inventory, virtual currency balances, and purchase history
- See a history of the player’s multiplayer matches
- Reset a player’s password, or unlink an authentication type
- Temporarily or permanently ban a player

### Push Notifications

PlayFab has native support for sending push notifications to players, but this feature is primarily aimed at sending personalized messages directly to specific players. For sending bulk messages to many or all of your players, we have partnered with OneSignal, and have a OneSignal Add-on coming soon in our marketplace. For now, you can integrate the OneSignal SDK directly in your game; once the Add-on is complete, OneSignal will be integrated directly with PlayFab player segmentation.

### Analytics and reporting

PlayFab has basic support for analytics and reporting built into the Game Manager. More advanced analytics providers are available through the PlayFab Add-on Marketplace, including Segment, Appuri, and Omniata (coming soon).

Many analytics events are generated for your game automatically (for example, player logged in, player stat changed). Games can also log custom events using the client [WritePlayerEvent](xref:titleid.playfabapi.com.client.analytics.writeplayerevent) or server [WritePlayerEvent](xref:titleid.playfabapi.com.server.analytics.writeplayerevent) methods. All events are automatically forwarded to any analytics providers installed via the Marketplace.

### Receipt validation

Like Parse, PlayFab can validate in-app purchase receipts from Apple and Google. Learn more [here](https://playfab.com/blog/show-me-money-receipt-validation-ios-and-android/).

## Importing Parse Users to PlayFab

PlayFab’s user import tool imports Parse user objects directly into PlayFab player profiles. If your title was primarily just using the Parse User object to store player properties, then your migration may be simple -- just export your users from Parse, import them into PlayFab, swap SDKs in your game, and modify your authentication and player profile storage calls.

There is no risk to experimenting with our Parse player import, since the process does not affect your live game or data. Also, you can re-run the import process as often as necessary during the migration process for your game, in order to ensure that no users are left behind.

### User import how-to

1. Generate a Parse migration URL from within the Parse UI by clicking on the Export Data option in your Parse Application Settings->General tab (see the following).

   ![Parse - App Settings - General Tab](media/tutorials/parse-app-settings-general-tab.png)  

   Alternatively, if you would like to export only a handful of users for testing, go to Browse->User, filter/choose users as needed, and Export Data (see the following).

   ![Parse - Browser - Export User Data](media/tutorials/parse-browser-export-user-data.png)  

2. Sign up for a PlayFab developer account and [create your game](../../config/gamemanager/game-manager-quickstart.md).
3. In the Game Manager, browse to your title, and then to the Add-ons tab.

   ![Game Manager - Add-ons](media/tutorials/game-manager-add-ons.png)  

4. Select the Parse Migration Add-on.

   ![Game Manager - Add-ons - Parse Migration Add-on](media/tutorials/game-manager-add-ons-parse-migration-add-on.png)  

5. Click the “Install Parse” button.
6. Paste in the exported data URL from the email sent by Parse.
7. Click "Import User Data".

   1. Migration will proceed in the background; there is no need to leave Game Manager open.
   2. Existing users will be updated with fresh information from the import.
   3. If no user already exists, one will be created.

      ![Parse Migration - Import User Data](media/tutorials/parse-migration-import-user-data.png)  

8. You may check back periodically to get the most recent status of the migration and see any errors that might have been encountered.
9. Once migration is completed, review the provided log for any errors and to confirm the count of migrated users.

   1. Potential errors include: invalid URL, invalid data JSON format, or conflicting username or email addresses.
   2. Each error message will describe which user experienced the error so you can take appropriate action.

10. Select the "Players" tab in the Game Manager.
11. Review some of your imported players for general correctness.
12. Download the PlayFab SDK and update your game client to point to PlayFab for your user functions. In particular, the following APIs will prove useful:
    - [Client/LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
    - [Client/LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)
    - [Client/GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata)
    - [Client/UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata)

### Migrating other Parse functionality

If your game is storing more custom data than just User objects, we can still help! Please contact us on our [support forum](https://community.playfab.com/) for customized instructions based upon your specific Parse utilization, and we will help you migrate as painlessly as possible.
