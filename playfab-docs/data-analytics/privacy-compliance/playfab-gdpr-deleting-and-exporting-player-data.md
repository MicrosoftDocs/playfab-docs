---
title: PlayFab GDPR - Deleting and Exporting Player Data
author: Shikha-tarware
description: How to use PlayFab Admin APIs to export or delete a player’s data so that you can be General Data Protection Regulation (GDPR) compliant.
ms.author: shtarwar
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, playerdata, gdpr, compliance, admin api
ms.localizationpriority: medium
---

# PlayFab GDPR - Deleting and exporting player data

PlayFab is committed to being General Data Protection Regulation (GDPR) compliant - and as your service provider, ensuring that we provide you with the hooks you need to allow players to view or delete the data stored about them.

While we can’t provide you with legal advice—*and we do encourage you to seek legal counsel to ensure your compliance with the GDPR*—we're here to help you fulfill your obligations under GDPR.

PlayFab has three available APIs to help you respond to Player data requests:

- [GetPlayedTitleList](xref:titleid.playfabapi.com.admin.accountmanagement.getplayedtitlelist) - Call this API to get a list of TitleIds, which have data associated with the given player. This list is scoped by PublisherID and represents the set of titles that would be impacted if you were to delete or export this player's data.
- [DeleteMasterPlayerAccount](xref:titleid.playfabapi.com.admin.accountmanagement.deletemasterplayeraccount) - Call this API to delete the records of a given player.
- [ExportMasterPlayerData](xref:titleid.playfabapi.com.admin.accountmanagement.exportmasterplayerdata) - Call this API to export all of the associated data and records of a given player.

## Make sure you find all the data

Before using the `DeleteMasterPlayerAccount` or `ExportMasterPlayerData` APIs, it's important to keep in mind that your players might have created multiple Master Player accounts with your studio.

This situation can happen when a player uses different devices or different credentials to play your title(s). Because they're providing different and unrelated credentials (for example, a different email address or social media account), we interpret them to be a unique player.

Another way a player may have multiple Master Player accounts is if you have configured your studio to use multiple Publisher IDs; however, having multiple Publisher IDs isn't common.

You can check your title's Publisher IDs in the PlayFab Game Manager, on each Title settings menu's **API Features** tab.

![PlayFab - Settings - API Tab](../../features/playerdata/media/tutorials/playfab-settings-api-tab.png)  

You know your titles and how they authenticate your players. Before calling `DeleteMasterPlayerAccount` or `ExportMasterPlayerData`, make sure you collect the right set of device IDs and/or credentials from your players.

With these credentials, we can identify the PlayFabIds for *each* Master Player account.

The following APIs help you translate from credentials to `PlayFabId`:

- [GetUserAccountInfo](xref:titleid.playfabapi.com.admin.accountmanagement.getuseraccountinfo) - This API helps you find players by email, `TitleDisplayName`, `PlayFabId`, or a `PlayFabUsername`.
- [GetPlayerIdFromAuthToken](xref:titleid.playfabapi.com.admin.accountmanagement.getplayeridfromauthtoken) - This API allows you to find a player from a specific `AuthToken` which is granted to the player when they log in.
- [GetPlayFabIDsFromFacebookIDs](xref:titleid.playfabapi.com.server.accountmanagement.getplayfabidsfromfacebookids) - This API derives the player's `PlayFabId` from one or more `FacebookId`(s).
- [GetPlayFabIDsFromSteamIDs](xref:titleid.playfabapi.com.server.accountmanagement.getplayfabidsfromsteamids) - This API derives the player's `PlayFabId` from one or more `SteamIds`.

> [!NOTE]
> All of these APIs are title-specific. The first two are Admin APIs and the last two are Server APIs.

Even if your player only has one PlayFabId, they may have played more than one of your titles with that ID. Which means their data request may span multiple titles.

To get this list of titles, call `GetPlayedTitleList` for each PlayFabId. You *may* wish to inform the player their request will affect the returned list of titles.

Additionally, `GetPlayedTitleList` returns `TitleIds`, *not* `Title Names` - consider converting these IDs to `Title Names` before displaying them in a confirmation page.

Here's a little pseudo code to paint a better picture of what we mean...

```csharp
//Here you would iterate through a request of known Ids, Emails, linked accounts  
//or other PlayFab searchable info on the player that you have.
//and store it in user credentials for that player.
user {
  credentials: (email/ids/linked accounts)
}

//create a variable to hold a list of all the PlayFabIds you want to remove.
PlayFabIdList

//create a list of affected titles
AffectedTitles


//Keep track of all your titles, this is important
//and should include all titles across all your namespaces.
foreach(title in <all my titles>){

    //each user record you have for the player, you should have a list of credentials for that player
    //so you can find them in PlayFab
    foreach(cred in user.credentials){
      //There are a few helper Admin and Server API's that help you do this part.
      //See below this pseudo code block for some tips!
      pfid = <find PlayFabId in Title using the credential>
      PlayFabIdList.add(pfid)
    }

    //go through the list of PlayFabIds that you have and fine all titles that
    //performing the action would affect
    foreach(pfid in PlayFabIdList){
      AffectedTitles = title.GetPlayedTitleList(pfid)
    }
}
```

Here's a quick example on how to use **GetPlayedTitleList**.

```csharp
public static async void StartFindTitlesExample(Action<PlayFabError> callback)
{

    var task = await PlayFabAdminAPI.GetPlayedTitleListAsync(new GetPlayedTitleListRequest() {
        PlayFabId = PlayFabId
    });

    if(task.Error != null)
    {
        callback(task.Error);
        return;
    }

    var TitleList = task.Result.TitleIds;
    foreach (var title in TitleList)
    {
        Console.WriteLine(string.Format("Title Found: {0}", title));
    }
    callback(null);
}
```

At this point you have a list of `PlayFabIds` for this player (based on the credentials they’ve shared) and a list of titles for each `PlayFabId`. Now what?

Now you’re ready to delete or export!

## Other considerations

It's easy to do harm with these APIs. Exporting data for or deleting the wrong player could be very damaging and it's **permanent**!

It is your responsibility as the game developer to verify that the credentials match the player requesting an export or deletion of their player data. PlayFab doesn't provide any type of verification when using these APIs.

However PlayFab does offer an [email verification feature](../../features/engagement/emails/using-a-rule-to-verify-a-contact-email-address.md). But our solution isn't the only option for verification. You can create your own process too.

Regardless of which technology you use, we suggest that you do some sort of verification before performing any of these actions.

