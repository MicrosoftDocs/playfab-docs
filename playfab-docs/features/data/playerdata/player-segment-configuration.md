---
title: Player Segment configuration
author: v-thopra
description: Describes the basics of Player Segment configuration.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, game manager, player data, segements
ms.localizationpriority: medium
---

# Player Segment configuration

The **Segment** configuration page allows you to configure new or existing **Segments**.  You can:

- Adjust the **Name**.
- Define the filters.
- Assign tasks. 

Each **Segment** allows you to define useful or interesting groups of **Players**, and perform exclusive actions on that **Group**.

## How to create or access a Segment

To access **Segment** configuration:

- Go to the menu on the left of your screen and select **Players (1)**.
- Then select the **Segments** tab **(2)**. You can then opt to:

     - To use the **New Segment** button **(3)** to create and configure a new **Segment**.
     - Locate an existing **Segment** and select its **Name** label **(4)** to configure the **Segment**.

![Game Manager - Players - Create or access Segments](media/tutorials/game-manager-create-or-access-player-segments.png)  

## How to configure a Segment

### Prerequisites

Some things must preexist for you to configure a **Segment**.  There must be:

- **Players** with and without a distinctive characteristic defined in **PlayFab**.
- A defined **CloudScript PlayStream** hook.

> [!NOTE]
> For more about this, see [Using CloudScript actions with PlayStream](../../automation/actions-rules/using-cloudscript-actions-with-playstream.md).

### Configuring

In this example we are going to:

- Configure a **Segment** using the **defining characteristic** all players that come from Canada.
- Run a **CloudScript** function **helloWorld** for each **Player** that enters the **Segment**.

A **defining characteristic** of a **Player** might be a:

- Login time
- Linked device type
- Tags
- A real-world location
- Their statistic values
- Their virtual currency values
- Real money purchases, etc.

> [!Note]
> **Player country** is only *one* of your many possible options, and is only required for this example. Feel free to replace the country requirement with another filter of your choice.

When a **Segment** is defined, you have a variety of action options to run when a **Player** enters or leaves the **Segment**.

 **CloudScript** is by far the most flexible action, granting you full control of the **Player** and **Segment** information at the time of **Segment**-transition.

Use the second parameter, **context** in your [CloudScript handler](../../automation/actions-rules/using-cloudscript-actions-with-playstream.md) to identify the **Player** and **Segment** transition. Afterwards, you can perform any action you wish for the **Player**, such as granting [inventory items](../../data/playerdata/player-inventory.md), [virtual currency](../../commerce/economy/currencies.md), [player data](../../data/playerdata/quickstart.md), or [statistics](using-player-statistics.md).

In our example shown here, the **Segment** configuration requires 4 simple steps.

