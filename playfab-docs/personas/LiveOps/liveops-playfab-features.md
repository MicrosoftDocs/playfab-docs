---
title: LiveOps features
author: v-kciril
description: Techniques for using LiveOps with PlayFab.
ms.author: v-kciril
ms.date: 02/28/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, real-time analytics, PlayStream, live operations, player behaviors, event archiving, data export, player data, webhooks, analytic reporting, reports, features, liveops
ms.localizationpriority: medium
---

# LiveOps features

We hope you’ve found our Definitive Guide to LiveOps to be useful. At PlayFab, our passion is to provide the best set of tools and services to support LiveOps for all types of game developers. This appendix lays out how PlayFab can support you in implementing the best practices described in this guide. Furthermore we are continually investing in new features, guided in part by the LiveOps practices detailed in this guide. Games built on PlayFab should expect a continuous stream of new features to help make their LiveOps practices ever more effective.

## How PlayFab supports LiveOps

Included here are some suggestions of how customers today are combining PlayFab features together to enable entirely new LiveOps features. One of PlayFab’s most powerful aspects is its configurability, thanks to its scripting functions and powerful API. That means PlayFab is capable of supporting additional features even if they’re not available out-of-the-box. Curious about how this can work for you? Come talk with us - we’d love to show you how, or help you brainstorm how you can use PlayFab to unlock your own innovative ideas.

- **Analytics**: we’ve discussed at length in this guide how data is the lifeblood of live games, and that the ability to respond quickly to issues is a key capability for a LiveOps team. PlayFab provides a robust data infrastructure for live games out of the box, with optional supplements like integrated data warehousing via Snowflake. Key analytics tools supporting LiveOps include:

    - **Real-time visualization of your data pipeline**, so your LiveOps team can monitor the “heartbeat” of your game and track if anything is outside of normal trends. In-game events stream into PlayFab in real time and can be viewed in the **Game Manager** web-based tool. If they need to drill down, they can click to view full JSON data of any event in the pipeline.
    
    - The ability to troubleshoot a range of issues, allowing you to tweak your game with confidence and your CS reps to respond effectively to service-recovery scenarios. **Filter and search through recent events history**, zooming in on a particular time period, player, event type, or error condition.

    - High-level overview and drill-down **detailed reports of all major KPIs**, on-demand and via email, so you can keep a close eye on performance and measure the impact of changes on your live game.
 
    - Support for real-time **player segmentation** - with PlayFab you can define segments based on player behavior and then customize your game experience for each segment, or target each segment with campaigns. 

- **Building an effective LiveOps team**: while it’s up to you to staff this team with the right people and create a work environment where they can be successful, PlayFab can help with critical aspects like disseminating information across the team and facilitating team collaboration.

    - All team members can have direct access to all features of PlayFab from **Game Manager**, a single easy-to-use web portal; fees are based on how many active players you have, not employees, so everyone can collaborate.

    - With powerful **APIs** and **data-warehouse** integration, PlayFab can be your teams once source of truth for data with everything in one place and a common visualization.

    - Customer support reps can quickly **search across all player profiles** to locate a particular player record, review their play history, and then **make changes or grant items or currency** to help deal with a service recovery issue. They can also **ban abusive players** with temporary or permanent bans.

- **Tournaments, multiplayer and groups** are some of the most effective tactics for driving engagement and increase the longevity of your game, and PlayFab provides the critical components for incorporating these into your game.

    - Use **leaderboards** to rank players based on a numerical statistic, then create a social leaderboard by filtering to just friends (from Facebook, Steam, Xbox, etc.). Manually remove any players suspected of cheating.
    
    - **Reset leaderboards** periodically based on a fixed schedule or manually, and use **prize tables** to take automated actions for players in the leaderboard, such as automatically granting items or sending messages, depending on their rank at the time of a reset.
    
    - For simple asynchronous multiplayer, use **data permissions** to allow one player to see certain data for another, like a card deck or city build.

    - For sophisticated multiplayer games, build your own **custom game server**, then let PlayFab host it for you with **automatic scaling** in data centers around the world to ensure you never run out of room for new players. Use PlayFab’s built-in **matchmaking** algorithm to find the best match between players in real-time, based on logic you configure, or plug in your own matchmaking server.

    - For simpler multiplayer games, PlayFab also offers direct support for **Photon** to handle message passing between clients for multiplayer without requiring a custom game server.

    - Use **groups** to drive engagement through team dynamics. Make **custom player groups** and take actions based on player membership.

