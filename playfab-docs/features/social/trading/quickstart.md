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

The **PlayFab Client API** allows **Players** to **Trade** items with each other. These **API** methods are enabled by default, so for the security of your **Title**, you may need to use our [API Access Policy](../../config/gamemanager/api-access-policy.md) to disable them.

### BETA mode

Currently we're in **BETA** mode as we work on expanding our functionality. So **Inventory Trading** functionality is in a *prototype* phase for the time being.

The methods are functional, but lack some useful elements that would make it a *complete* feature. You cannot request or trade [Virtual Currency](../../commerce/economy/currencies.md), and **PlayFab** does not provide a list of **Trades** that are available to you from other **Players**.

In addition, the **Trading** methods are *only* available in the **Client APIs** listed in our [PlayFab API Reference documentation](../../../api-references/index.md), and *not* available in the **Server APIs**.

> [!NOTE]
> All **Trades** are public information. Any **Player** may look at the open **Trades** of another **Player**, as well as another **Player's** trade history (if they know the **playFabId** of that **Player**).

## Prerequisites
- This Quickstart assumes you are already familiar with [Item Catalogs](../../commerce/items/catalogs.md) and [Inventory](../../data/playerdata/player-inventory.md).
- The example **Player** must *already own* inventory items they wish to **Trade** away.

## Example Case: Gift items between Players

First step, call [OpenTrade](xref:titleid.playfabapi.com.client.trading.opentrade) to make a **Trade** available to another **Player**. In this example we require input parameters to the outer function **GiveItemTo**, specifically:

- **secondPlayerId**: This is the unique string that identifies the gift recipient (**PlayFabId**).
- **myItemInstanceId**: This is the unique string that identifies an item instance owned by the current **Player**.

```csharp
void GiveItemTo(string secondPlayerId, string myItemInstanceId) {
    PlayFabClientAPI.OpenTrade(new OpenTradeRequest {
        AllowedPlayerIds = new List<string> { secondPlayerId }, // PlayFab ID for the friend who will recieve your gift
        OfferedInventoryInstanceIds = new List<string> { myItemInstanceId } // The item instanceId fetched from GetUserInventory()
    }, LogSuccess, LogFailure);
}
```

In this example, the LogSuccess callback must also evaluate [result.Trade](xref:titleid.playfabapi.com.client.trading.opentrade#tradeinfo).TradeId, and transfer both firstPlayFabId and the tradeId to the second player. If not saved, it will not be possible for the second player to evaluate or accept the trade. Thread-safe options include [custom game servers](../../multiplayer/compute/custom-game-servers.md) and [making Webhook calls from CloudScript](../../automation/cloudscript/making-webhook-calls-from-cloudscript.md) to an external database/system. Thread-Unsafe options can be built with CloudScript which directly modifies a [Player Data](../../data/playerdata/quickstart.md) key. The latter option has concurrency issues where simultaneous trade-list-updates may not process correctly, but this issue can be worked around (This is an advanced topic for a future guide).

Once the first **Player** has created the **Trade**, and transferred their **PlayFabId** and the **tradeId** to the second **Player**, the second **Player** can examine the **Trade** requirements (verifying it is a gift).

```csharp
void ExamineTrade(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.GetTradeStatus(new GetTradeStatusRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```

And if the requirements of that **Trade** are acceptable, accept the gift.

```csharp
void AcceptGiftFrom(string firstPlayFabId, string tradeId) {
    PlayFabClientAPI.AcceptTrade(new AcceptTradeRequest {
        OfferingPlayerId = firstPlayFabId,
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```

Once complete, the AcceptGiftFrom function in the previous code example will transfer the gifted items from the first **Player's** inventory to the second.

## Example Case: Player management of multiple open trades

Once a **Player** has started utilizing the **Trade** feature, they may have many **Trades** open and available to other **Players**. While a **Trade** is pending, the items are held in escrow, making them unavailable to the **Player**. If a **Trade** is never accepted, the items stay in escrow, unavailable to the **Player**.

PlayFab allows a **Player** to manage their own open **Trades**, specifically giving them the chance to view and cancel.

**Prerequisite**:

- A **Player** has at least 1 open **Trade** which has not been accepted.

```csharp
void GetOpenTrades() {
    PlayFabClientAPI.GetPlayerTrades(new GetPlayerTradesRequest {
        StatusFilter = TradeStatus.Open
    }, LogSuccess, LogFailure);
}
```

> [!NOTE]
> The most relevant [TradeStatus](xref:titleid.playfabapi.com.client.trading.getplayertrades#tradestatus) values are **Open**, **Filled**, and **Canceled**. All other states are intermediate states. **Trades** may stay in those intermediate states for a noticeable period of time between calls. A recently-modified **Trade** may not be available immediately.

**Best Practice**: Give the users a **Refresh** button and some text informing them that some **Trade** transactions have a noticeable delay.

Once complete, the LogSuccess callback in the previous example will receive a list of all trades in the "Open" status. To allow **Players** to cancel a **Trade** and recover the items from escrow, let them select a **TradeId** from the results above, and call this.

```csharp
void RecoverTradeItems(string tradeId) {
    PlayFabClientAPI.CancelTrade(new CancelTradeRequest
    {
        TradeId = tradeId
    }, LogSuccess, LogFailure);
}
```
