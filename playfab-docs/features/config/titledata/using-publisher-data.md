---
title: Using publisher data
author: v-thopra
description: Describes how to create and use publisher (studio) data.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, configuration, publisher data, studio data
ms.localizationpriority: medium
---

# Using publisher data

This tutorial describes how to create and use publisher (studio) data. Publisher data is data that spans more than one title, such as when you have multiple games that need to share common information among your games. This category also include data for players that spans multiple games. PlayFab stores data as key/value pairs (KVPs).

Most of these APIs are server APIs that your program must call from a dedicated server or through a CloudScript function within the PlayFab service.

- Use the server APIs [SetPublisherData](https://api.playfab.com/documentation/Server/method/SetPublisherData) to update, and [GetPublisherData](https://api.playfab.com/documentation/Server/method/GetPublisherData) to retrieve, publisher-specific custom KVPs.
- Use [UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata) to create or update, and [GetUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata) to retrieve, publisher-specific custom KVPs for the player.
- Use the server API [UpdateUserPublisherReadOnlyData](https://api.playfab.com/documentation/Server/method/UpdateUserPublisherReadOnlyData) to update, and the client API [GetUserPublisherReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherreadonlydata) to retrieve, the read-only publisher-specific custom KVPs for the user.
- Use the server APIs [UpdateUserPublisherInternalData](https://api.playfab.com/documentation/Server/method/UpdateUserPublisherInternalData) to update, and [GetUserPublisherInternalData](https://api.playfab.com/documentation/Server/method/GetUserPublisherInternalData) to retrieve, the internal publisher-specific custom KVPs for the user.

You must call the server APIs from a dedicated server or through a CloudScript function through the PlayFab service. This is by design, as the PlayFab server APIs require that you supply your secret key. We do not recommend using Server APIs from within a game client, if you need to make use of a Server API, use CloudScript for this type of functionality.

> [!NOTE]
> Publisher data values are copied and distributed to potentially hundreds of machines in the PlayFab cluster server. As part of this process, publisher data is cached and changes may take up to fifteen minutes to refresh in those caches. Publisher data is best suited for "global constant/static data", and is not suitable or reliable as "global variables".

## Publisher data

Publisher data is used to store static data for a set of titles. Each entry **is not bound** to any PlayFab entity such as a Player (as opposed to [user publisher data](#user-publisher-data)).

### Setting Publisher Data

The following snippet demonstrates how to set publisher data using the server API. Note, that there is an Admin API counterpart for this operation.

```csharp
public void ServerSetPublisherData() {
    PlayFabServerAPI.SetPublisherData(new SetPublisherDataRequest() {
            Key = "SomeKey",
            Value = "SomeValue"
        }, 
        result => Debug.Log("Complete setting publisher data"),
        error => {
            Debug.Log("Got error setting publisher data");
            Debug.Log(error.GenerateErrorReport());
        }
    );
}
```

### Getting Publisher Data

The following snippet demonstrates getting publisher data using the client API. Note, that there are server and Admin API counterparts for this operation.

```csharp
public void ClientGetPublisherData() {
    PlayFabClientAPI.GetPublisherData(new GetPublisherDataRequest(),
    result => {
        if (result.Data == null || !result.Data.ContainsKey("SomeKey")) Debug.Log("No SomeKey");
        else Debug.Log("SomeKey: " + result.Data["SomeKey"]);
    },
    error => {
        Debug.Log("Got error getting publisher data");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## User Publisher Data

User publisher data can be used to introduce publisher data that is bound to a PlayFab user (player). Unlike regular publisher data, it is possible for a client application to alter user publisher data. PlayFab exposes 3 protection levels for user publisher data from the client API point-of-view:

**Regular user publisher data** exposes read and write access for client applications.

- Set via client, server, and Admin API.
- Get via client, server, and Admin API.
- The client API may only set publisher data for a player that is currently logged in.

**Read-Only user publisher data** exposes read access for client applications.

- Set via server and Admin API.
- Get via client, server, and Admin API.

**Internal user publisher data** exposes no access for client applications and is used to store the secret portion of user data.

- Set via server and Admin API.
- Get via server and Admin API.

### Setting user publisher data

The following snippet demonstrates how to set all 3 kinds of publisher data using client and server APIs:

```csharp
// Use client API to set User Publisher Data for current user 
public void ClientSetUserPublisherData() {
    PlayFabClientAPI.UpdateUserPublisherData(new UpdateUserDataRequest() {
         Data  = new Dictionary<string, string>() {
             { "SomeKey", "SomeValue" }
         }
    }, 
    result => Debug.Log("Complete setting Regular User Publisher Data"), 
    error =>
    {
        Debug.Log("Error setting Regular User Publisher Data");
        Debug.Log(error.GenerateErrorReport());
    });
}

// Use server API to set Read-Only User Publisher Data for selected user 
public void ServerSetUserPublisherReadOnlyData() {
    PlayFabServerAPI.UpdateUserPublisherReadOnlyData(new UpdateUserDataRequest() {
         PlayFabId = "< PlayFab Player Id >",
         Data  = new Dictionary<string, string>() {
             { "SomeKey", "SomeValue" }
         }
    }, 
    result => Debug.Log("Complete setting Read-Only User Publisher Data"), 
    error =>
    {
        Debug.Log("Error setting Read-Only User Publisher Data");
        Debug.Log(error.GenerateErrorReport());
    });
}

// Use server API to set Internal User Publisher Data for selected user 
public void ServerSetUserPublisherInternalData() {
    PlayFabServerAPI.UpdateUserPublisherInternalData(new UpdateUserInternalDataRequest() {
         PlayFabId = "< PlayFab Player Id >",
         Data  = new Dictionary<string, string>() {
             { "SomeKey", "SomeValue" }
         }
    }, 
    result => Debug.Log("Complete setting Internal User Publisher Data"), 
    error =>
    {
        Debug.Log("Error setting Internal User Publisher Data");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

### Getting User Publisher Data

The following snippet demonstrates how to get all 3 kinds of publisher data using client and server APIs:

```csharp
// Use client API to get Regular User Publisher Data for selected user 
public void ClientGetUserPublisherData() {
    PlayFabClientAPI.GetUserPublisherData(new GetUserDataRequest() {
        PlayFabId = "<PlayFab Player Id>"
    }, result => {
        if (result.Data == null || !result.Data.ContainsKey("SomeKey")) Debug.Log("No SomeKey");
        else Debug.Log("SomeKey: " + result.Data["SomeKey"]);
    },
    error => {
        Debug.Log("Got error getting Regular Publisher Data:");
        Debug.Log(error.GenerateErrorReport());
    });
}

// Use client API to get Read-Only User Publisher Data for selected user 
public void ClientGetUserPublisherReadOnlyData() {
    PlayFabClientAPI.GetUserPublisherReadOnlyData(new GetUserDataRequest() {
        PlayFabId = "<PlayFab Player Id>"
    }, result => {
        if (result.Data == null || !result.Data.ContainsKey("SomeKey")) Debug.Log("No SomeKey");
        else Debug.Log("SomeKey: " + result.Data["SomeKey"]);
    },
    error => {
        Debug.Log("Got error getting Read-Only Publisher Data:");
        Debug.Log(error.GenerateErrorReport());
    });
}

// Use server API to get Internal User Publisher Data for selected user 
public void ServerGetUserPublisherInternalData() {
    PlayFabServerAPI.GetUserPublisherInternalData(new GetUserDataRequest() {
        PlayFabId = "<PlayFab Player Id>"
    }, result => {
        if (result.Data == null || !result.Data.ContainsKey("SomeKey")) Debug.Log("No SomeKey");
        else Debug.Log("SomeKey: " + result.Data["SomeKey"]);
    },
    error => {
        Debug.Log("Got error getting Internal Publisher Data:");
        Debug.Log(error.GenerateErrorReport());
    });
}
```

## See Also

- [Using Title Data](using-title-data.md)
- [Using Cloud Script](../../automation/cloudscript/using-cloudscript.md)
