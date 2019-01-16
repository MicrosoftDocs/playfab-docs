---
title: Entities quickstart
author: v-thopra
description: Describes the terminology, concepts, and design of Entities in the PlayFab APIs.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities, accounts
ms.localizationpriority: medium
---

# Entities quickstart

Read our introductory blog about [Entities, Objects and Files](https://blog.playfab.com/blog/introducing-entities-objects-and-files)!

The **Entity API** introduces new access patterns that are designed to alleviate the pain points of the current account and data systems.

With the existing **APIs**, saving a data value has separate **API** calls for:

- **Title** access (client/[GetTitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata), admin/[GetTitleData](xref:titleid.playfabapi.com.admin.title-widedatamanagement.gettitledata), server/[GetTitleData](xref:titleid.playfabapi.com.server.title-widedatamanagement.gettitledata)).
- **Player** access (client/[GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata), client/[UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata), client/[UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata)).
- **Character** access (client/[GetCharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata), client/[UpdateCharacterData](xref:titleid.playfabapi.com.client.characterdata.updatecharacterdata)).

In the new **API** scheme, a single call supports saving a data value for a **Title**, **Player**, **Character**, and every other future **Entity Type**, combined with powerful access rules that replicate and expand the current system behavior of custom data in a better interface.

In some regards, these changes are not backwards compatible. However, using them will not change the behavior of the existing **APIs**.

## Terminology

**Entities** are any **PlayFab** concept which can contain data. Currently we have a number of built-in **Entity Types**:

- **Title**
- **master_player_account**
- **title_player_account**
- **Character**

This system will be expanded, so you will see future **Entity Types** added to cover **Guilds** or **Groups**, **Game Servers,** and more.

Because this is a new **API**, we are refining some of the terms used in other **API** methods:

- **Title** - This concept is unchanged. Your **Title** may contain global information available to all **Players**. This is similar to [TitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata). It is identified by the **Title ID** (**TitleId**) of the **Game**/**Application**.
- **master_player_account** - This **Entity Types** allows you to share information about a **Player** across multiple **Games** within a **Studio**. This is similar to [UserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata). It is identified by the **PlayFab ID** (**PlayFabId**) of the **Player**, which is returned as part of any login or any call to retrieve account information for the **Player Account** (for example, [Client/GetAccountInfo](xref:titleid.playfabapi.com.client.accountmanagement.getaccountinfo)).
- **title_player_account** - This concept is based on **User/Player** in the existing **API** methods. Each **Player** may contain some information for the current **Title**. This is similar to the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method. This is identified by the **Entity ID** (**EntityKey.Id**) you get back in the [EntityKey](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken#entitykey) object on any login where you specify **LoginTitlePlayerAccountEntity** as **True**.
- **character** - This concept is unchanged. Your **Player** may own **Characters**, which can each contain some information. This is similar to [CharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata). It is identified by the **Character ID** (**CharacterId**) of the **Character**.

See the [Available built-in Entity types](../../data/entities/available-built-in-entity-types.md) tutorial, for a list of all built-in **Entity Types**.

> [!NOTE]
> Formerly, **PlayFabId** covered both **master_player** and **title_player** concepts. Separating these concepts simplifies and clarifies the functionality. A **Player** can interact with multiple **Titles** that are all in the same **Studio**, so while they can have unique information as a different **Player** in each **Title**, the owner of the **Studio** also needs to identify that **Player** as a single **Entity** with shared data across **Titles**. This enables things like cross promotion of **Games** and giving **Players** cross-**Game** rewards.

## Entity Initialization

Before you can use any **Entity API** calls you must get an [EntityKey](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken#entitykey). You do this by using any normal login call, with a new optional parameter [LoginTitlePlayerAccountEntity](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid#loginwithcustomidrequest) set to **True**, or by calling the [GetEntityToken](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken) **API** method.

```csharp
PlayFabAuthenticationAPI.GetEntityToken(new GetEntityTokenRequest(),
(entityResult) =>
{
    var entityId = entityResult.Entity.Id;
    var entityType = entityResult.Entity.Type;
}, OnPlayFabError); // Define your own OnPlayFabError function to report errors
```

This **API** method returns an [Authentication/EntityKey](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken#entitykey) object, which contains the **ID** and **Type**, which you should save. If called from the **Client**, this typically represents the logged-in **Player**.

Called from **Game Servers**, this will represent your **Title**. With the **entityId** and **entityType**, you can make other calls to other **Entity API** methods.

You should save a reference to the **entityId** and *entityType* to use in other **API** calls (Each **API** has an **EntityKey** structure, above). **EntityToken** is handled internally by the **SDK**, so you can ignore that.

## Entity Objects

**Entity Objects** allow you to read and write small **JSON**-serializable **Objects** attached to an **Entity**. All **Entity Types** support the same **GetObjects** and **SetObjects** methods.

The examples that are shown below demonstrate setting and reading an **Object** on a **title_player_account**.

```csharp
var data = new Dictionary<string, object>()
{
    {"Health", 100},
    {"Mana", 10000}
};
var dataList = new List<SetObject>()
{
    new SetObject()
    {
        ObjectName = "PlayerData",
        DataObject = data
    },
    // A free-tier customer may store upto 3 objects on each entity
};
PlayFabDataAPI.SetObjects(new SetObjectsRequest()
{
    Entity = new EntityKey {Id = entityId, Type = entityType}, // Saved from GetEntityToken, or a specified key created from a titlePlayerId, CharacterId, etc
    Objects = dataList,
}, (setResult) => {
    Debug.Log(setResult.ProfileVersion);
}, OnPlayFabError);
```

```csharp
var getRequest = new GetObjectsRequest {Entity = new EntityKey {Id = entityId, Type = entityType}};
PlayFabDataAPI.GetObjects(getRequest,
    result => { var objs = result.Objects; },
    OnPlayFabError
);
```

## Entity Files

**Entity Files** allow you to read and write **Files** attached to an **Entity**, in any format. The example shown below demonstrates a full **Entity-File** loop - logging in, loading a **File**, and uploading a new **File**.

```csharp
#if !DISABLE_PLAYFABENTITY_API && !DISABLE_PLAYFABCLIENT_API

using PlayFab;
using PlayFab.Internal;
using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

public class EntityFileExample : MonoBehaviour
{
    public string entityId; // Id representing the logged in player
    public string entityType; // entityType representing the logged in player
    private readonly Dictionary<string, string> _entityFileJson = new Dictionary<string, string>();
    private readonly Dictionary<string, string> _tempUpdates = new Dictionary<string, string>();
    public string ActiveUploadFileName;
    public string NewFileName;
    public int GlobalFileLock = 0; // Kindof cheap and simple way to handle this kind of lock

    void OnSharedFailure(PlayFabError error)
    {
        Debug.LogError(error.GenerateErrorReport());
        GlobalFileLock -= 1;
    }

    void OnGUI()
    {
        if (!PlayFabClientAPI.IsClientLoggedIn() && GUI.Button(new Rect(0, 0, 100, 30), "Login"))
            Login();
        if (PlayFabClientAPI.IsClientLoggedIn() && GUI.Button(new Rect(0, 0, 100, 30), "LogOut"))
            PlayFabClientAPI.ForgetAllCredentials();

        if (PlayFabClientAPI.IsClientLoggedIn() && GUI.Button(new Rect(100, 0, 100, 30), "(re)Load Files"))
            LoadAllFiles();

        if (PlayFabClientAPI.IsClientLoggedIn())
        {
            // Display existing files
            _tempUpdates.Clear();
            var index = 0;
            foreach (var each in _entityFileJson)
            {
                GUI.Label(new Rect(100 * index, 60, 100, 30), each.Key);
                var tempInput = _entityFileJson[each.Key];
                var tempOutput = GUI.TextField(new Rect(100 * index, 90, 100, 30), tempInput);
                if (tempInput != tempOutput)
                    _tempUpdates[each.Key] = tempOutput;
                if (GUI.Button(new Rect(100 * index, 120, 100, 30), "Save " + each.Key))
                    UploadFile(each.Key);
                index++;
            }
            // Apply any changes
            foreach (var each in _tempUpdates)
                _entityFileJson[each.Key] = each.Value;

            // Add a new file
            NewFileName = GUI.TextField(new Rect(100 * index, 60, 100, 30), NewFileName);
            if (GUI.Button(new Rect(100 * index, 90, 100, 60), "Create " + NewFileName))
                UploadFile(NewFileName);
        }
    }

    void Login()
    {
        var request = new PlayFab.ClientModels.LoginWithCustomIDRequest
        {
            CustomId = SystemInfo.deviceUniqueIdentifier,
            CreateAccount = true,
            LoginTitlePlayerAccountEntity = true
        };
        PlayFabClientAPI.LoginWithCustomID(request, OnLogin, OnSharedFailure);
    }
    void OnLogin(PlayFab.ClientModels.LoginResult result)
    {
        entityId = result.EntityToken.Entity.Id;
        entityType = result.EntityToken.Entity.Type;
    }

    void LoadAllFiles()
    {
        if (GlobalFileLock != 0)
            throw new Exception("This example overly restricts file operations for safety. Careful consideration must be made when doing multiple file operations in parallel to avoid conflict.");

        GlobalFileLock += 1; // Start GetFiles
        var request = new PlayFab.DataModels.GetFilesRequest { Entity = new PlayFab.DataModels.EntityKey { Id = entityId, Type = entityType } };
        PlayFabDataAPI.GetFiles(request, OnGetFileMeta, OnSharedFailure);
    }
    void OnGetFileMeta(PlayFab.DataModels.GetFilesResponse result)
    {
        Debug.Log("Loading " + result.Metadata.Count + " files");

        _entityFileJson.Clear();
        foreach (var eachFilePair in result.Metadata)
        {
            _entityFileJson.Add(eachFilePair.Key, null);
            GetActualFile(eachFilePair.Value);
        }
        GlobalFileLock -= 1; // Finish GetFiles
    }
    void GetActualFile(PlayFab.DataModels.GetFileMetadata fileData)
    {
        GlobalFileLock += 1; // Start Each SimpleGetCall
        PlayFabHttp.SimpleGetCall(fileData.DownloadUrl,
            result => { _entityFileJson[fileData.FileName] = Encoding.UTF8.GetString(result); GlobalFileLock -= 1; }, // Finish Each SimpleGetCall
            error => { Debug.Log(error); }
        );
    }

    void UploadFile(string fileName)
    {
        if (GlobalFileLock != 0)
            throw new Exception("This example overly restricts file operations for safety. Careful consideration must be made when doing multiple file operations in parallel to avoid conflict.");

        ActiveUploadFileName = fileName;

        GlobalFileLock += 1; // Start InitiateFileUploads
        var request = new PlayFab.DataModels.InitiateFileUploadsRequest
        {
            Entity = new PlayFab.DataModels.EntityKey { Id = entityId, Type = entityType },
            FileNames = new List<string> { ActiveUploadFileName },
        };
        PlayFabDataAPI.InitiateFileUploads(request, OnInitFileUpload, OnInitFailed);
    }
    void OnInitFailed(PlayFabError error)
    {
        if (error.Error == PlayFabErrorCode.EntityFileOperationPending)
        {
            // This is an error you should handle when calling InitiateFileUploads, but your resolution path may vary
            GlobalFileLock += 1; // Start AbortFileUploads
            var request = new PlayFab.DataModels.AbortFileUploadsRequest
            {
                Entity = new PlayFab.DataModels.EntityKey { Id = entityId, Type = entityType },
                FileNames = new List<string> { ActiveUploadFileName },
            };
            PlayFabDataAPI.AbortFileUploads(request, (result) => { GlobalFileLock -= 1; UploadFile(ActiveUploadFileName); }, OnSharedFailure); GlobalFileLock -= 1; // Finish AbortFileUploads
            GlobalFileLock -= 1; // Failed InitiateFileUploads
        }
        else
            OnSharedFailure(error);
    }
    void OnInitFileUpload(PlayFab.DataModels.InitiateFileUploadsResponse response)
    {
        string payloadStr;
        if (!_entityFileJson.TryGetValue(ActiveUploadFileName, out payloadStr))
            payloadStr = "{}";
        var payload = Encoding.UTF8.GetBytes(payloadStr);

        GlobalFileLock += 1; // Start SimplePutCall
        PlayFabHttp.SimplePutCall(response.UploadDetails[0].UploadUrl,
            payload,
            FinalizeUpload,
            error => { Debug.Log(error); }
        );
        GlobalFileLock -= 1; // Finish InitiateFileUploads
    }
    void FinalizeUpload()
    {
        GlobalFileLock += 1; // Start FinalizeFileUploads
        var request = new PlayFab.DataModels.FinalizeFileUploadsRequest
        {
            Entity = new PlayFab.DataModels.EntityKey { Id = entityId, Type = entityType },
            FileNames = new List<string> { ActiveUploadFileName },
        };
        PlayFabDataAPI.FinalizeFileUploads(request, OnUploadSuccess, OnSharedFailure);
        GlobalFileLock -= 1; // Finish SimplePutCall
    }
    void OnUploadSuccess(PlayFab.DataModels.FinalizeFileUploadsResponse result)
    {
        Debug.Log("File upload success: " + ActiveUploadFileName);
        GlobalFileLock -= 1; // Finish FinalizeFileUploads
    }
}
#endif
```

## Deconstructing this example

- **GlobalFileLock** is a very simplistic way to avoid **File** collisions, specifically designed for this example.
  - Independent **File Actions** will not cause any issues.
  - Each **File Action** requires many steps and multiple **API** calls, so don't try to access the same **File** in multiple ways at the same time.
  - If you are very careful, you won't need any locking mechanism.
  - If you want to do something complicated, your locking mechanism may be much more complex.
- **OnGUI** is a very old (but very dense) way to build a **Unity GUI** entirely within script.
  - Your **GUI** will be much better, and **Game**-specific.
- All **PlayFab** features *first* require a login or authentication.
- **LoadAllFiles()** will do exactly as it says. For the current logged-in **Entity**, load all **File** saved to **PlayFab**.
  - This requires multiple steps:
    - Asking **PlayFab** where the **File** are located,
    - And then downloading them separately.  
- **UploadFile(string fileName)** saves **File** to the service for the **Entity**.
  - For simplicity, this example saves one **File** at a time, but **Fils** can be uploaded atomically in sets as well.
  - The steps for this are:
    - Initialize an atomic upload operation,
    - Upload all **Files**,
    - Finalize an atomic upload operation.
  - The **Entity** will not consider the **File** upload complete, nor reflect any changes to other callers until the atomic upload operation has been finalized successfully.

## Game Manager and Entities

The **Game Manager** allows you to manipulate **Objects** and **Files** for **Players**. The **Player Overview** has been updated to show both the **Title Player** and **Master Player** account information.

![Game Manager - Entities - Player overview](media/tutorials/game-manager-entities-player-overview.png)  

In addition, **Files** and **Objects** now have their own sections in the **Players** tab.

![Game Manager - Entities - Player Files and Objects](media/tutorials/game-manager-entities-player-files.png)  