- **Updating your content often** is another key pillar of an effective LiveOps strategy, and PlayFab has you covered with a full set of tools to help your team update virtually any part of your game after you launch.

    - Store your **game configuration** in PlayFab, then remotely tune and adjust your settings anytime you want, without a client update. Settings can be anything from simple key/value pairs (e.g., “XP gain rate: 1.0”) or complex JSON files.

    - Configure the full **catalog of items** available for in-app granting or purchase, and update with new items at any time. Items can have limited uses, expiration times, custom JSON data, tags and more.

    - **Host all your game assets** in PlayFab. Upload manually via the Game Manager, or automatically via command line tools or the admin API directly from your build pipeline.

    - Stream assets down to your game clients via a **global CDN**. Use our default CDN (with pass-through billing) or configure your own custom CDN to point to PlayFab to retrieve files.

- **Running experiments** is a critical part of honing a game after launch for maximum effectiveness. With PlayFab, you can set up **A/B** tests with multiple buckets and A/B test elements of your game that often drive significant - and easy - wins, including stores, rewarded video-ad offers, and even game behavior.

- **Monetization** is one of the most important elements of your game’s strategy.. Here too PlayFab has powerful tools and services to maximize your upside while protecting you from the many pitfalls. 

    - Don’t let fraudsters ruin your game - and empty your pockets - with fake purchases. Server-side **receipt validation** ensures your Apple or Google receipts are genuine before a player completes a purchase transaction. PlayFab also supports **third-party payment processing** from Xsolla, PayPal, Steam, Xbox, and more.

    - Stimulate demand with **rare or limited-edition items** that have enforced scarcity, or craft attractive **bundles** for first-time or regular players. 
    
    - Optimize conversion and revenues by creating **targeted stores** aimed at specific segments. These stores can offer a subset of items, have special offers and discounts, and custom data fields.
    - Handle a global audience with support for multiple **real-world currencies**, and avoid the pay-to-win trap with support for **multiple virtual currencies**.
    - Foster cooperative behavior by supporting **gifting and trading between players**, or celebrate holidays by gifting from system to player.
    - Open up new recurring revenue channels by offering **subscriptions** for ongoing services. For example, charge $9.99 every month for your VIP program.
    - While many game developers like to have a hands-on negotiating strategy for ad mediation, they’re often forced to work with the mediation firm’s analytics. PlayFab integrates with popular ad mediation providers for **rewarded video ad tracking**. PlayFab’s also there when you need to **track reward offers** so you can fulfill them accurately. 
- Running **live events**: As we’ve shown in this guide, live events are powerful drivers for player engagement and monetization. PlayFab provides all the building blocks you’ll need to build a full live events system, including:

    - Multiple ways to define and configure your **list of all upcoming events**. We have a demo showing how to use an item catalog and store to do this.
    
    - For competitive events, create one-off **event leaderboards** to motivate players and update them with **automation rules**. Use **prize tables** to automatically give out prizes when the event ends.

    - Replace your standard stores for the duration of the event with **custom event stores** that feature special discounts, bundles, and offers just for that event.

    - Remind players about upcoming events using a **message-of-the-day**, and fire off a **push notification** or **e-mail** to notify players when the event starts.

