---
title: Using Email Templates to Send an Account Recovery Email
author: v-thopra
description: Tutorial that describes how to use the email template feature of PlayFab to send an account recovery player's contact email address to let a player reset their password.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Using Email Templates to Send an Account Recovery Email

This tutorial walks you through how to use the email template feature of **PlayFab** to send an **Account Recovery Player's** contact email address to let a **Player** reset their password.

## Requirements

> [!IMPORTANT]
> This is an advanced tutorial. Please make sure that all requirements have been met or you will not be able to complete this tutorial.

- To send custom emails with email templates, you will need to have your own **SMTP** server with a **Username** and **Password**. Please be sure that you have your own **SMTP** server *before* using our tutorial [Setting up an SMTP server with add-ons](../../engagement/emails/setting-up-an-smtp-server-with-add-ons.md).

> [!NOTE]
> You can use **Gmail** for testing, but with **Gmail** you are limited to 2,000 emails per day.

- Basic knowledge of how to create a **Player** will be necessary since there will need to be **Players** with a **Usernames** and **Passwords** before calling account recovery logic. Refer to our [Getting Started with PlayFab](../../config/dev-test-live/getting-started-with-playfab.md) tutorial which will run you through the process of creating a **Player** for the **Title**.
- Read the [Game Manager quickstart](../../config/gamemanager/quickstart.md) if you are unfamiliar with the **Game Manager**, as it is the place where email templates are created.
- Knowledge of how to work with **Player Profiles** will be necessary to confirm that emails will be necessary for checking that a contact email has been added to a **Player's Profile**. Please read up on how to get a **Player Profile** in the [Getting Player Profiles](../../data/playerdata/getting-player-profiles.md) tutorial and make sure that under the **Client Profile Options** on your **Title** you allow **Contact email addresses**.

## Step 1 - Create an Email Template

The first thing we will do is create an **Account Recovery Email Template**.

- Go to **Content**.
- Select the **Email Templates** tab.
- Select the **NEW EMAIL TEMPLATE** button.

![Game Manager - Content - Email Templates](media/tutorials/game-manager-content-email-template.png)  

Now add a **New Email Template**, filling in the fields as follows leaving the **Error callback URL** empty:

- **Template name**: PasswordRecoveryTemplate
- **Template type**: Account Recovery
- **Email subject**: Password reset requested
- **Email body**: (enter as below)

```html
<head></head>
<body><p> You recently requested a password reset with us.</p>
<p>Please click <a href='$ConfirmationUrl$'>here</a> to be directed to a page to reset your password. Thanks!</p>
```

- **From Name**: The **Name** you want to show in the **From** field in the **Email**.
- **From Email Address**:  The **Email Address** you want to show in the **From** field in the **Email**. This must be an **Email** domain that the **SMTP** server enables you to send **Emails** from.

> [!NOTE]
> Some **Email** servers, like **Gmail**, will ignore this field and will send from the account set up with the **SMTP** server.

- **Callback URL**:  A **Callback URL** to a password recovery form. At minimum the form must contain a **Password** field for the **Player** to enter a new **Password**.

### A few things to note

- The `$ConfirmationUrl$` in the **Email body** generates a customized **URL** that, when selected, tracks that a **User** has chosen the **URL** and then issues a redirect to the **Callback URL**. In this case, it is injected into an anchor tag.
- The **Callback URL** is the **URL** that **PlayFab** will redirect to after the **Player** selects the confirmation **URL** link. It will need to be a hosted web form that contains at very minimum a **Password** field in order to make a [ResetPassword](xref:titleid.playfabapi.com.admin.accountmanagement.resetpassword) **API** call later in this tutorial.

![Game Manager - Content - Email Templates - New Email Template](media/tutorials/game-manager-content-new-email-template-account-recovery.png)  

After filling the form out, select the **SAVE EMAIL TEMPLATE** button, and you will be redirected back to the page containing the list of your **Email Templates** showing. Make a note of the **ID** of the **Email Template** as it will be used in Step 4.

![Game Manager - Content - Email Template ID](media/tutorials/game-manager-content-passwordrecovery-email-template-id.png)  

## Step 2 - Add Username, Password, Login Email, and Contact Email to a Player

For this next step, you will need an existing **Player Account**. If you don't already have a **Player account**, follow the instructions in [Getting Started with PlayFab](../../config/dev-test-live/getting-started-with-playfab.md).

