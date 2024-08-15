---
title: Crafting Game - Context
author: fprotti96
description: Getting to know Economy V2 by a practical example of creating a crafting game
ms.author: fprotti
ms.date: 09/26/2023
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Crafting Game: Context

The purpose of this section is to go over the steps to create a "Crafting Game" using some of Economy V2's functions such as inventories, stores, bundles, and more!

> [!NOTE]
> This example was done using Visual Studio 2022 as a C# console application connecting directly to the PlayFab API, more specifically, the Economy V2 module.

## Game Context

Before starting, we must first establish a set of ground rules and requirements of our game.

You're building a simple text-based crafting game where you must combine various items to make ice cream! You'll be using the PlayFab Economy V2 system to store information about the various crafting recipes and the contents of the current player’s inventory.

### Base Items

The game has the following set of items:

- Stone
- Cut Stone
- Gold
- Electrical Doodad
- Icebox
- Cream
- Ice Cream

You need to create them when we reach the **Create an item** step.

### Starting Inventory

Each player should begin the game with the following items and amounts in their inventory.

- Three Stone
- One Gold
- One Cream

### Locations/Stores

All recipes should be grouped into three separate locations representing a unique store/marketplace that the player should access to perform crafting for those items.

Crafting a recipe/item should consume/deduct the number of items required as per the recipe/item price and granting the player whatever item is being crafted. The following list details all the locations and the recipes available in them.

#### Location 1: Science Machine

- Two Stones make one Cut Stone
- One Cut Stone + One Gold make one Electrical Doodad

#### Location 2: Alchemy Engine

- One Electrical Doodad + One Stone make one Icebox

#### Location 3: Kitchen

- One Cream + One Icebox make one Ice Cream

> [!NOTE]
> In the Kitchen, when crafting an Ice Cream, it takes 1 Icebox, nonetheless, the Icebox should not be consumable. In other words, after the transaction, there must be the same number of Icebox in the inventory as there was before.

### Other Functions

#### Reset Inventory

You can also add a function that enables the player to reset its inventory. You can choose to empty it or to reset it to the starting inventory items. You may want to use the **ExecuteInventoryOperations** API call that we explore further later.

## Using PlayFab

Now that we have the game context clear, you may be wondering how we can use PlayFab to tackle this. It's quite simple, when we talk about "Crafting"; PlayFab handles this as purchasing. The game's "Recipes" for crafting are also translated into PlayFab's prices. And in terms of the game's locations, these are just **Stores** in which a user can go and craft (purchase) an item.

For example, let's say a user wants to craft **One Icebox**, for which they will need **One Electrical Doodad** and **One Stone**, on the surface this will look like crafting, but behind the scenes what's going on is that the user is purchasing the **Icebox** for the price of **One Electrical Doodad** and **One Stone**. In this case, the list of **One Electrical Doodad** and **One Stone** is treated as the recipe for crafting the **Ice Box**, but in reality it's just the price list. For a user to craft the **Icebox** they have to go into the **Alchemy Engine** location in the game, which is just set up as a **Store** on GameManager.