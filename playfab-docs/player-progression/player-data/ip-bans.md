---
title: IP Ban System
author: t-phbertrand
description: Shows how to utilize the IP ban system exposed through the PlayFab API and Game Manager.
ms.author: t-phbertrand
ms.date: 7/30/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game manager, ip bans, bans
ms.localizationpriority: medium
---
# IP Ban System

The IP ban feature allows you to restrict access to the game from specified IP Addresses or ranges. When an IP ban is applied, future authentication attempts made from that IP address or within the banned range will be rejected. IP bans may be permanent or temporary with a specified expiration date, and may be applied to a single IP address or IP range with a CIDR block. An IP ban is scoped to a title and doesn't apply to any other titles in your [namespace](../../live-service-management/game-configuration/entities/index.md). 

The following tutorial shows you how to utilize the IP ban system, using the PlayFab API and Game Manager.

## Identify

You can identify an IP Address to ban through the PlayStream Monitor. If you notice suspicious login activity, on events titled **Player logged in** click the Curly Braces in the **JSON** column to view the event details. Here, you can copy the IP address the player logged in from by copying the data in the field **"IPV4Address"**. 

![Game Manager - IP Bans - Suspicious Login Event](media/tutorials/game-manager-ipbans-suspicious-login-event.png)  

> [!NOTE]
> If "Store full user IP addresses" in **Settings > Data Collection** is disabled for your title, the last 4 digits of the IP Address will be obfuscated. 

## Applying bans

If you deem it necessary, you might create an IP ban. There are two ways to create bans: manually through Game Manager, or programmatically through the [Services SDK](../../sdks/playfab-sdk-intro.md). 

> [!NOTE]
> A title may create IP Bans for up to 200 IP addresses or ranges.

### Creating an IP ban from Game Manager

 Your community management rep might want to apply a ban using Game Manager.

1. Navigate to the IP Bans section.
2. Select **New IP Ban** to display the **New IP Ban** form.
3. Paste the IP Address you wish to ban, or type in the CIDR range you with to ban.
4. Select permanent for a permanent ban, or select an expiration date and time for your ban.
5. Optionally, type in the reason for your ban
6. Last, select the **ADD BAN** button.

![Game Manager - IP Bans - New IP Ban](media/tutorials/game-manager-ipbans-new-ip-ban.png)  

If everything is set correctly, you see a new **IP Ban** in the table with status **"Active"**. 

![Game Manager - IP Bans - Table](media/tutorials/game-manager-ipbans-table.png) 

### Managing IP bans from Game Manager


You might optionally disable **IP Bans** manually by selecting them and then selecting **Disable selected bans**. It's status will become **"Disabled"**.

![Game Manager - IP Bans - Disable](media/tutorials/game-manager-ipbans-disable.png) 

You can edit a ban by clicking the IP Address field in the table. This brings you to the **Edit IP Ban** form. Here you can Disable (or reenable) bans as well as modify the expiration date and reason. Select **Save** to save your changes.

![Game Manager - IP Bans - Edit ](media/tutorials/game-manager-ipbans-edit.png) 

When a bans expiration date passes, its status becomes **"Expired"**. To reactivate the ban, you must define a new expiration date. Only **Active** IP bans will prevent logins.


### Creating a ban from a server or service
> [!WARNING]
> Due to their broad-reaching nature and potential high impact to players, we caution against automating or programmatically the creation IP Bans.
 

If you so wish to, you may use the [Services SDK](../../sdks/playfab-sdk-intro.md) to apply a ban via code by using the snippet provided below.

```csharp
public void CreateIPBan(string ipAddress, DateTime expirationDate) {
    PlayFabServerAPI.CreateIPBan(new BanUsersRequest() {
        Ban = new CreateIPBanRequest() {
                IPAddress = ipAddress,
                Expiration = expirationDate,
                Reason = "Automatic IP Ban"
        }
    }, result => {
        //... Handle success
    }, error => {
        Debug.Log(error.GenerateErrorReport());
    });
}
```

IP Bans applied via code are also displayed in the table of IP bans for the title in Game Manager.

## See Also

