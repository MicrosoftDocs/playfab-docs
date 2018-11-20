---
title: Player Ban system
author: v-thopra
description: Shows how to utilize the ban system exposed through the PlayFab API and Game Manager.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, game manager, bans
ms.localizationpriority: medium
---

# Player Ban system

The Player Ban feature allows you to restrict access to the game for certain players that break the rules. Bans can be temporary or permanent.

The following tutorial shows you how to utilize the ban system using the PlayFab API and Game Manager.

## Identify

While your game may have a custom system to identify cheaters and rule-breakers, PlayFab offers a player-to-player reporting mechanism. In essence, you rely on your players to report other problematic players.

Use the following snippet in your client code to let the client report a specific player.

```csharp
public void ReportPlayer(string problematicPlayerId, string reason) {
    PlayFabClientAPI.ReportPlayer(new ReportPlayerClientRequest() {
        ReporteeId = problematicPlayerId,
        Comment = reason
    }, result => {
        //... Handle success
    }, error => {
        Debug.Log(error.GenerateErrorReport());
    });
}
```

This API call will produce:

- A report event, which you will be able to locate via the **Analytics** tool **(1)**. 
- Select the **player_reported_as_abusive** event type **(2)**. 
- This will show:
  - The **Event Name (3)**.
  - The reported **Player ID (4)**.

![Game Manager - Analytics - Event History](media/tutorials/game-manager-event-history-player-reported-as-abusive.png)  

## Applying Bans

Once the problematic player is identified, you may apply a ban. A community management rep may also apply a ban using **Game Manager**.

- Navigate to the **Players** tab **(1)**.
- Locate the problematic player **(2)**.
- Navigate to **Bans** settings **(3)**.
- Select the **Add Ban** button **(4)**:

![Game Manager - Players - Bans](media/tutorials/game-manager-players-bans.png)  

- An **Add Ban** form will appear. 
- Type in the **Reason** for the ban **(1)**.

- Choose if you want to **Ban permanently (2)**.
- Or specify the **Duration in hours (3)** you want the ban to be in effect.
- Optionally, you can ban by a specific **IP address (4)**.
- Finally, select the **Add Ban** button **(5)**.

![Game Manager - Players - Add Ban](media/tutorials/game-manager-players-add-ban.png)  

If everything is set correctly, you will see a new ban in the table.
- You may optionally remove the ban manually **(1)** by selecting it in the **Revoke Bans** field.

![Game Manager - Players - Bans - Revoke Ban](media/tutorials/game-manager-players-bans-revoke-ban.png)  

- Alternatively, you may use the Server SDK to apply a ban via code by using the snippet provided below.

```csharp
public void AddBan(string playerId, uint hours) {
    PlayFabServerAPI.BanUsers(new BanUsersRequest() {
        Bans = new List<BanRequest>() {
            new BanRequest() {
                DurationInHours = hours,
                PlayFabId = playerId,
                Reason = "Automatic ban for WH",
            }
        }
    }, result => {
        //... Handle success
    }, error => {
        Debug.Log(error.GenerateErrorReport());
    });
}
```

Bans applied via code will also be displayed in the table of bans for the target player in Game Manager.

> [!NOTE]
> The PlayFab Server SDK methods provide more options, such as IP and MAC address bans.

> [!NOTE]
> You can use CloudScript functions as part of an automated system that may ban a player. To find out more about CloudScript, see our tutorial [Writing Custom CloudScript](../../automation/cloudscript/writing-custom-cloudscript.md).

Each ban you apply gets an assigned ID. Consider the following Server SDK API methods for precise ban management:

- [GetUserBans](xref:titleid.playfabapi.com.server.accountmanagement.getuserbans)
- [RevokeAllBansForUser](xref:titleid.playfabapi.com.server.accountmanagement.revokeallbansforuser)
- [RevokeBans](xref:titleid.playfabapi.com.server.accountmanagement.revokebans)
- [UpdateBans](xref:titleid.playfabapi.com.server.accountmanagement.updatebans)
