---
title: Getting player profiles
author: v-thopra
description: Describes how to use the GetPlayerProfile and PlayerProfileViewConstraints APIs to retrieve player profile data.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, playfab api, player data, player profiles
ms.localizationpriority: medium
---

# Getting player profiles

This tutorial walks you through how to use the [GetPlayerProfile](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile) call to get a **Player’s** profile with [PlayerProfileViewConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints) properties that are enabled from your **Title’s** setting. In the following example, we will be getting a **Player’s** profile, created date, and last login time.

## Requirements

For this tutorial, basic knowledge of how to create a **Player** for your **Title** is needed so that you can perform a **GetPlayerProfile** on the **Player**.

It is also worthwhile to read the [Game Manager quickstart](../../config/gamemanager/quickstart.md) if you are unfamiliar with the Game Manager, as it is the place where we configure profile constraints.
> [!Note]
> For more information on creating a **Player**, refer to the [Getting Started with PlayFab](../../config/dev-test-live/getting-started-with-playfab.md) tutorial which will run you through the process of creating a **Player** for the **Title**.

## Step 1 - Create a User with a Display Name

The first step is to create a **Player** and add a **Display Name** to the **User**. This example will create a new **User** with the display name **UnicornTossMaster**.

```csharp
void CreatePlayerAndUpdateDisplayName() {
    PlayFabClientAPI.LoginWithCustomID( new LoginWithCustomIDRequest {
        CustomId = "PlayFabGetPlayerProfileCustomId",
        CreateAccount = true
    }, result => {
        Debug.Log("Successfully logged in a player with PlayFabId: " + result.PlayFabId);
        UpdateDisplayName();
    }, error => Debug.LogError(error.GenerateErrorReport()));
}

void UpdateDisplayName() {
    PlayFabClientAPI.UpdateUserTitleDisplayName( new UpdateUserTitleDisplayNameRequest {
        DisplayName = "UnicornTossMaster"
    }, result => {
        Debug.Log("The player's display name is now: " + result.DisplayName);
    }, error => Debug.LogError(error.GenerateErrorReport()));
}
```

The response should show **Successfully logged in a player with PlayFabId: SOME_PLAYFAB_ID** followed by **The player's display name is now: UnicornTossMaster**.

## Step 2 - Making a Player profile call

Now that there is a **Player** that we can call and get a **Player** profile for, the next step is to make a very basic profile for the **Player**.

In the following **Player** example is a basic [GetPlayerProfile](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile) call.

```csharp
void GetPlayerProfile(string playFabId) {
    PlayFabClientAPI.GetPlayerProfile( new GetPlayerProfileRequest() {
        PlayFabId = playFabId,
        ProfileConstraints = new PlayerProfileViewConstraints() {
            ShowDisplayName = true
        }
    }, 
    result => Debug.Log("The player's DisplayName profile data is: " + result.PlayerProfile.DisplayName),
    error => Debug.LogError(error.GenerateErrorReport()));
}
```

In the response there will be a [PlayerProfileModel](https://api.playfab.com/documentation/server/datatype/playfab.server.models/PlayFab.Server.Models.PlayerProfileModel) object which will contain the display name **UnicornTossMaster** for the **Player**.

## Step 3 - Attempting to get Player Created time and Last Login time

In the [PlayerProfileModel](https://api.playfab.com/documentation/server/datatype/playfab.server.models/PlayFab.Server.Models.PlayerProfileModel) object there is a fair amount of data about the **Player**. In the previous step, a **GetPlayerProfile** was issued, and the response that was received only contained **Display Name** information.

The next step is to get even *more* profile data for the **Player**. To do so, we will call **GetPlayerProfile** with additional fields in the [PlayerProfileViewConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints) request parameter.

The following **C#** example modifies the **GetPlayerProfile** method from step 2 and calls **GetPlayerProfile** to request the **Created** and **LastLogin** fields by setting their flags in the [ProfileConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints).

> [!NOTE]
> **This will be an unsuccessful call at this step!!!**

```csharp
void CreatePlayerAndUpdateDisplayName(string playFabId) {
    PlayFabClientAPI.GetPlayerProfile( new GetPlayerProfileRequest() {
        PlayFabId = playFabId,
        ProfileConstraints = new PlayerProfileViewConstraints {
            ShowDisplayName = true,
            ShowCreated = true,
            ShowLastLogin = true
        }
    }, 
    result => Debug.Log("The player's profile Created date is: " + result.PlayerProfile.Created),
    error => Debug.LogError(error.GenerateErrorReport()));
}
```

This call should result in an **Error** with an **Error Code 1303**. **RequestViewConstraintParamsNotAllowed** and an **Error** message stating that there are **Invalid view constraints** with a **JSON** output of constraints that the **Title** currently has set.

The **Error** message has occurred because we have not yet configured the ability to show **Created** and **LastLogin** in our **Title’s** profile constraint settings.

## Step 4 - Configuring Player profile view constraints for the Title

In order to get more data when we call the [GetPlayerProfile](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile) **API**, we will need to configure the constraints on the data to be available. These settings are in the **Title’s** settings in **Game Manager**.

To configure constraints for the **Title**:

- Go to **Game Manager**.
- Go to **Settings**.
- Select the **Client Profile Options** tab.
- Notice that under **ALLOW CLIENT ACCESS TO PROFILE PROPERTIES:**, only **Display name** is checked. This is what allowed us to get the **Display Name** in step 1.

- Now to enable both **Created** and **LastLogin** in the [ProfileConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints), check **Creation date** and **Last login time**, then select the **SAVE CLIENT PROFILE OPTIONS** button.

![PlayFab Settings - Client Profile Options - Allow client access to profile properties](media/tutorials/playfab-allow-client-access-to-profile-properties.png)  

## Step 5 - Getting Player Created time and Last Login time

Now we can go back to the **GetPlayerProfile** call in step 3.

Executing the same code again will now return a successful [PlayerProfileModel](https://api.playfab.com/documentation/server/datatype/playfab.server.models/PlayFab.Server.Models.PlayerProfileModel) with data on the **User’s Creation** time, **Last Login**, and the **Display Name** of **UnicornTossMaster**.

## Step 6 - Getting Player profile via Login operation

In most cases you will want to get certain **Player** profile data as soon as a **Player** is logged in. The **PlayFab API** allows you to combine those 2 calls into one.

The following example shows how to gain profile information through a **Login** request, and uses **LoginWithCustomId** as an example.

> [!NOTE]
> This works with *every* login mechanism.

```csharp
void CreatePlayerAndUpdateDisplayName(string customId) {
    PlayFabClientAPI.LoginWithCustomID( new LoginWithCustomIDRequest() {
        CustomId = customId,
        // Define info request parameters
        InfoRequestParameters = new GetPlayerCombinedInfoRequestParams() {
            // And make sure PlayerProfile is included
            GetPlayerProfile = true,
            // Define rules for PlayerProfile request
            ProfileConstraints = new PlayerProfileViewConstraints() {
                // And make sure that both AvatarUrl and LastLogin are included.
                ShowAvatarUrl = true,
                ShowLastLogin = true,
            }
        }
    },
    result =>
    {
        // Extract the data you have requested
        var avatarUrl = result.InfoResultPayload.PlayerProfile.AvatarUrl;
    },
    error => Debug.LogError(error.GenerateErrorReport()));
}
```
