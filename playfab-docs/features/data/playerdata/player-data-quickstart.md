---
title: Player Data Quickstart
author: v-thopra
description: Tutorial that describes how to create and use player data.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Player Data Quickstart

> [!NOTE] 
> In the PlayFab APIs, the function names utilize the term UserData. In the Game Manager, this concept is described as Player Data. They are identical, and interchangeable.

This Quickstart describes how to create and use player data. Player data is information that applies to an individual player or a group of players (shared data) and is stored as key/value pairs (KVPs) by PlayFab.

This topic covers client-API calls, which are safe to call from any process or context. It also covers server-API calls, which should only be made from a dedicated server process you control, or a carefully secured CloudScript call. Server-APIs require your dev secret key, which you should never provide-to or publish-with your client.

**About the Code Examples:**

- The C# Code Examples shown in this Quickstart correspond to using the PlayFab Unity SDK.
- Use the client APIs [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) to create, update, or delete and [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) to read data for the player.
- Use the server API [UpdateUserReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) to create, update, or delete and the client API [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) to read title-specific data for the player. This data is visible to the player, but can only be modified by the server.
- Use the server APIs [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) to create, update, or delete and [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) to read title-specific data for the player. This data is server-only, and cannot be seen by the client.

## Player Data in Game Manager

You can always get and set player data through Game Manager by performing the following steps.

- Open Game Manager. If you are unfamiliar with Game Manager, see the [Game Manager Quickstart](../../config/gamemanager/game-manager-quickstart.md).
- Click the **Players** tab.
- Click on the name of the player, this will put you into the players Account tab.
- Click the **Player Data** tab, to see their data.

## Setting Player Data

This is data that the client can create, read, update, or delete (CRUD). To set player data, use the [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) method.

### C# Code Example

The following C# code example creates (or updates, if the KVPs already exist) the KVPs **Ancestor** with the value **Arthur** and **Successor** with the value **Fred**.

