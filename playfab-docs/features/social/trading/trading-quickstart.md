---
title: Trading Quickstart
author: v-thopra
description: Describes how to perform player-to-player trading.
ms.author: v-thopra
ms.date: 29/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, social, trading
ms.localizationpriority: medium
---

# Trading Quickstart

The PlayFab client API allows players to trade items with one another. These API methods are enabled by default, so for the security of your title you may need to use our [API Access Policy](../../config/gamemanager/api-access-policy.md) to disable them.

**BETA**: Our inventory-trading functionality is in a prototype phase. The methods are functional, but lack some useful elements that would make it a complete feature. You cannot request or trade [Virtual Currency](../../commerce/economy/currencies.md), and PlayFab does not provide a list of trades that are available to you from other players. Finally, the Trading methods are only available in the Client APIs listed in our [PlayFab API Reference documentation](../../../api-references/index.md), and not available in the Server APIs.

> [!NOTE]
> All trades are public information. Any player may look at the open trades of another player, as well as another player's trade history (If they know the playFabId of that player)

## Prerequisites

- This Quickstart assumes you are already familiar with [Item Catalogs](../../commerce/items/catalogs.md) and [Inventory](../../data/playerdata/player-inventory.md).
- The example player must already own inventory items they wish to trade away.

## Example Case: Gift items between Players

First step, call [OpenTrade](xref:titleid.playfabapi.com.client.trading.opentrade) to make a trade available to another player. In this example we require input parameters to the outer function GiveItemTo, specifically:

- secondPlayerId: This is the unique string that identifies the gift recipient (PlayFabId).
- myItemInstanceId: This is the unique string that identifies an item instance owned by the current player.

```csharp
void GiveItemTo(string secondPlayerId, string myItemInstanceId) {
    PlayFabClientAPI.OpenTrade(new OpenTradeRequest {
        AllowedPlayerIds = new List<string> { secondPlayerId }, // PlayFab ID for the friend who will recieve your gift
        OfferedInventoryInstanceIds = new List<string> { myItemInstanceId } // The item instanceId fetched from GetUserInventory()
    }, LogSuccess, LogFailure);
}
```

In this example, the LogSuccess callback must also evaluate [result.Trade](https://api.playfab.com/documentation/Client/datatype/PlayFab.Client.Models/PlayFab.Client.Models.OpenTradeResponse).TradeId, and transfer both firstPlayFabId and the tradeId to the second player. If not saved, it will not be possible for the second player to evaluate or accept the trade. Thread-safe options include [custom game servers](../../multiplayer/compute/custom-game-servers.md) and [making Webhook calls from CloudScript](../../automation/cloudscript/making-webhook-calls-from-cloudscript.md) to an external database/system. Thread-Unsafe options can be built with CloudScript which directly modifies a [Player Data](../../data/playerdata/using-player-data.md) key. The latter option has concurrency issues where simultaneous trade-list-updates may not process correctly, but this issue can be worked around (This is an advanced topic for a future guide).

Once the first player has created the trade, and transferred their PlayFabId and the tradeId to the second player, the second player can examine the trade requirements (verifying it is a gift):

```csharp
void ExamineTrade(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.GetTradeStatus(new GetTradeStatusRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```

And if the requirements of that trade are acceptable, accept the gift:

```csharp
void AcceptGiftFrom(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.AcceptTrade(new AcceptTradeRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```

Once complete, the AcceptGiftFrom function in the previous code example will transfer the gifted items from the first player's inventory to the second.

## Example Case: Player management of multiple open trades

Once a player has started utilizing the trade feature, they may have many trades open and available to other players. While a trade is pending, the items are held in escrow, making them unavailable to the player. If a trade is never accepted, the items stay in escrow, unavailable to the player.

PlayFab allows a player to manage their own open trades, specifically giving them the chance to view and cancel.

**Prerequisite**:

- A player has at least 1 open trade which has not been accepted.

```csharp
void GetOpenTrades() {
    PlayFabClientAPI.GetPlayerTrades(new GetPlayerTradesRequest {
        StatusFilter = TradeStatus.Open
    }, LogSuccess, LogFailure);
}
```

> [!NOTE]
> The most relevant [TradeStatus](xref:titleid.playfabapi.com.client.trading.getplayertrades#tradestatus) values are Open, Filled, and Canceled. All other states are intermediate states. Trades may stay in those intermediate states for a noticeable period of time between calls. A recently-modified trade may not be available immediately.

**Best Practice**: Give the users a refresh button and some text informing them that some Trade transactions have a noticeable delay.

Once complete, the LogSuccess callback in the previous example will receive a list of all trades in the "Open" status. To allow players to cancel a trade and recover the items from escrow, let them select a tradeId from the results above, and call this:

```csharp
void RecoverTradeItems(string tradeId) {
    PlayFabClientAPI.CancelTrade(new CancelTradeRequest
    {
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```