We will add a **Username**, **Password**, and **Login Email** using [AddUsernamePassword](xref:titleid.playfabapi.com.client.accountmanagement.addusernamepassword). Additionally, we add a **Contact Email** to the **Player** using [AddOrUpdateContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.addorupdatecontactemail).

> [!NOTE]
> A **Contact Email** field on a **Player Profile** is different from the **Login Email** field on a **Player Profile**, even though they may both contain the same **Email** address. Anytime you send **Email** to the **Player**, it will go to the **Contact Email** address.

### C# Code Example

In the following example, we log in a **Player** then add a **Username**, **Password**, and **Login Email** using [AddUsernamePassword](xref:titleid.playfabapi.com.client.accountmanagement.addusernamepassword). We then add a **Contact Email** using [AddOrUpdateContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.addorupdatecontactemail). Make sure the **Email** address associated with the **Player** is one that you have access to.

```csharp
void CreatePlayer()
{
    var loginReq = new LoginWithCustomIDRequest
    {
        CustomId = "SomeCustomID", // replace with your own Custom ID 
        CreateAccount = true // otherwise this will create an account with that ID
    };

    var username = "yourusername"; // Set this to your username
    var password = "yourpassword"; // Set this to your password
    var emailAddress = "testaddress@example.com"; // Set this to your own email

    PlayFabClientAPI.LoginWithCustomID(loginReq, loginRes =>
    {
        Debug.Log("Successfully logged in player with PlayFabId: " + loginRes.PlayFabId);
        AddUserNamePassword(username, password, emailAddress); // Add a username and password
        AddOrUpdateContactEmail(loginRes.PlayFabId, emailAddress);
    }, FailureCallback);
}

void AddUserNamePassword()
{
    var request = new AddUsernamePasswordRequest
    {
        Username = "yourusername",
        Password = "yourpassword",
        Email = "exampleemail@emaple.com" // Login email
    };
    PlayFabClientAPI.AddUsernamePassword(request, result =>
    {
        Debug.Log("The player's account now has username and password");
    }, FailureCallback);
}

void AddOrUpdateContactEmail(string playFabId, string emailAddress)
{
    var request = new AddOrUpdateContactEmailRequest
    {
        PlayFabId = playFabId,
        EmailAddress = emailAddress
    };
    PlayFabClientAPI.AddOrUpdateContactEmail(request, result =>
    {
        Debug.Log("The player's account has been updated with a contact email");
    }, FailureCallback);
}

void FailureCallback(PlayFabError error)
{
    Debug.LogWarning("Something went wrong with your API call. Here's some debug information:");
    Debug.LogError(error.GenerateErrorReport());
}
```

## Step 3 - Confirm that the Contact Email was added to the Player’s Profile

Next, confirm that the **Contact Email** was added to the **Player’s Profile**. Log into the **Game Manager**, and visit the **Player's Profile** page. You should see a **Contact Email** listed for that **Player**.

![Game Manager - Player Profile - Contact email](media/tutorials/game-manager-player-profile-contact-email-verification-pending.png)  

You can also make a call to [GetPlayerProfile](xref:titleid.playfabapi.com.client.accountmanagement.getplayerprofile) with **ShowContactEmailAddresses** in the [PlayerProfileViewConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints) set as **True** to show that the **Player** now has the **Contact Email** that we just added.

## Step 4 - Send an Account Recovery Template Email

Now we will send the **Verification Email** using **SendEmailFromTemplate** using the **Email Template ID** in Step 1 to the **Player** we created in Step 2.

### C# Code Example

In the following example, we send an account recovery email using [SendCustomAccountRecoveryEmail](xref:titleid.playfabapi.com.server.accountmanagement.sendcustomaccountrecoveryemail).

```csharp
void SendCustomAccountRecoveryEmail(string emailAddress, string emailTemplateId)
{
    var request = new SendCustomAccountRecoveryEmailRequest
    {
        Email = emailAddress,
        EmailTemplateId = emailTemplateId
    };

    PlayFabServerAPI.SendCustomAccountRecoveryEmail(request, res =>
    {
        Debug.Log("An account recovery email has been sent to the player's email address.");
    }, FailureCallback);
}

void FailureCallback(PlayFabError error)
{
    Debug.LogWarning("Something went wrong with your API call. Here's some debug information:");
    Debug.LogError(error.GenerateErrorReport());
}
```

## Step 5 - Check that the Email was sent

Finally, we can check that the **Account Recovery Email** was sent.

