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

# Using Publisher data

This tutorial describes how to create and use **Publisher** (**Studio**) data.

**Publisher** data is data that spans more than one title - such as when you have multiple games that need to share common information.

> [!NOTE]
> This category also includes data for players that spans multiple games. PlayFab stores data as Key/Value Pairs (KVPs).

Most of these **APIs** are server **APIs** that your program must call from a dedicated server or through a **CloudScript** function within the PlayFab service.

- Use the server **APIs** **[SetPublisherData](xref:titleid.playfabapi.com.server.title-widedatamanagement.setpublisherdata)** to update, and **[GetPublisherData](xref:titleid.playfabapi.com.server.title-widedatamanagement.getpublisherdata)** to retrieve, **Publisher**-specific custom KVPs.
- Use **[UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata)** to create or update, and *[GetUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata)** to retrieve, **Publisher**-specific custom KVPs for the player.
- Use the server **API** **[UpdateUserPublisherReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherreadonlydata)** to update, and the client **API** **[GetUserPublisherReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherreadonlydata)** to retrieve, the read-only **Publisher**-specific custom KVPs for the user.
- Use the Server **APIs** **[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)** to update, and **[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)** to retrieve, the internal **Publisher**-specific custom KVPs for the user.

You must call the server **APIs** from a dedicated server or through a **CloudScript** function through the PlayFab service. This is by design, as the PlayFab server **APIs** require that you supply your secret key.

> [!TIP]
> We *do not recommend* using server **APIs** from within a game client. If you need to make use of a server **API**, use **CloudScript** for this type of functionality.

> [!NOTE]
> **Publisher** data values are copied and distributed to potentially hundreds of machines in the PlayFab cluster server. As part of this process, this data is cached and changes may take up to *fifteen minutes* to refresh in those caches. **Publisher** data is best suited for *global constant/static data*, and *is not* suitable or reliable as *global variables*.

## Publisher data

**Publisher** data is used to store static data for a set of titles. Each entry *is not bound* to any PlayFab entity, such as a player (as opposed to [user publisher data](#user-publisher-data)).

### Setting Publisher data

The following snippet demonstrates how to set **Publisher** data using the server **API**.

> [!NOTE]
> There is an admin **API** counterpart for this operation.

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

### Getting Publisher data

The following snippet demonstrates getting **Publisher** data using the client **API**.

> [!NOTE]
> There are server and admin **API** counterparts for this operation.

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

## User Publisher data

User **Publisher** data can be used to introduce **Publisher** data that is bound to a PlayFab user (player).

Unlike regular **Publisher** data, it is possible for a client application to alter user **Publisher** data.

PlayFab exposes 3 protection levels for user **Publisher** data from the client **API** point of view:

1. Regular user **Publisher** data exposes read and write access for client applications.

     - Set via client, server, and admin **API**.
     - Get via client, server, and admin **API**.
     - The client **API** may only set **Publisher** data for a player who is currently logged in.

1. Read-only user **Publisher** data exposes read access for client applications.

     - Set via server and admin *API**.
     - Get via client, server, and admin **API**.

1. Internal user **Publisher** data exposes no access for client applications, and is used to store the secret portion of user data.

     - Set via server and admin **API**.
     - Get via server and admin **API**.

### Setting user Publisher data

The following snippet demonstrates how to set all 3 kinds of **Publisher** data using client and server **APIs**.

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

### Getting User Publisher data

The following snippet demonstrates how to get all 3 kinds of **Publisher** data using client and server **APIs**.

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

## See also

- [Title Data quickstart](quickstart.md)
- [CloudScript quickstart](../../automation/cloudscript/quickstart.md)
