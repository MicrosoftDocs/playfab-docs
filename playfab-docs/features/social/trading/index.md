---
title: Trading
author: thomasgu
description: Landing page for Trading.
ms.author: tomg
ms.date: 30/01/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, social, trading
ms.localizationpriority: medium
---

# Trading

The PlayFab client API allows players to trade items with one another. These API methods are enabled by default, so for the security of your title you may need to use our Policy API to disable them.
 
NOTE: Inventory-trading functionality is in a preview phase. The methods are functional, but lack some useful elements that would make it a complete feature. Currently you can only trade Virtual Items. You cannot request or trade Virtual Currency, and PlayFab does not provide a list of trades that are available to you from other players. Trade methods are only available in the Client API, and not available from the Server API. 
 
## Key concepts
  
Catalog - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item that is available in your game.

Catalog Items – Playfab Items can represent just about any type of virtual good that you might use, from Durables, to Bundles to Locked containers.

Inventory - All accounts (player accounts and character accounts) have an inventory. The inventory contains all owned Item Instances as well as item history.    

Virtual Currency - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase Items from the Catalog or a Store, can represent soft currency converted from In App Purchases, or can be used as a mechanic to drive gameplay. 
 
## Prerequisites

Trading requires familiarity with both Catalogs and Inventory Items. Players must own Inventory Items they wish to trade.

## APIs

Trading flow is handled by a handful of APIs: 

OpenTrade  
Opens a new outstanding trade. This can between two specific players (PlayfabIDs) or with one player opening a trade open to anyone. Note that any one given item instance may only be in one open trade at a time. 

GetTradeStatus  
Allows a client to evaluate a given trade by getting its current status. 
 
AcceptTrade  
Accepts an open trade. If the call is successful, the offered and accepted items will be swapped between the two players' inventories. 

CancelTrade  
Cancels an open trade. Note that only the player who created the trade can cancel it via this API call, to prevent griefing. 

GetPlayerTrades  
Get Player trades will return all trades a player has either opened or accepted, optionally filtered by trade status. 