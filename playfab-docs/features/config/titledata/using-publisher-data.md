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

This tutorial describes how to create and use **Publisher (Studio) Data**.

**Publisher Data** is data that spans more than one **Title** - such as when you have multiple games that need to share common information among your games.

> [!NOTE]
> This category also includes data for **Players** that spans multiple games. **PlayFab** stores data as **key/value pairs (KVPs)**.

Most of these **APIs** are **Server APIs** that your program must call from a dedicated server or through a **CloudScript** function within the **PlayFab** service.

- Use the **Server APIs** **[SetPublisherData](xref:titleid.playfabapi.com.server.title-widedatamanagement.setpublisherdata)** to update, and **[GetPublisherData](xref:titleid.playfabapi.com.server.title-widedatamanagement.getpublisherdata)** to retrieve, publisher-specific custom **KVPs**.
- Use **[UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata)** to create or update, and *[GetUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata)** to retrieve, publisher-specific custom **KVPs** for the **Player**.
- Use the **Server API** **[UpdateUserPublisherReadOnlyData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherreadonlydata)** to update, and the **Client API** **[GetUserPublisherReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherreadonlydata)** to retrieve, the read-only publisher-specific custom **KVPs** for the user.
- Use the **Server APIs** **[UpdateUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)** to update, and **[GetUserPublisherInternalData](xref:titleid.playfabapi.com.server.playerdatamanagement.updateuserpublisherinternaldata)** to retrieve, the internal publisher-specific custom **KVPs** for the user.

You must call the **Server APIs** from a dedicated server or through a **CloudScript** function through the **PlayFab** service. This is by design, as the **PlayFab Server APIs** require that you supply your secret **Key**.

> [!TIP]
> We *do not recommend* using **Server APIs** from within a game client, if you need to make use of a **Server API**, use **CloudScript** for this type of functionality.

> [!NOTE]
> **Publisher Data** values are copied and distributed to potentially hundreds of machines in the **PlayFab** cluster server. As part of this process, **Publisher Data** is cached and changes may take up to *fifteen minutes* to refresh in those caches. **Publisher Data** is best suited for **global constant/static data**, and *is not* suitable or reliable as **global variables**.

## Publisher Data

**Publisher Data** is used to store static data for a set of **Titles**. Each entry **is not bound** to any **PlayFab** entity, such as a **Player** (as opposed to [user publisher data](#user-publisher-data)).

### Setting Publisher Data

The following snippet demonstrates how to set **Publisher Data** using the **Server API**.

> [!NOTE]
> There is an **Admin API** counterpart for this operation.

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

The following snippet demonstrates getting **Publisher Data** using the **Client API**.

> [!NOTE]
> There are **Server** and **Admin API** counterparts for this operation.

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

User **Publisher Data** can be used to introduce **Publisher Data** that is bound to a **PlayFab** user (**Player**).

Unlike regular **Publisher Data**, it is possible for a **Client Application** to alter user **Publisher Data**. **PlayFab** exposes 3 protection levels for **User Publisher Data** from the **Client API** point of view:

1. **Regular User Publisher Data** exposes read and write access for client applications.

     - Set via **Client**, **Server**, and **Admin API**.
     - Get via **Client**, **Server**, and **Admin API**.
     - The **Client API** may only set **Publisher Data** for a **Player** that is currently logged in.

1. **Read-Only user Publisher Data** exposes read access for **Client Applications**.

     - Set via **Server** and **Admin API**.
     - Get via **Client**, **Server**, and **Admin API**.

1. **Internal user Publisher Data** exposes no access for **Client Applications** and is used to store the secret portion of user data.

     - Set via **Server** and **Admin API**.
     - Get via **Server** and **Admin API**.

### Setting user Publisher Data

The following snippet demonstrates how to set all 3 kinds of **Publisher Data** using **Client** and **Server APIs**.

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

The following snippet demonstrates how to get all 3 kinds of **Publisher Data** using **Client** and **Server APIs**.

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
