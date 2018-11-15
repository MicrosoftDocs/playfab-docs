---
title: Title News
author: v-rayro
description: What Title News is and how to create it.
ms.author: v-rayro
ms.date: 11/01/2018
ms.topic: article
ms.prod: gaming
ms.technology: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Title News

Title News is a mechanism for communicating with your players. It contains a few basic elements: Title, Date, Status, and Body. The body is a string, and can contain raw text or JSON.

## Create Title News

There are two ways to create Title News entries:
1. Using Game Manager
2. Using the admin API method [AddNews](xref:titleid.playfabapi.com.admin.title-widedatamanagement.addnews).

To create Title News entries using Game Manager, you will need to be familiar with [Game Manager](../../config/gamemanager/game-manager-tour.md).

Game Manager: Navigate to your title -> Content -> Title News -> Title News

![Title News](../media/tutorials/game-manager-content-title-news.png)

Select **Save Title News** and your entry will be created. The date will be set to the date when you selected the **Save Title News** button.

Alternately, you can create Title News by calling [AddNews](xref:titleid.playfabapi.com.admin.title-widedatamanagement.addnews). Using the admin API allows you to specify a custom timestamp. News added this way is immediately published. Here's a code example:

```csharp


void CreateNews() {
    PlayFabAdminAPI.AddNews(new AddNewsRequest {
        Timestamp = new DateTime(2014, 1, 8, 12, 0, 0), // Any date - This one is the founding of PlayFab
        Title = "My Second News",
        Body = "This is my second news post."
    }, 
    result => Debug.Log("News post added!"),
    error => Debug.LogError(error.GenerateErrorReport()));
}

```

## Read Title News

Reading the Title News is very simple. The GetTitleNews methods return get all published Title News entries.  
Archived and Unpublished entries will not be returned.

```csharp


void ReadTitleNews() {
    PlayFabClientAPI.GetTitleNews(new GetTitleNewsRequest(), result => {
        Debug.Log("Got latest news!");
        // Process news using result.News
    }, error => Debug.LogError(error.GenerateErrorReport()));
}

```

## Update Title News

The content of a Title News entry can only be modified in Game Manager.  Locate the entry you wish to modify:

Game Manager: Navigate to your title -> Content -> Title News -> Select Existing Entry

Update the **Title**, **Status**, or **Data** for the entry and select **Save Title News**.

If plan is to post unpublished entries for future release, this is the methodology to to use to transition them into published and archived states. It also allows the user to fix typos.

## Delete Title News

Once an entry is no longer needed, you can delete it in **Game Manager**. Find the entry you wish to modify:

Game Manager: Navigate to your title -> Content -> Title News -> Checkbox for Existing Entry

Select the **Title News** entries you wish to delete, and select **X Delete Title News**.
