---
title: Event Partitioning quickstart (Preview)
author: sofiamarinv
description: Event Partitioning quickstart
ms.author: sofiamarin
ms.date: 11/22/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, event, events, event partitioning, partition, quickstart, tutorial, how-to
ms.localizationpriority: medium
---

# Event Partitioning quickstart

> [!NOTE]
> The Event Partitioning feature is in private preview, this means it's only available to be used by specific titles we enable it for. We anticipate ongoing changes to it, without notice, as we continue gathering feedback and optimizing for customer use.

Event Partitioning can be managed through Game Manager and through APIs.

## Adding, editing, and deleting Managed Events in Game Manager 

Learn how to configure partitioning by adding, editing, and deleting Manage Events through Game Manager. 

### Add a Managed Event
 
- Go to **PlayFab** and sign in to [Game Manager](https://developer.playfab.com/).
- Navigate to your **Title**. 
- Select **Data** from the menu on the left.
- Select **Manage Events (Preview)** tab.
- Select **Add Managed Event**.
- In the **Event Type** dropdown, choose the event you’d like to manage. If the custom event doesn't appear in the drop down you can type in your custom event name and select the option to create the event name.
- Leave the sampling percentage at the default value. If you also want to sample events, see [Event Sampling overview](event-sampling-overview.md) for details on setting this value.
- Check the box for **Partition in Data Connections** to enable partitioning for this event.
- Select **Save**.

### Edit a Managed Event

- Select **Managed Events** tab.
- Select **Event namespace** to open the event.
- You can edit the **Sample Rate** % and the **Partition in Data Connections** checkbox.
- Select **Save**.

### Delete a Managed Event

- Select **Managed Events** tab.
- Select the checkbox at the left of **Event namespace** to select the Managed Event you want to delete.
- Select  **Delete** at the top of the table.
- Select **Delete** to confirm. 

### Managing Event Partitioning through APIs

Event Partitioning can also be managed with the following ManageEvents APIs.

#### SetManagedEvents

This API can be used to set a list of managed events for the title. If the event name and namespace combination is present already, it will update the existing settings with the new one. 

Request example: 

```HTTP

POST : https://<titleid>.playfabapi.com/Event/SetManagedEvents 

{ 
    "ManagedEvents":[{ 
                "Namespace": "demo_namespace, 
                "Name": "demo_name", 
                "SamplingRatio": 100, 
                "isPartitioned": true 
            }] 
}

```

#### DeleteManagedEvents 

**DeleteManagedEvents** API is used to delete an event name and event namespace combo from the list of managed events for the title. Use the API with the name and namespace in the body of the request.

Request example: 

```HTTP

POST https://<titleid>.playfabapi.com/Event/DeleteManagedEvent

{ 
      "Namespace": "demo_namespace", 
      "Name": "demo_name" 
} 

```

#### GetManagedEvent

**GetManagedEvent** is used to get the settings for a managed event.

Request example:

```HTTP

POST https://<titleid>.playfabapi.com/Event/GetManagedEvent

{ 
      "Namespace": "demo_namespace", 
      "Name": "demo_name" 
}

```

#### GetManagedEvents

**GetManagedEvents** is used to get the list of all managed Events.  

Request example:

```HTTP

POST https://<titleid>.playfabapi.com/Event/GetManagedEvents

```

## Next steps

* [Event Partitioning overview](event-partitioning-overview.md)
