---
title: Transaction History
author: wesjong
description: Overview of using Economy v2 Transaction History API.
ms.author: wesjong
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, inventory
ms.localizationpriority: medium
---

# Transaction History

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The Economy v2 Inventory service has a Transaction History API that allows you to get a view of all the operations performed on a player's inventory. This data can be used to help track usage of game systems, troubleshoot bugs, and identify malicious actors.

Transaction Histories are grouped by a player's different Inventory Collections with each Collection having its own history. More information about using `CollectionId`s and having multiple inventories per player can be found [here](collections.md).

Some events such as CollectionCreated and CollectionDeleted aren't presented in the transaction history.

## Getting a Player's Transaction History

### [Game Manager](#tab/transaction-history-game-manager)

1. In [Game Manager](../../../gamemanager/index.md), navigate to `Players`
1. Select the player you wish to view, then go to `Transaction History`

### [API](#tab/transaction-history-api)

You can use the `GetTransactionHistory` API to get player's transaction history. A `CollectionId` parameter is passed in to indicate which Inventory Collection's History to view. Player's are limited to only accessing their own transaction histories. Title Entities can pass in an `Entity` parameter to indicate which player's transaction history they wish to access.

The `Filter` parameter can be used to pass in timestamp constraints that allow you to see a specific time window of transactions. `Filter` only supports `timestamp ge` (greater-than-or-equal) and `timestamp le` (less-than-or-equal) and there's a maximum limit of a six-month long timestamp period for viewing transaction history.

An example `GetTransactionHistory` request:

```json
{
    "Entity": {
        "Id": "ABCD12345678",
        "Type": "title_player_account",
    },
    "CollectionId": "default",
    "Count": 10,
    "Filter": "timestamp ge 2021-12-30T23:00Z and timestamp le 2021-12-31T23:00Z"
}
```

#### Continuation Tokens

The `ContinuationToken` field that is returned from a response can be passed into a transaction history request to paginate through multiple counts of results.
