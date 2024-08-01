---
title: "PlayFab GDPR - Export Player Data"
author: sofiamarinv
description: How to use PlayFab to export a player’s data so that you can be General Data Protection Regulation (GDPR) compliant.
ms.author: sofiamarin
ms.date: 02/12/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, playerdata, gdpr, compliance, admin api, delete player data, player data
ms.localizationpriority: medium
---

# Export data

This article describes how to export player and event data from PlayFab.

## Export player account data

When you make a request to export a player's data, the request is sent to a **Queue Processing Agent** (similar to deleting a player).

The [ExportMasterPlayerData](/rest/api/playfab/admin/account-management/export-master-player-data) API exports all data associated with the given `PlayFabId`, including data across all your titles, such as:

- **Statistics**
- **Custom Data**
- **Inventory**
- **Purchases* *
- **Player-Created Items/UGC**
- **Transaction History**
- **Virtual Currency Balances**
- **Characters**
- **Group Memberships**
- **Publisher Data**
- **Credential Data**
- **Account Linkages**
- **Friends List**
- **PlayStream Event History**.

Please read [Make sure you find all the data](playfab-gdpr-deleting-and-exporting-player-data.md), which details how to make sure you have all of a player’s PlayFabIds.

This API immediately returns a `JobReceiptId`, which you should store in your records for future reference. It may take some time before the export is available for download.

Upon completion of the export, an email containing the export download link will be sent to the notification email address configured for the title.

The completion of the task will also trigger a [`player_data_exported` PlayStream event](../../api-references/events/player-data-exported.md). The event contains the `JobReceiptId` as a property, as well as the `ExportDownloadUrl` property, which provides access to the exported data. Using either [Automation Rules with Azure Functions](../../features/automation/cloudscript-af/quickstart.md#azure-functions-in-automation-rules) or [Webhooks](../acting-data/webhooks-overview.md), you can register to receive these events on an endpoint of your choosing and process as needed. 

The following example is how to use the Admin API with the [C# SDK](../../sdks/c-sharp/index.md). If you would like to use a different SDK, select one from the list of [PlayFab SDKs](../../sdks/playfab-sdk-intro.md).

```csharp
public static async void ExportMasterPlayerExample(Action<PlayFabError> callback)
{
    var task = await PlayFabAdminAPI.ExportMasterPlayerDataAsync(new ExportMasterPlayerDataRequest()
    {
        PlayFabId = PlayFabId
    });

    if(task.Error != null)
    {
        callback(task.Error);
    }

    var jobReceiptId = task.Result.JobReceiptId;

    Console.WriteLine(string.Format("Export Player Request Received - Receipt: {0}", jobReceiptId));

    callback(null);
}
```

> [!NOTE]
> The URL will be available for up to 30 days after the export has completed. After this time, the file will be deleted, and you will need to initiate a *new* export request.

## Format of exported data

The exported data is packaged in a ZIP archive whose name contains the `JobReceiptId` and the time of the export. The archive contains multiple files organized into a directory structure.

| File Path | Description |
|-----------|-------------|
| /master_player_export.json | <p>A JSON file that contains the player's data recorded in PlayFab. This includes data for each of the titles that the player participates in.</p><p>The schema for the JSON document is provided as an OpenAPI specification. See object `MasterPlayerDataExport` in `https://<your_title_id>.playfabapi.com/Swagger/MasterPlayerDataExport.swagger.json`</p> |
| /CustomFiles/MasterPlayerFiles/* | Contains the custom [Entity Files](../../features/data/entities/entity-files.md) associated with the player's `master_player_account` entity.|
| /CustomFiles/TitlePlayerFiles/&lt;TitlePlayerAccountId&gt;/* | <p>Contains the custom [Entity Files](../../features/data/entities/entity-files.md) associated with the player's `title_player_account` entities.</p><p>The files are organized into one subdirectory per title that the player participates in. The name of each subdirectory is the player's `title_player_account` entity ID in the title.</p> |
| /TitlePlayerEvents/&lt;TitleId&gt;/event-history_1.jsonl <br/>...<br/> /TitlePlayerEvents/&lt;TitleId&gt;/event-history_&lt;N&gt;.jsonl | <p>The PlayStream and Telemetry events recorded about the player.</p><p>The files are organized into one subdirectory per title that the player participates in. The name of each subdirectory is the title ID.</p><p>Each subdirectory contains one or more `event-history` files, depending on how much data the player has in the given title. The files contain the events serialized into JSON objects, one event per line.</p> |

## Export event data

PlayFab provides several types of event data&mdash;Custom Data, Entity Objects, and Entity Files.

### Export Custom Data

Custom Data refers to a broad category of features that allow you to associate arbitrary data with a player. PlayFab provides methods to interact with the data from your game logic but doesn't otherwise interpret or understand the data.

#### Legacy Player Data

When using the [ExportMasterPlayerData](/rest/api/playfab/admin/account-management/export-master-player-data) API (as referenced in the Exporting PlayFab Data section), all Player Data properties can be found in the master_player_export.json file at the root of the ZIP archive: 

* “Publisher” data can be found at JSONPath: $.PublisherData 
* Per-title data can be found at JSONPath: $.Titles[*].CustomData 

These values can also be retrieved via dedicated “get” APIs, should you only need to export these values. The advantage to the dedicated APIs is that they'll return immediately. However, per this feature’s design, the right API will need to be called based on the specific type of data needed: 

GetUserData, GetUserInternalData, GetUserReadOnlyData, GetUserPublisherData, GetUserPublisherInternalData, GetUserPublisherReadOnlyData 

### Export Entity Objects

When using the [ExportMasterPlayerData](/rest/api/playfab/admin/account-management/export-master-player-data) API, all Entity Objects can be found in the **master_player_export.json** file at the root of the ZIP archive: 

For **master_player_account** entity objects at JSONPath: **$.CustomObjects** 

For **title_player_account** entity objects at JSONPath: **$.Titles[*].CustomObjects** 

For character entity objects at JSONPath: **$.Titles[*].Characters[*].CustomObjects** 

Entity Objects can also be retrieved via the [GetObjects](/rest/api/playfab/data/object/get-objects) API. If you already know which entities’ objects you’re looking for, using the dedicated APIs can be easier since it will return the objects immediately. However, the disadvantage is that the API will need to be called separately for the player’s **master_player_account** entity, each **title_player_account** entity, and each character entity. 

### Export Entity Files

When using the [ExportMasterPlayerData](/rest/api/playfab/admin/account-management/export-master-player-data) API, all Entity Files associated with the player are added as-is to the ZIP archive in the /CustomFiles/ directory, specifically: 

For the player’s **master_player_account** entity, the files are under /CustomFiles/MasterPlayerFiles/* 

For **title_player_account**, the files are under /CustomFiles/TitlePlayerFiles/\<TitlePlayerAccountId\>/* 

> [!NOTE] 
> One subdirectory exists for each entity, with the title_player_account entity ID as the directory name. 

Entity Files can also be downloaded directly. First, call the [GetFiles](/rest/api/playfab/data/file/get-files) API to get metadata about the entity’s files. Each file metadata document includes a DownloadUrl property, which can be used to download the file directly. 