- Boosting **player retention and engagement** is one of the main reasons to invest in LiveOps. A backend platform like PlayFab provides a variety of features to help, including:

    - Review your 1, 7, and 30-day new player retention with the **daily retention report**.

    - Help game designers tune and tweak the game to make it more fun by digging deeply into player behavior using PlayFab’s **data warehouse**. Analyze where players are dropping out and test theories for why.

    - Build game mechanics like “daily rewards” using a combination of PlayFab’s **CloudScript** (server-hosted game logic) and **player data** stored on the server - where it can’t be tampered with by players intent on cheating.

    - Use the **rules engine** and **custom player data events** to build a powerful achievements system that reacts in real-time when players meet the criteria for a new event, and can be updated with new achievements at any time.

    - Player lost their phone? Avoid sending them back to square one by **storing their game progress** in the cloud on PlayFab. **Link accounts** together to provide multiple ways of recovering an account, such as using their Steam, Facebook, or Google accounts.

    - Take the right action for the right player at the right time through **real-time player segmentation**. Divide players into groups based on a variety of properties including spend, geography, device, client version, play patterns, and acquisition channel. Then, experiment with triggering actions as players enter or exit segments. You can also use PlayFab to **run scheduled tasks** that apply to all players in a given player segment, which lets you combine the efficiency of automation with the intimacy of a message or offer crafted to appeal to a particular audience.

    - **Communicate** to individual players, or to all players in a segment, via the channel that fits your needs best - including push notifications to iOS and Android, email messages to player email accounts and message-of-the-day pop-ups. You can also send messages in response to rule triggers you create (e.g., “we’re sorry you keep dying…”) and customize messages using parameters.

- Once your game hits the **plateau phase**, it can still be very profitable. PlayFab’s **per-active-player pricing** means that your operating costs scale with usage. As your players drop, your costs drop, allowing you to maintain healthy margins all the way down.
 
## PlayFab feature overview

PlayFab supports your game well beyond your LiveOps needs, so this guide wouldn’t be complete without a more complete overview of PlayFab’s features and functionality. We’ve included the following for reference. Questions? Please feel free to reach out to us any time and we’ll be happy to give you more detailed information or a demo.

- **Game manager**. A single “portal” where all members of your game studio can come to build, configure, and operate your game.

    - Direct access to all features of PlayFab, from a single easy-to-use web portal.
    
    - Interact with tools via a web-based graphic interface or use easy tools to upload bulk JSON or other data formats.
    
    - Notifications for important updates and new features.
    
    - Account management for all users of PlayFab in your game studio.
    
    - Create roles and assign permissions so your users can only access the features and see the data they should be seeing.

- **Developer support**. Industry-leading support solutions, to help your team as you build, launch, then operate your game on top of PlayFab.

    - Extensive documentation for all PlayFab services.

    - Code samples that can be dropped right into a game.

    - Videos describing specific features.

    - Case studies of how other games use PlayFab.

    - Forums for posting questions and browsing answers.

    - Slack channels for ongoing conversations with other developers, and direct communication with PlayFab Developer Success.

    - Ticket submission for asking for help or reporting issues.

    - Server health page that lists status of current servers, and includes history of previous issues or outages.

- **SDKs and third party plugin integration**. Support for most major game engines or platforms, to help you access and consume our services in your game no matter where you develop and deploy.

    - Support for 17 different SDKs, including Unity, Unreal Blueprints, Unreal CPP, C#, Windows, Lua, JavaScript, Cocos2D, ActionScript 3, Android Studio, Objective-C (iOS), Java, NodeJS, Xamarin, Lumberyard.

    - Support for breadth of platforms. Games utilizing PlayFab are shipping via the Amazon Kindle Store, App Store, Facebook Game Center, Facebook Instant Games, Google Play Store, Kongregate, Nintendo Switch, PlayStation, Steam, Xbox and more.

    - Access to the full set of PlayFab services, with client, server, and admin APIs. Built-in integration support for popular third-party backend services, such as analytics, profanity filtering, payments, and more.

- **Player authentication**. Bread of support for allowing you to track your players.  

    - Anonymous login utilizing industry standard device identification on Android, iOS and Nintendo Switch as well as custom identifiers defined by you.
    - Authenticated player integration with Facebook, Google Play, iOS Game Center, Kongregate, PlayStation Network, Twitch, Xbox Live and more.
    - Secure authenticated integration with your existing identity provider utilizing the OpenID Connect standard.
    - APIs and management tools to enable custom username/password and email/password authentication from within your game.

