---
title: Manage Virtual Currencies in Economy (Legacy)
author: cybtachyon
description: Describes the Currency tab in the (Legacy) Economy section in Game Manager, and how to configure virtual currencies.
ms.author: derekreese
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, currency, virtual currency
ms.localizationpriority: medium
---

# Currencies (Legacy Economy)

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

This tutorial describes the function of the **Currency** tab in the **Economy** section in **Game Manager**. Use this tab to configure virtual currencies to use in your game.

Virtual Currencies are the foundation of in-game economies. Players and characters can be granted these currencies, which they can use to buy or trade items. Items have a cost in either virtual currency or real money.

It's *exactly* like real life - except it's *virtual!* Economic regulation in-game is up to *you*.

## What is virtual currency?

Virtual currencies provide a medium of exchange for players to purchase virtual items and services from within a title.

Each title supports multiple virtual currencies, providing flexibility for your game to implement any medium of exchange you desire (for example, gold, gems, hearts or interstellar credits).

After the initial setup, store and catalog items can be assigned prices corresponding to the virtual currencies.

Our Game Manager provides tools to make managing your virtual economy straightforward and reliable.

## Field reference

This section describes each field in the **Currency** section of the **Economy** area in **Game Manager**. The following are the fields in the **New Currency** screen, which you use to create and maintain the virtual currencies that make up your in-game economy.

- **Currency code** and **Display name** are *required* fields with no default values. The other fields have a default value of **zero**.

- Leaving **Recharge rate** and **Recharge maximum** set to **zero** (default) specifies that this currency amount will not auto-regenerate.

![Game Manager - Economy - Currency - New Currency](../media/tutorials/game-manager-economy-currency-new-currency-blank.png)  

### Currency code

**Currency code** is a *required* field. It represents the currency, and is used in the other economy sections.

It must be a two-character code, and the convention is *all upper-case* (although a two-digit number is also allowed).

> [!NOTE]
> **RM** is reserved for Real Money and cannot be used as a Currency Code.

### Display name

**Display name** is a *required* field. It represents the name that is attached to the currency that is typically displayed to the user in your game.

The only restriction is that it must be *at least one letter long*. Common examples include **Gold** or **Space Bux**.

### Initial deposit

**Initial deposit** indicates how much of this virtual currency is given to each player when they first sign-up for a PlayFab account (which is typically the first time they play your game).

### Recharge rate (units per day)

**Recharge rate** is an *optional* field. It specifies how much of this virtual currency is granted to each player per day. Virtual currency that is granted to the player via a recharge rate is granted to them *gradually*, and is evenly distributed over a 24 hour period.

### Recharge maximum

**Recharge maximum** is an *optional* field. It specifies the maximum amount of this virtual currency that can be granted to each player per day.

## Example

To create a virtual currency, use the following steps:

1. Select your **Game** in **Game Manager**.
2. Choose **Economy**.
3. Select **Currency**.
4. Choose **NEW CURRENCY**.
5. Set the **Currency code**. We use **GD** in this example.
6. Set the **Display name**. We use **Gold** in this example.
7. Set the **Initial deposit**. We use **1000** in this example. This gives new players **1,000 units** of this virtual currency when they begin the game.
8. By leaving the **Recharge rate** and **Recharge maximum** at the default value of **0** - we don't give the players any additional virtual currency every day, so we're done.
9. Select **SAVE CURRENCY**.

These steps return you to the **Currencies** screen where you can see that your new virtual currency is added.

For any subsequent operations on your currency, such as deleting, renaming, or modifying the recharge values, select the **Code** or **Display name** of your currency to open the **Edit Currency** screen.

The grayed-out **Currency code** means your new currency has been saved.

![Game Manager - Economy - Currency - Edit Currency](../media/tutorials/game-manager-economy-currency-edit-currency.png)  
