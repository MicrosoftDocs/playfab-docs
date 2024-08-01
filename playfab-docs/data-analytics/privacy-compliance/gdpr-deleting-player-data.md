---
title: PlayFab GDPR - Delete Player Data
author: sofiamarinv
description: How to use PlayFab to delete a player’s data so that you can be General Data Protection Regulation (GDPR) compliant.
ms.author: sofiamarin
ms.date: 02/12/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, playerdata, gdpr, compliance, admin api, delete player data, player data
ms.localizationpriority: medium
---

# Delete player data

This article describes two main ways to delete a player's data from PlayFab. You can [delete the entire Player account](#delete-a-player-account) or just [delete the data without deleting the account](#delete-account-data-without-deleting-the-account).

## Delete a Player account 

> [!WARNING]
> Deleting a Master Player account deletes all data associated with the player from PlayFab and is synonymous with deleting the player from your game. The DeleteMasterPlayerAccount API does not have a mechanism to selectively delete data associated with the player. See Deleting Event Data and Deleting Custom Data for options to delete data and retain the player account.

Deleting a Master Player account and its data can be accomplished by using the [DeleteMasterPlayerAccount](/rest/api/playfab/admin/account-management/delete-master-player-account) Admin API, which is available in all of our SDKs. Please read [Make sure you find all the data](playfab-gdpr-deleting-and-exporting-player-data.md). 

When you make a request to delete a player, PlayFab will quickly remove the player's personal information from our core system before sending the request to a queue processing agent, which works to remove any remaining information about the player from ancillary systems and subprocessors.

This API returns immediately and provides a `JobReceiptId`, which you should store for your records. The JobReceiptId is your validation that PlayFab received the request to delete the player.

Once the delete is complete, an email is sent to the notification email address configured for the title. It contains the same `JobReceiptId`, which was initially returned by the API. The completion of the task will also trigger a PlayStream event.

Using our Webhook feature, you can register to receive these events on an endpoint of your choosing, and process them as needed. The event will contain a JSON blob that has the `JobReceiptId`.

The following example shows how to use the Admin API with the [C# SDK](../../sdks/c-sharp/index.md). If you would like to use a different SDK, select one from the list of [PlayFab SDKs](../../sdks/playfab-sdk-intro.md).

```csharp
public static async void StartDeleteMasterPlayerExample(Action<PlayFabError> callback)
{
    var task = await PlayFabAdminAPI.DeleteMasterPlayerAccountAsync(new DeleteMasterPlayerAccountRequest()
    {
        PlayFabId = PlayFabId
    });

    if(task.Error != null)
    {
        callback(task.Error);
    }

    var jobReceiptId = task.Result.JobReceiptId;
    var AffectedTitleList = task.Result.TitleIds; 
    foreach (var title in AffectedTitleList)
    {
        Console.WriteLine(string.Format("Delete Player - Title Affected: {0}", title));
    }

}
```

> [!NOTE]
> Because this deletion *cannot be undone*, we suggest confirming with your player that they are comfortable with the scope and impact of their deletion request.

Once the action has been confirmed, use the following code to proceed with Master Player account deletion.

```csharp
//Make sure we are 100% sure we want to do this.
if ( confirm successful ) {
   //create a variable to store a list of titles the player has already been removed from.
   listOfTitlesRemovedFrom
   //Hang on to the receipts from successful deletes.
   listOfReceipts
   foreach(title in <all my titles>){

       //You only need to remove the Master Player once per namespace, so check that you have not
       //already performed this action in the namespace, or you will get an error that
       //the player is already queued for deletion.
       if(title not in listOfTitlesRemovedFrom){
           foreach(pfid in PlayFabIdList){

              //Note: you should do some error handling around this API call.
              response = title.DeleteMasterPlayerAccount(pfid)
              foreach(titleId in response.titleids){
                listOfTitlesRemoved.add(titleId)
              }
              listOfReceipts.add(response.jobreceiptid)
           }
       }
   }

   //Save listOfReceipts somewhere as proof of deletion.

}
```

## Delete account data without deleting the account

Use this list to help you delete the event data that are associated with a player's account.

### Delete Event Data

Event Data includes PlayStream events and telemetry. Event data is transactional and is generated from user activity. 

#### PlayFab Insights 

PlayFab Insights is a fully managed solution where PlayFab stores your event data on your behalf.

You can use the [DeleteMasterPlayerEventData](/rest/api/playfab/admin/account-management/delete-master-player-event-data) API to delete Insights data when the player requests it. This deletes only data stored related to the player in PlayFab Insights, leaving all other data intact. 

### Delete Custom Data

Custom Data refers to a broad category of features that allow you to associate arbitrary data with a player. PlayFab provides methods to interact with the data from your game logic but doesn't otherwise interpret or understand the data. 

#### Legacy Player Data 

It's possible to edit and delete the different types of Player Data using the following APIs:: 

[UpdateUserData](/rest/api/playfab/server/player-data-management/update-user-data), [UpdateUserInternalData](/rest/api/playfab/server/player-data-management/update-user-internal-data), [UpdateUserReadOnlyData](/rest/api/playfab/server/player-data-management/update-user-read-only-data), [UpdateUserPublisherData](/rest/api/playfab/server/player-data-management/update-user-publisher-data), [UpdateUserPublisherInternalData](/rest/api/playfab/server/player-data-management/update-user-publisher-internal-data), [UpdateUserPublisherReadOnlyData](/rest/api/playfab/server/player-data-management/update-user-publisher-read-only-data) 

Each of these APIs takes a parameter **KeysToRemove** which takes in a list of Player Data keys that should be deleted from the player’s profile. 

#### Entity Object

[Entity Objects](../../features/entities/entity-objects.md) can be deleted using the SetObjects API. In the request body’s Objects array, create an entry for each object you want to delete by specifying its ObjectName and setting DeleteObject to true. Below is an example request body. 

```HTTP
{ 
    "Entity": { 
        "Id": "<The ID of the target entity>", 
        "Type": "<either ‘title_player_account’, ‘master_player_account’, or ‘character’>" 
    }, 
    "Objects": [ 
        { 
            "ObjectName": "<Name of object to delete>", 
            "DeleteObject": true 
        } 
    ] 
} 
```

#### Entity Files

[Entity Files](../../features/entities/entity-files.md) are deleted using the [DeleteFiles](/rest/api/playfab/data/file/delete-files) API.  
