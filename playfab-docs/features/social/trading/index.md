---
title: Trading
author: joannaleecy
description: Landing page for Trading.
ms.author: joanlee
ms.date: 01/30/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, trading
ms.localizationpriority: medium
---

# Trading

The PlayFab client API allows players to trade items with one another. These API methods are enabled by default, so for the security of your title you may need to use our policy API to disable them.

> [!NOTE]
> Inventory-trading functionality is in a preview phase. The methods are functional, but lack some useful elements that would make it a complete feature. Currently you can only trade virtual items. You cannot request or trade virtual currency, and PlayFab does not provide a list of trades that are available to you from other players. Trade methods are only available in the client API, and not available from the server API.

## Key concepts

**Catalog** - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item that is available in your game.

**Catalog Items** – PlayFab Items can represent just about any type of virtual goods that you might use - from durables, to bundles to locked containers.

**Inventory** - All accounts (player accounts and character accounts) have an inventory. The inventory contains all owned item instances, as well as item history.

**Virtual Currency** - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase items from a catalog or store, can represent soft currency converted from in-app purchases, or they can be used as a mechanic to drive gameplay.

## Prerequisites

Trading requires familiarity with both catalog and inventory items. Players must own inventory items they wish to trade.

## APIs

Trading flow is handled by a handful of APIs:

[OpenTrade](xref:titleid.playfabapi.com.client.trading.opentrade)  
Opens a new outstanding trade. This can between two specific players (PlayfabIDs) or with one player opening a trade open to anyone. Understand that any single given item instance may only be in one open trade at a time.

[GetTradeStatus](xref:titleid.playfabapi.com.client.trading.gettradestatus)  
Allows a client to evaluate a given trade by getting its current status.

[AcceptTrade](xref:titleid.playfabapi.com.client.trading.accepttrade)  
Accepts an open trade. If the call is successful, the offered and accepted items will be swapped between the two players' inventories.

[CancelTrade](xref:titleid.playfabapi.com.client.trading.canceltrade)  
Cancels an open trade. Note that only the player who created the trade can cancel it via this API call, to prevent grief.

[GetPlayerTrades](xref:titleid.playfabapi.com.client.trading.getplayertrades)  
**GetPlayerTrades** will return all trades a player has either opened or accepted, optionally filtered by trade status.