The first thing you can do is to the the **Player's PlayStream**. In **Game Manager**:

- Select **Player** from the menu on the left.
- Go to th **PlayStream** area of the screen.
- It should display a **Sent Email Event**.

![Game Manager - Players - PlayStream - Sent email event](media/tutorials/game-manager-players-playstream-sent-email-event.png)  

Selecting the **Info** icon on the **Event** should show **JSON** similar to what appears below.

```json
{
    "EventName": "sent_email",
    "EventNamespace": "com.playfab",
    "Source": "PlayFab",
    "EntityType": "player",
    "TitleId": "YourTitleId",
    "EventId": "655f14ac45b341b59c217dcf04d26ef9",
    "EntityId": "64647AA368D6448E",
    "SourceType": "BackEnd",
    "Timestamp": "2017-10-27T23:53:58.8717009Z",
    "History": null,
    "CustomTags": null,
    "Reserved": null,
    "emailTemplateId": "DC3E1B28881C6071",
    "emailTemplateName": "PasswordRecoveryTemplate",
    "emailTemplateType": "AccountRecovery",
    "success": true,
    "emailName": "Primary"
}
```

To check that you actually receive the **Email**, go to the **Email** of the **Player** you created in Step 2. There should be an **Email** that looks like what is shown below.

![Password reset requested - email](media/tutorials/password-reset-requested-email.png)  

If you inspect the **URL** in that **Email**, you will see that it looks something like this example.

```html
https://a5f3.playfabapi.com/EmailConfirmation/Confirm/?token=2346241B7C277796&titleId=A5F3&templateId=38017AAE7F494AB3
```

When the **Player** selects that **URL**, three things happen:

1. **PlayFab** generates a new **PlayStream Event** called **auth_token_validated**. This is how you know that the **Player** selected that **URL** in the **Email**. You can use that **Event** to trigger actions, like granting coins or items to the **Player**.
2. **PlayFab** will return a redirect **URL** sending the **Player** to the callback **URL**. In this case, it should be a website for the game with a form for the **Player** to enter a new **Password**.
3. The redirect **URL** will contain a **Token** in the query string, and will look something like **https://www.example.com/?token=2346241B7C277796**.

## Step 6 - Reset the Player's Password

After the **Player** is directed to the callback **URL** and fills out the form with a new **Password**, you can use that information, in addition to the **Token** in the query string, to issue a [ResetPassword](xref:titleid.playfabapi.com.admin.accountmanagement.resetpassword) call.

### C# Code Example

In the following example, we reset a **Player's Password**, based on a **Token** and the new **Password** the **Player** specifies in a form using [ResetPassword](xref:titleid.playfabapi.com.admin.accountmanagement.resetpassword).

```csharp
void ResetPassword(string newPassword, string token)
{
    var request = new ResetPasswordRequest
    {
        Password = newPassword,
        Token = token
    };

    PlayFabAdminAPI.ResetPassword(request, result =>
    {
        Debug.Log("The player's password has been resetl");
    }, FailureCallback);

}

void FailureCallback(PlayFabError error)
{
    Debug.LogWarning("Something went wrong with your API call. Here's some debug information:");
    Debug.LogError(error.GenerateErrorReport());
}
```

## Step 7 - Check that the password was reset

Finally, check that the player has reset their password successfully by logging in with [LoginWithPlayFab](xref:titleid.playfabapi.com.client.authentication.loginwithplayfab).

### C# Code Example

In the following C# example, we log in using [LoginWithPlayFab](xref:titleid.playfabapi.com.client.authentication.loginwithplayfab) and the new password the player reset to in Step 6.

```csharp
void LoginWithPlayFab(string username, string password)
{
    var request = new LoginWithPlayFabRequest
    {
        Username = username,
        Password = password
    };

    PlayFabClientAPI.LoginWithPlayFab(request, result =>
    {
        Debug.Log("Successfully logged in player with ID " + result.PlayFabId);
    }, FailureCallback);
}

void FailureCallback(PlayFabError error)
{
    Debug.LogWarning("Something went wrong with your API call. Here's some debug information:");
    Debug.LogError(error.GenerateErrorReport());
}
```

## Conclusion

So that's it for this tutorial. You've seen how to set up your **SMTP** server, create an **Email Template**, send an **Account Recovery Email**, and reset a **Player's Password**.

If you have any questions or feedback on this tutorial, please email us at [devrel@playfab.com](mailto:devrel@playfab.com).
