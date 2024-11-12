---
title: Trading quickstart
author: joannaleecy
description: Describes how to perform player-to-player trading.
ms.author: joanlee
ms.date: 01/30/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, trading
ms.localizationpriority: medium
---

# Trading quickstart

> [!NOTE]
> This quickstart assumes you are already familiar with both catalogs and inventory items. The example player must already own the inventory items they wish to trade away.

The first step is to call the `OpenTrade` API, to make a trade available to another player. You will need a `playfabId` to identify the gift recipient, and the `ItemInstanceID` for the player who currently has the item in their Inventory.
  
`secondPlayerId`: This is the unique string that identifies the gift recipient (`PlayFabId`).

`myItemInstanceId`: This is the unique string that identifies an item instance owned by the current player (`InstanceID`).

```csharp
void GiveItemTo(string secondPlayerId, string myItemInstanceId) {
    PlayFabClientAPI.OpenTrade(new OpenTradeRequest {
        AllowedPlayerIds = new List<string> { secondPlayerId }, // PlayFab ID for the friend who will receive your gift
        OfferedInventoryInstanceIds = new List<string> { myItemInstanceId } // The item instanceId fetched from GetUserInventory()
    }, LogSuccess, LogFailure);
}
```

> [!NOTE]
> All trades are public information. Any player may look at the open trades of another player, as well as another player's trade history (If they know the `playFabId` of that player).

In this snip the `LogSuccess` callback must also evaluate `result.Trade.TradeId`, and transfer both `firstPlayFabId` and the `tradeId` to the second player. If not saved, it will not be possible for the second player to evaluate or accept the trade.
  
> [!NOTE]
> In the current preview you need to ensure that your trades are thread-safe from concurrent actions. Thread-safe options include custom game servers and Webhook calls via CloudScript to an external database/system. Thread-Unsafe options can be built with CloudScript which directly modifies a Player Data Key. The latter option has concurrency issues where simultaneous trade-list-updates may not process correctly.

Once the first player has created the trade, and transferred their `playFabId` and the `tradeId` to the second player, the second player can examine the trade requirements (verifying it is a gift) by making a `GetTradeStatus` request.

> [!NOTE]
> The most relevant **TradeStatus** values are **Open**, **Filled**, and **Canceled**. All other states are intermediate states. Trades may stay in those intermediate states for a noticeable period of time between calls. A recently-modified trade may not be available immediately.

```csharp
void ExamineTrade(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.GetTradeStatus(new GetTradeStatusRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}

If the requirements of that trade are acceptable, the gift can be accepted using AcceptTrade
C# snip
void AcceptGiftFrom(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.AcceptTrade(new AcceptTradeRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```

Once complete, the `AcceptGiftFrom` function above will transfer the gifted items from the first player's inventory to the second.
