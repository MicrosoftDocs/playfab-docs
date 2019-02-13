---
title: Player Data quickstart
author: v-thopra
description: Tutorial that describes how to create and use player data.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Player data quickstart

> [!NOTE] 
> In the PlayFab **APIs**, the function names utilize the term **UserData**. In the **Game Manager**, this concept is described as **Player Data**. They are identical, and interchangeable.

This quickstart describes how to create and use player data. Player data is information that applies to an individual player or player group (shared data) and is stored as Key/Value Pairs (KVPs) by PlayFab.

This topic covers client-**API** calls, which are safe to call from any process or context. It also covers server-**API** calls, which should *only* be made from a dedicated server process you control, or a carefully secured **CloudScript** call.

Server-**APIs** require your dev secret key, which you should never provide-to or publish-with your client.

**About the Code Examples:**

- The **C# Code Examples** shown in this quickstart correspond to using the PlayFab **Unity SDK**.
- Use the client **APIs** [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) to create, update, or delete and [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) to read data for the player.
- Use the server **API** [UpdateUserReadOnlyData](ref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) to create, update, or delete and the client **API** [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) to read title-specific data for the player. This data is visible to the player, but can only be modified by the server.
- Use the server **APIs** [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) to create, update, or delete and [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) to read title-specific data for the player. This data is server-only, and cannot be seen by the client.

## Player data in Game Manager

You can always get and set player data through Game Manager by performing the following steps.

- Open **Game Manager**. If you are unfamiliar with it, see the [Game Manager quickstart](../../config/gamemanager/quickstart.md).
- Select the **Players** tab.
- Select the name of the **Player**. This will put you into the **Players Account** tab.
- Select the **Player Data** tab to see their data.

## Setting player data

This is data that the client can Create, Read, Update, or Delete (CRUD). To set player data, use the [UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata) method.

### C# code example

The following **C#** code example creates (or updates, if the KVPs already exist) the KVPs **Ancestor** with the value **Arthur**, and **Successor** with the value **Fred**.

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

## Getting player data

To get player data, use the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method.

### C# code example

The following **C#** code example gets the values of all of the player data KVPs.

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

## Setting read-only player data

This is data that the server can modify, but the client can only read. To set read-only KVPs, you must call the [UpdateUserReadOnlyData](ref:titleid.playfabapi.com.server.playerdatamanagement.updateuserreadonlydata) **API** from a server process.

### C# code example

The following **C#** code example uses the PlayFab server **API** to create (or update, if the KVPs already exist) the KVPs with the key named **Father**, with the value **Fred**,  **Mother** with the value **Alice**, **Sister** with the value **Lucy**, and **Brother** with the value **Doug**.

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

## Getting read-only player data

To get read-only player data, use the [GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata) method.

### C# code example

The following **C#** code example uses the PlayFab server **API** to get all of the player read-only data.

```csharp
public void GetUserReadOnlyData()
{
    PlayFabServerAPI.GetUserReadOnlyData(new GetUserDataRequest()
    {
        PlayFabId = "user PlayFabId here - obtained from any successful LoginResult",
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

## Setting internal player data

This is data that the client cannot access. To set internal player data, use the [UpdateUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserinternaldata) method.

### C# code example

The following **C#** code example uses the PlayFab server **API** to create (or update, if a key value already exists) the KVP with the **Key: Rank** and **Value: Sargent**.

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

## Getting internal player data

To get internal player data, use the [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) method. Since this is *internal* data, you should *not* expose it to the client.

### C# code example

The following **C#** code example retrieves the KVPs of the player internal data.

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

## CloudScript code example

**CloudScript** is an advanced topic that is covered in the [CloudScript quickstart](../../automation/cloudscript/quickstart.md). Player data does not require **CloudScript**. It is, however, accessible from **CloudScript** if you require it.

Sometimes, you may want to modify read-only or internal player data from **CloudScript**.

You must be very careful to ensure the security of your server-**API** calls in **CloudScript**. The following code demonstrates modifying a piece of read-only player data from **CloudScript** safely.

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

### C# code example

As explained in the **CloudScript** tutorial, you can call the following logic from the client.

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

Since this example updates internal player data, you will need to call [GetUserInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.getuserinternaldata) again from your server to see the results.

Also note that we do not allow *any* client inputs from args directly into a server-**API** call. Be sure to sanitize the client-inputs *first*, if you attempt this.

### See Also

[Title Data quickstart](../../config/titledata/quickstart.md)
[Using Publisher Data](../../config/titledata/using-publisher-data.md)
[CloudScript quickstart](../../automation/cloudscript/quickstart.md)