1. Assign an appropriate **Segment name (1)** (in our example, that's **Canadian Players**).

1. In the **Player (2)** area, assign any conditions that the **Player** must meet to enter the **Segment**. (In our example, we want a **Location: country** filter with a strict value: **Canada**.
1. In the **Type** area, add an **Execute CloudScript (3)** action for the entered **Segment** trigger.
1. Configure the action to run the function we want (**helloWorld (3)**).
1. Use the **Save Segment** button **(4)** to commit your activities.

![Game Manager - players - new segment configuration](media/tutorials/game-manager-players-new-segment-configuration.png)  


## Advanced Segment filtering

**Segment** filtering allows you to define what **Players** are included in the **Segment**. Formally speaking, **Segment (1)** on the left of your screen is a set of **Players** that belong to at least one group.

**Group (2)** is a set of **Players** that meet all defined conditions (called **filters (3)**).

![Game Manager - players - advanced segment filtering](media/tutorials/game-manager-players-advanced-segment-filtering.png)  

So to be part of a **Segment**:

- A **Player** must be part of at least 1 **Group**.

     - To be part of a **Group**, a player must meet all conditions (filters).
     - This is denoted by the **OR/AND** operators: 
          - Filters are combined using the **AND** operator.
          - **Groups** are combined using the **OR** operator.

The screenshot shown above is an example of how a **Segment** can be defined. This **Segment** consists of 2 **Groups**:

1. The first **Group** is defined by 2 filters:

     1. A **Player** must be from Canada
     1. And must have **Apple** push notifications enabled.
1. The second **Group** is *also* for **Players** from Canada, but they must have **Google** push notifications enabled.

In the end, we have a **Segment** of **Players** from Canada with either **Google** or **Apple** push notifications.

Each filter has a unique configuration and purpose. As of 4/30/2017 the following filters are available:

- **All Players** filter - This filter has no configuration and is unique, because it allows you to create a **Segment** of all **Players**. This comes in handy when you want to run automatic operations for every new **Player** (**Segment** actions are described later in this tutorial).

- **First login (date)** filter - Allows you to filter based on the first login datetime. For example, **Players** that have first logged in after 1/1/2017.
- **First login (timespan)** filter - Allows you to filter based on first login timespan relative to the current datetime (example - **Players** that have first signed in 20 minutes ago [from now]).
- **Last login (date)** filter - Allows you to filter based on the last login datetime (example - **Players** that have not signed in since 1/1/2017).
- **Last login (timespan)** filter - Allows you to filter based on the last login timespan relative to the current datetime. For example, **Players** that have not signed in for a week [from now]).
- **Linked user account to** filter  - Allows you to filter based on the **Users'** linked accounts (example - **Players** that have a **Steam** account linked with email).
- **Location (country)** filter - Allows you to filter based on a **Player's** country (example - **Players** from Canada).
- **Push notifications enabled with** filter - Allows you to filter based on **Player** push notification settings and capabilities (example - **Players** that have **Google** push notifications enabled.
- **Statistics value** filter - Allows you to filter based on your own custom statistic attribute (example - **Players** that inflicted 20000 damage in total).
- **Tag** filter - Allows you to filter based on whether a **Player** has or doesn't have a certain tag (example - **Players** that have a **cheater** tag).
- **Total value to date in USD** filter - Allows you to filter based on how much USD currency a **Player** spent in your game (example - **Players** that have spent over $30.
- **Value to date** filter - Allows you to filter based on how much of a certain currency a **Player** spent in your game (example, **Players** that have spent 50 RUB).
- **User Origination** filter - Allows you to filter based on the first authentication method that a **Player** used to start playing the game.

> [!NOTE]
> The trick here is that a **Player** may start with authentication based on, say, an **iOS Device I**D. Later, a **Player** may have a **GameCenter** account linked. In this case, the **Player** origination will be the **iOS Device ID** (example, **Players** that first signed in using an **iOS Device ID**).
- **Virtual currency balance** filter - Allows you to filter based on a **Player's** custom virtual currency deposit (example, **Players** that have less than 50 Crystal).

## How to manage actions

Each action needs a **Trigger** in order to run. Some actions are run manually, triggered right from the page.

Sometimes, though, you have to select a **Trigger** - an event that causes an action to run. A **Trigger** defines the context of the action.

For example, the **Player Entered Segment Trigger** passes you the context containing a reference to the **Player**.

The general workflow for the **Actions** panel is the following:

1. Select an **event condition (1)** a.k.a a **Trigger**.

2. Select the **Type** of action.

> [!NOTE]
> **PlayFab** offers a variety of actions. If, at any point, you need a more flexible action, consider a **CloudScript** action. This action type allows you to run your own **CloudScript** function.

3. **Configure the action (3)** (specific for each action type).

4. **Remove an action (4)** from the **Trigger**.
5. Use **Add Action (5)** to add an action to the **Trigger**.

![Game Manager - Players - Actions panel](media/tutorials/game-manager-players-actions-panel.png)  


## How to inspect player Segments

It is possible to look up what **Segments** a **Player** belongs to by means of the **Player Segments** page. To access **Player Segments**:

- Select **Players** in the sidebar menu **(1)**.

- Then select the **Players** tab **(2)**. 
- Locate the **Player** you want to inspect, and select the **ID** label **(3)**.
- Finally, select **Segments** in the **Players Toolbar (4)**.

![Game Manager - players - access segments](media/tutorials/game-manager-access-player-segments-2.png)  

On the **Player Segments** page, you will see the following:

- The **Player ID (1)** label identifies the **Player** that you are currently inspecting.

- The **Segment** table contains a list of all the **Segments** that a **Player** belongs to.
-  Select the **Segment name** label **(2)** to configure the **Segment**.

![Game Manager - Players - Access Segments](media/tutorials/game-manager-player-segments-page.png)  