- **Real-time analytics and data pipeline**. Get immediate insight into what’s going on inside your game, with full visibility into performance and issues.

    - Real-time visualization of your data pipeline, so you can monitor the “heartbeat” of your game. Click and view full JSON data of any event in the pipeline.

    - Reporting. Both on-demand reports, and regular emailed reports. Includes both high-level overview reports and drill-down detailed reports of all major KPIs. Export reports as CSV files. 

    - Filter and search through recent events. Zoom in on a particular time period. Look for particular players, event types, or error conditions.

    - View events on a player-by-player basis to help CS reps uncover what happened in a service-recovery scenario.

    - Full data warehousing into Snowflake, a world-class data warehouse, for advanced SQL queries. Ensure that no events are ever lost.

    - Raw event logs for so you can import your raw event data into your own data warehouse system.

    - Ability to run complex offline queries, to set manual player “tags” for segmentation into more complex groups than can be segmented in real-time.

- **Player accounts and relationship management**. Manage player accounts across devices and platforms and take actions based on player behavior.

    - Account linking and authentication. Provide multiple mechanisms to retrieve a player account if they lose their device, including username/password, Google, Gamecenter, Facebook, Steam, Kongregate, Twitch, and any other custom ID.

    - Full-text search across all player profiles, including support for wildcard symbols or complex queries involving player profile properties.

    - Store and retrieve player data, such as save-game files, with a rich permissions model for sharing data with other players.

    - Real-time player segmentation. Divide players into groups based on a variety of properties including spend, geography, device, client version, play patterns, and acquisition channel. Trigger actions as players enter or exit segments.

    - Run scheduled tasks that apply to all players in a given player segment.

    - Self-serve password reset mechanism, for games using email and password.

    - Ban abusive players with temporary or permanent bans. Allow other players to report abuse. 

- **Data Exchange**. Bring all your game’s data together in one place no matter where it was generated.

    - Ingest event data from PlayFab SDK, PlayFab services, and other services you use to acquire, engage, and retain players.

    - Explore and operate on the data to create custom insights and operationalize them.

    - Create custom reports by connecting directly to the data using your favorite reporting tools, including PowerBI, and (coming soon) Grafana and Tableau.

    - Continuously export your data to Blob and S3 for ingestion into a pre-existing data warehouse solution. 

- **Data storage**. Flexible mechanisms to store all the data generated and consumed by your game.

    - File-based storage for large binary files.

    - Object storage for smaller JSON objects.

    - Rich permissions system, to set permissions for which entities and which players can read or write data.

    - Storage associated with all entities on the backend, including players, titles, catalog items, guilds, etc.

- **Player messaging**. Engage with your players using a variety of messaging methods.

    - Push notifications to iOS and Android.

    - Email messages to player email accounts. Optional tools to verify email address. Configure custom SMTP server. Track clicks to embedded links in email.

    - Message-of-the-day pop-up that players see when they first login.

    - Send messages in response to rule triggers (e.g., we’re sorry you keep dying…”)

    - Send to individual players, or to all players in a segment.

    - Customize messages using parameters.

- **Content management**. Tools to help you manage changes to your game or asset updates.

    - Remote setting of game configuration on the server.

    - Asset upload via game manager, command line tools, or raw API.

    - Download via CDN. Opportunity to use default CDN with built-in pricing or configure a custom CDN (for example, if you already have a corporate deal with Akamai).

- **Multiplayer**. A variety of technologies to support multiplayer games.

    - Dynamically scaling, cloud based multiplayer server backend powered by Azure, serving 50 global regions including China.

    - Server hosting. Upload server builds, choose regions, spin up servers to host game sessions, automatic load balancing.

    - Monitor game sessions in real-time - after sessions end, archive log files to help debug issues. 

    - Synchronous matchmaking, allowing flexibility through real-time configuration to balance quality games against time to match. The matchmaking system is highly customizable to fit many game variations.

    - Chat and voice services through PlayFab Parties.

    - Support for Photon to handle message passing between clients for multiplayer without requiring a custom game server.