```csharp
void SetUserData() {
    PlayFabClientAPI.UpdateUserData(new UpdateUserDataRequest() {
        Data = new Dictionary<string, string>() {
            {"Ancestor", "Arthur"},
            {"Successor", "Fred"}
        }
    }, 
    result => Debug.Log("Successfully updated user data"),
    error => {
        Debug.Log("Got error setting user data Ancestor to Arthur");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## Getting Player Data

To get player data, use the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method.

### C# Code Example

The following C# code example gets the values of all of the player data KVPs.

```csharp
void GetUserData() {
    PlayFabClientAPI.GetUserData(new GetUserDataRequest() {
        PlayFabId = PlayFabId,
        Keys = null
    }, result => {
        Debug.Log("Got user data:");
        if (result.Data == null || !result.Data.ContainsKey("Ancestor")) Debug.Log("No Ancestor");
        else Debug.Log("Ancestor: "+result.Data["Ancestor"].Value);
    }, (error) => {
        Debug.Log("Got error retrieving user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## Setting Read-only Player Data

This is data that the server can modify, but the client can only read. To set read-only KVPs, you must call the [UpdateUserReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) API from a server process.

### C# Code Example

The following server-SDK C# code example creates (or updates, if the KVPs already exist) the KVPs with the key **Father** and the value **Fred**, **Mother** with the value **Alice**, **Sister** with the value **Lucy**, and **Brother** with the value **Doug**.

```csharp
public void UpdateUserReadOnlyData() {
    PlayFabServerAPI.UpdateUserReadOnlyData(new UpdateUserDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
        Data = new Dictionary<string, string>() {
            {"Father", "Fred"},
            {"Mother", "Alice"},
            {"Sister", "Lucy"},
            {"Brother", "Doug"}
        },
        Permission = UserDataPermission.Public
    },
    result => Debug.Log("Set read-only user data successful"), 
    error => {
        Debug.Log("Got error updating read-only user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## Getting Read-only Player Data

To get read-only player data, use the [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) method.

### C# Code Example

The following server-SDK C# code example gets all of the player read-only data.

```csharp
public void GetUserReadOnlyData()
{
    PlayFabServerAPI.GetUserReadOnlyData(new GetUserDataRequest()
    {
        PlayFabId = "user PlayFabId here - obtained from any successul LoginResult",
    },
    result => {
        if(result.Data == null || !result.Data.ContainsKey("Sister")) Debug.Log("No Sister");
        else Debug.Log("Sister: "+result.Data["Sister"].Value);
    },
    error => {
        Debug.Log("Got error getting read-only user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## Setting Internal Player Data

This is data that the client cannot access. To set internal player data, use the [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) method.

### C# Code Example

The following server-SDK C# code example creates (or updates, if a KVP with the same key value already exists) the KVP with the key **Rank** and value **Sargent**.

```csharp
public void UpdateUserInternalData() {
    PlayFabServerAPI.UpdateUserInternalData(new UpdateUserInternalDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
        Data = new Dictionary<string, string>() {
            {"Class", "Fighter"},
            {"Race", "Human"},
        },
    }, 
    result => Debug.Log("Set internal user data successful"), 
    error => {
        Debug.Log("Got error updating internal user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## Getting Internal Player Data

To get internal player data, use the [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) method. Since this is internal data, you should not expose it to the client.

### C# Code Example

The following C# code example retrieves the KVPs of the player internal data.

```csharp
public void GetUserInternalData() {
    PlayFabServerAPI.GetUserInternalData(new GetUserDataRequest() {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
    },
    result => {
        if(result.Data == null || !result.Data.ContainsKey("Class")) Debug.Log("No Class");
        else Debug.Log("Class: " + result.Data["Class"].Value);
    },
    error => {
        Debug.Log("Got error getting internal user data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## CloudScript Code Example

CloudScript is an advanced topic that is covered in the [CloudScript Quickstart](../../automation/cloudscript/cloudscript-quickstart.md). Player data does not require CloudScript. It is, however, accessible from CloudScript if you require it.

Sometimes, you may want to modify Read-Only or Internal player data from CloudScript. You must be very careful to ensure the security of your server-API calls in CloudScript. The following code demonstrates modifying a piece of Read-Only player data from CloudScript safely.

```javascript
function IncrementReadOnlyUserData(args) {
  var playerData = server.GetUserInternalData({
        PlayFabId: currentPlayerId,
        Keys: ["ReadOnlyTest"]
  });

  var prevCount = "0";
  var nextCount = "1";
  try {
    prevCount = playerData.Data["ReadOnlyTest"].Value;
    var prevInt = parseInt(prevCount, 10);
    if (prevInt != prevInt) {
      prevInt = 0;
      nextCount = (prevInt + 1).toString();
    }
  } catch (e) {
    prevCount = "0";
    nextCount = "0";
  }

  var updateUserDataResult = server.UpdateUserInternalData({
    PlayFabId: currentPlayerId,
    Data:
        {
          "ReadOnlyTest": nextCount
        }
  });
}
```

### C# Code Example

As explained in the CloudScript tutorial, you can call this logic from the client:

```csharp
public void CloudIncrement() {
    PlayFabClientAPI.ExecuteCloudScript( new ExecuteCloudScriptRequest {
        FunctionName = "IncrementReadOnlyUserData"
    }, 
    result => Debug.Log("CloudScript call successful"), 
    error => {
        Debug.Log("CloudScript call failed");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

Since this example updates internal player data, you will need to call [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) again from your server to see the results. Also note, that we do not allow any client inputs from args directly into a server-API call. Be sure to sanitize the client-inputs first, if you attempt this.

### See Also

[Title Data Quickstart](../../config/titledata/title-data-quickstart.md)
[Using Publisher Data](../../config/titledata/using-publisher-data.md)
[CloudScript Quickstart](../../automation/cloudscript/cloudscript-quickstart.md)
