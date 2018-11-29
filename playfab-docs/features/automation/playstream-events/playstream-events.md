---
title: PlayStream Events
author: v-thopra
description: Provides an overview of automatic and custom PlayStream events in PlayFab.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, playstream, events, custom events, automatic events
ms.localizationpriority: medium
---

# PlayStream Events

This tutorial provides an overview of **Automatic** and **Custom PlayStream** events in **PlayFab**.

## Automatic Event Overview

As the name implies, an **Automatic Event** is an event that occurs automatically with a normal **API** method call. Most existing **API** methods will generate **PlayStream Events**.

Sometimes, however, you will need to capture **Events** that are very specific for your game and are not provided by **PlayFab** out of the box.

For that purpose, consider using a Custom Event (as described in the next section, [Custom Event Overview](#custom-event-overview)).

### Example

If an **Email** and **Password** pair is valid, The following **API** call will sign in a player with email and password.

```csharp
PlayFabClientAPI.LoginWithEmailAddress(new LoginWithEmailAddressRequest() {
    Email = "my@email.com",
    Password = "qwerty"
}, 
result=> Debug.Log(result.PlayFabId), 
error=> Debug.LogError(error.GenerateErrorReport()));
```

As a side effect, **PlayFab** will record a **player_logged_in Event**. Consider using the [Event History](event-history.md) to test the described behavior.

![Game Manager - Event History Chart](media/tutorials/game-manager-event-history-chart.png)  

## Custom Event Overview

While **PlayFab** records a lot of **Events** automatically, sometimes you need **Events** that are *very specific* for your game.

The concept of **Custom Events** allows you to post **Events** with an arbitrary type and name. Similar to **Automatic Events**, **Custom Events** are fully reflected through [real-time analytics tools](../../analytics/metrics/real-time-analytics-core-concepts.md).

Unlike **Automatic Events**, you need a *little* bit of custom code to post **Custom Events**.

**Custom Events** can be classified by **Entity**. A **Custom Event** can be bound to a **Player**, **Character**, or **Title**. An **Event Entity** reference is specified using two fields:

- **EntityType**

- **EntityID**

### Relevant API Calls

[WritePlayerEvent](xref:titleid.playfabapi.com.client.analytics.writeplayerevent), [WriteCharacterEvent](xref:titleid.playfabapi.com.client.analytics.writecharacterevent), [WriteTitleEvent](xref:titleid.playfabapi.com.client.analytics.writetitleevent)

### Example: Post your own Custom Event

You want to aggregate information about **Players** opening various chests. Along with standard event information, you want to record **ChestType** and **LevelID**.

Unfortunately, **PlayFab** does not provide a corresponding [Automatic Event](#automatic-event-overview) out of the box. Use a **Custom Player Event** to solve the problem.

### Prerequisites

Your **Player** is already logged in. In your code, you have a callback **OnChestOpen**. **LevelID** and **ChestType** are passed into that callback.

### Solution

Once executed, the following code will post your custom player event.

```csharp
private void OnChestOpened(string chestType, int levelId) {
    PlayFabClientAPI.WritePlayerEvent(new WriteClientPlayerEventRequest() {
        Body = new Dictionary<string, object>() {
            { "ChestType", chestType },
            { "LevelId", levelId }
        },
        EventName = "player_chest_opened"
    },
    result => Debug.Log("Success"),
    error => Debug.LogError(error.GenerateErrorReport()));
}
```

1. The method receives **ChestType** and **LevelID**.

1. Use the [WritePlayerEvent](xref:titleid.playfabapi.com.client.analytics.writeplayerevent) **API** call for posting a **Custom Event** bound to a **Player**.
1. Provide a body that is specific for your event and your needs (in this case we provide the **ChestType** and **LevelId** fields).
1. Provide an **Event Name** identifying your **Custom Event** (in this case we use the **player_chest_opened Event Type Name**).

### Testing

Once the solution code is executed, consider using the [Event History](event-history.md) to check that your **Event** has been successfully registered.

![Game Manager - Event History Detail](media/tutorials/game-manager-event-history-detail.png)  

1. **Filter** using the **Event Name**.
2. Ensure the **player_chest_opened Events** are in the list.
3. Ensure that your custom body fields are recorded: **ChestType** and **LevelId**.