- **Leaderboards and tournaments** 

    - Basic leaderboards for players, characters and groups. Rank players based on a numerical statistic either in an ascending or descending order.

    - Filter leaderboards to just friends (e.g., social leaderboard).

    - Reset leaderboards on a fixed schedule, or manually. Archive the standings so players can see how they did historically.

    - Manually remove any players suspected of cheating.

    - Dynamic child leaderboards that allow for bucketing of players to smaller leaderboards.Store additional metadata for display purposes for each leaderboard entry.

    - Prize tables, to take actions for players in the leaderboard depending on their rank at the time of a reset, such as automatically granting items, or sending messages.

- **In-game commerce**. Support in-app purchasing, including real-money transactions, virtual currencies, stores, and player inventories.

    - Receipt validation (e.g. Apple or Google receipts), or third-party payment processing (e.g., Xsolla, PayPal, Steam Wallet, Xbox and PlayStation entitlements, and more).

    - Create catalogs of in-game items that can be purchased. Items can have limited uses, expiration times, custom JSON data, and tags to help manage items.

    - Limited edition items have enforced scarcity.

    - User-generated content support with player.

    - populated stores and content curation tools.

    - Group items into bundles or containers. Containers can have optional “locking” to require “keys” to open and obtain contents.

    - Create one or more stores with subsets of the item catalog. Target stores based on player segments. Stores can have special offers and discounts, and custom data fields.

    - Store and manage player inventories. Items in inventory can have custom properties, for randomized items.

    - Configure one or more virtual currencies. Set initial default balances, specify auto-recharge rates. 

    - Create loot crates, with drop-table probabilities.

    - Manage subscriptions in app stores, like iOS and Android (e.g., charge $9.99 every month for VIP program.)

    - Support for multiple real-world currencies.

    - Generate and distribute coupons for in-game items.

    - Support gifting and trading between players, or from system to player.

- **User-generated content**. Tools to allow your community to contribute to your game.

    - Accept and store content from players using simple upload and ingestion APIs.

    - Manage user generated content through catalogs.

    - Basic moderation tools to ensure user generated content meets your quality standards.

    - Fully integrated with the rest of PlayFab’s in-game economy services.

- **Player-to-Player** communication. Tools to help keep your players connected in-game and out.

    - PlayFab Parties offers cross platform networking and voice chat services.

    - Cross platform device to device messaging makes it easy to add voice and text chat to your multiplayer game.

    - Host social experiences such as in-game gatherings and lobbies.

    - Enable peer to peer multiplayer without dedicated game servers.

    - Integrated speech to text technology makes communication more accessible.

    - A deep integration with Photon chat services for simple, in-game, text based chat.

    - Profanity filtering via CommunitySift.

    - Automated actions based on profanity rules.

- **In-game advertising and ad mediation**. Integrate with popular ad mediation providers for basic rewarded video ad tracking.

    - Support rewarded video ads with tracking reward offers.

- **A/B testing and experimenting**. Set up basic A/B tests, then track results.

    - Set up A/B tests with multiple buckets.

    - A/B test stores, rewarded video-ad offers, and game behavior.

    - Automated, server side rules that trigger based on in-game activities.

    - Scheduled scripts that can be set to run on a continuous, time-based schedule.

- **Custom server logic**. Easy ways to handle server logic to change game behavior without modifying game clients.

    - CloudScript. JavaScript and C# are supported.

    - Rules engine. Ability to set actions to fire based on any event passing through the pipeline in real-time.

    - Scheduled tasks. Run actions across all players in a given segment.

- **Customer support**. Tools to help your CS reps support your game.

    - Set permissions so CS reps cannot view data or make changes they shouldn’t.

    - Quickly locate and view player profiles, including historical player actions.

    - Edit player data, grant items or virtual currency, and send messages.

- **Compliance**. Help supporting relevant government regulations that apply to games.

    - GDPR. PlayFab is GDPR compliant and can help you be too.

    - COPPA. PlayFab is used today to support many COPPA-compliant games.

