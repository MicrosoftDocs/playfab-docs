---
title: Using Shared Group Data
author: xmcai2016
description: Tutorial about how to use Shared Group Data.
ms.author: chpalm
ms.date: 10/25/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, friends, groups
ms.localizationpriority: medium
---

# Using Shared Group Data

Shared Group Data is a simple way for players to share some information with a tightly constrained list of other players.

> [!NOTE]
> Shared Group Data was originally designed to be driven by server-authoritative for most cases, and the previous advice was to *not* add players directly to the Shared Group data, as that gave them read/write permissions (allowing for cheating). However, our new [API Access Policy](../../../api-references/api-access-policy.md) allows a much greater variance in functionality and security over the original design. More details are available in the advanced section of this document.

> [!WARNING]
> Shared Group Data should not be used by groups larger than a dozen or so players, at most. One issue is that too many players attempting to read the same data at the same time will result in delays reading the data (Shared Group Data is not *sharded* or *cached*, the way that data meant to be read by many players at once, like Title Data is). And special care should be taken to prevent players from over-writing each others data. In the instance that multiple players try to write to the same Key at the same time, only one of those writes will "win", resulting in the loss of the other user's data.

## Example: Turn-based multiplayer Async games

The original, and still best, use case for Shared Group data is best described as storing state for an online board game. players take turns modifying the data via CloudScript, with a clear turn order.

Players can log off and resume play later, with their game state stored in the cloud.

The following CloudScript example is the turn-based structure for any common board game. The board game itself is stubbed out as pseudo-code.

### Assumptions

The Shared Group Data that represents the game has already been started, and its membership is already defined.

```javascript
// CloudScript/Javascript
const MY_GAME_GROUP_KEYS: Array<string> = ["gameState", "currentPlayerTurn"];
interface PlayerTurnArgs {
    sharedGroupId: string;
    nextPlayerTurn: string;
    turnData: any;
}
handlers.TakePlayerTurn = function (args: PlayerTurnArgs) {
    var getRequest: PlayFabServerModels.GetSharedGroupDataRequest = { SharedGroupId: args.sharedGroupId, GetMembers: true, Keys: MY_GAME_GROUP_KEYS };
    var gameData: PlayFabServerModels.GetSharedGroupDataResult = server.GetSharedGroupData(getRequest);
    CheckValidPlayer(currentPlayerId, args.sharedGroupId, gameData.Members, gameData.Data["currentPlayerTurn"].Value, args.nextPlayerTurn);
    var newGameStateJson = UpdateGameState(args.turnData, gameData.Data["gameState"].Value);
    var updateRequest: PlayFabServerModels.UpdateSharedGroupDataRequest = {
        SharedGroupId: args.sharedGroupId,
        Data: {
            "gameState": newGameStateJson,
            "currentPlayerTurn": args.nextPlayerTurn
        }
    };
    server.UpdateSharedGroupData(updateRequest);
}
function CheckValidPlayer(playFabId: string, sharedGroupId: string, members: Array<string>, currentPlayerTurn: string, nextPlayerTurn: string): void {
    var validCurPlayer = false;
    var validNextPlayer = false;
    for (var m = 0; m < members.length; m++) {
        if (members[m] === playFabId)
            validCurPlayer = true;
        if (members[m] === nextPlayerTurn)
            validNextPlayer = true;
    }
    if (!validCurPlayer || !validNextPlayer) // Take extreme action against a player trying to cheat
    {
        server.BanUsers({ Bans: [{ PlayFabId: playFabId, Reason: "Trying to play a game you don't belong to: " + sharedGroupId }] });
        throw "You have been banned";
    }

    if (playFabId !== currentPlayerTurn)
        // May wish to additionally implement a spam-counter here and potentially take more extreme action for high-spam count
        throw "Not your turn";
}
function UpdateGameState(turnData: any, currentState: string): string {
    // PSEUDO-CODE-STUB: Update the turn-based game state according to the rules of this game
    return JSON.stringify({});
}
```

At a high level, you can use Shared Group Data to implement Parties/Raids, or other semi-permanent groups of players, as long as group size is relatively small, as stated.

While there's no strictly enforced limit currently, usage with many players is not supported, and in extreme cases may result in throttling of the title feature to prevent impact to others in the service.

### Key restrictions

- **Shared Group Data**:
  - Only contains simple Key/Value Pair data (strings). For use as any other data type (such as Inventory items, Statistics, Virtual Currency, etc.), the title must provide any necessary conversions.
  - Is neither *sharded* nor *cached*, so it will not be responsive when accessed simultaneously by multiple players. Features using it should be designed with small player groups in mind, and not allow for simultaneous writes.

### Client permission concerns

There is no role/rank system within a group, meaning any member in the group has absolute authority within the group (there is no defined leader).

Bluntly, what this means is that unless you disable the Client Shared Group Data methods with our [API Access Policy](../../../api-references/api-access-policy.md), the clients will have *complete control of the data*, which could result in exploitation of the data.

 Best practice is to either *not* use Shared Group Data for gameplay-impacting data, or to disable the Shared Group Data methods in the Client API.
