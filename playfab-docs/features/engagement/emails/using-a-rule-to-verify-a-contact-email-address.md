---
title: Using a Rule to Verify a Contact Email Address
author: v-thopra
description: Tutorial that describes how to create a rule that sends an verification email when a player changes their contact email address.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, engagement, email, rules
ms.localizationpriority: medium
---

# Using a Rule to Verify a Contact Email Address

This tutorial walks you through how to create a rule that sends an verification email when a player changes their contact email address.

## Requirements

> [!IMPORTANT]
> This is an advanced tutorial. Please make sure that all requirements have been met or you will not be able to complete this tutorial.

- To send custom emails with email templates, you will need to have your own SMTP server with a username and password. Please ensure that you have your own SMTP server before following our tutorial [Setting up an SMTP server with add-ons](../../engagement/emails/setting-up-an-smtp-server-with-add-ons.md). Note that you can use Gmail for testing, but with Gmail you are limited to 2,000 emails per day.
- Basic knowledge of how to create a player will be necessary since there will need to be players with a username and password before calling account recovery logic. Refer to our [Getting Started with PlayFab](../../config/dev-test-live/getting-started-with-playfab.md) tutorial which will run you through the process of creating a player for the title.
- Read the [Game Manager Tour](../../config/gamemanager/game-manager-quickstart.md) if you are unfamiliar with the Game Manager as it is the place where email templates are created.
- Knowledge of how to work with player profiles will be necessary to confirm that emails will be necessary for checking that a contact email has been added to a player’s profile. Please read up on how to get a player’s profile in the [Getting Player Profiles](../../data/playerdata/getting-player-profiles.md) tutorial and make sure that under the “Client Profile Options” on your title you allow “Contact email addresses”.
- Creating a rule will be necessary in this tutorial it is a good idea to read up on how [Rules](../../automation/actions-rules/playstream-hooks-rules-conditions-and-actions.md) work.

## Step 1 - Create an Email Template

The first thing we will do is create an account recovery email template. Go to Content -> Email Templates. Click NEW EMAIL TEMPLATE.

![Game Manager - Content - Email Templates](media/tutorials/game-manager-content-email-template.png)  

Now add a new email template filling in the fields as follows leaving the “Error callback URL” empty:

- **Template name**: MyFirstEmailVerificationTemplate
- **Template type**: Email Verification
- **Email subject**: Verify your email
- **Email body**: (enter as below)

```html
<head></head>
<body><p> You recently registered a new email with us.</p>
<p>Please click <a href="$ConfirmationUrl$">here</a> confirm your email. Thanks!</p>
```

- **From name**: The name you want to show in the “From” field in the email.
- **From email address**:  Email address you want to show in the “From” field in the email. This must be an email domain that the SMTP server enables you to send emails from. Note that some email servers, like Gmail, will ignore this field and will send from the account set up with the SMTP server.
- **Callback URL**:  http://www.example.com

### A few things to note

- The `$ConfirmationUrl$` in the **Email body** generates a customized URL that, when clicked, tracks that a user has clicked the URL and then issues a redirect to the Callback URL. In this case, it is injected into an anchor tag.
- The **Callback URL** is the URL that PlayFab will redirect to after the player clicks on the confirmation URL link. It can be a static page that tells the user they were successful in confirming their email. In this case, we will redirect to http://www.example.com.

![Game Manager - Content - Email Templates - New Email Template](media/tutorials/game-manager-content-new-email-template-email-verification.png)  

After filling the form out, click SAVE EMAIL TEMPLATE and you will be redirected back to the page containing the list of your email templates showing. Make a note of the ID of the email template as it will be used in Step 4.

![Game Manager - Content - Email Template ID](media/tutorials/game-manager-content-emailverification-template-id.png)  

## Step 2 - Create a rule to send an email when a contact email is updated

Next, we will create a rule to send a verification email every time a player updates their contact email. In Game Manager, go to Automation -> Rules and click NEW RULE.

Fill out the rule name of your rule VerifyUpdatedEmail. From the Event type drop-down, pick com.playfab.player_updated_contact_email.

Under actions, click +ADD ACTION.

![Game Manager - Automation - New Rule](media/tutorials/game-manager-automation-new-rule-add-action.png)  

Choose "Send email" from the **Type** drop-down. The **Email template** drop-down should be populated by the template created in Step 1 "MyFirstEmailVerificationTemplate". If it is not, pick "MyFirstEmailVerificationTemplate" from the drop-down.

![Game Manager - Automation - New Rule](media/tutorials/game-manager-automation-new-rule-save-action.png)  

## Step 3 - Add a contact email to a player

For this next step, you will need an existing player account. If you don't already have a player account, follow the instructions in [Getting Started with PlayFab](../../config/dev-test-live/getting-started-with-playfab.md).

We add a contact email to the player using [AddOrUpdateContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.addorupdatecontactemail).

Note that a Contact email field on a player profile is different from the Login email field on a player profile, even though they may both contain the same email address. Anytime you send email to the player, it will only go to the contact email address.

### C# Code Example

In the following example, we log in a player then add a contact email using [AddOrUpdateContactEmail](xref:titleid.playfabapi.com.client.accountmanagement.addorupdatecontactemail). Make sure the email address associated with the player is one that you have access to.

```csharp
void AddContactEmailToPlayer()
{
    var loginReq = new LoginWithCustomIDRequest
    {
        CustomId = "SomeCustomID", // replace with your own Custom ID 
        CreateAccount = true // otherwise this will create an account with that ID
    }; 
    
    var emailAddress = "testaddress@example.com"; // Set this to your own email

    PlayFabClientAPI.LoginWithCustomID(loginReq, loginRes =>
    {
        Debug.Log("Successfully logged in player with PlayFabId: " + loginRes.PlayFabId);
        AddOrUpdateContactEmail(loginRes.PlayFabId, emailAddress);
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

## Step 4 - Confirm that the contact email was added to the player’s profile

Next, confirm that the contact email was added to the player’s profile. Log into the game manager, and visit the players profile page. You should see a contact email listed for that player, with Verification Status: Pending. Please note that the verification status could be "Unverified" if the verification e-mail was not yet sent out, but will be in the "Pending" state as soon as the e-mail is sent.

![Game Manager - Player Profile - Contact email](media/tutorials/game-manager-player-profile-contact-email-verification-pending.png)  

You can also make a call to [GetPlayerProfile](xref:titleid.playfabapi.com.client.accountmanagement.getplayerprofile) with “ShowContactEmailAddresses” in the [PlayerProfileViewConstraints](xref:titleid.playfabapi.com.server.accountmanagement.getplayerprofile#playerprofileviewconstraints) set as true to show that the player now has the contact email that we just added.


## Step 5 - Check that the email was sent

Finally, we can check that the account recovery email was sent.

The first thing you can do is to the the player's PlayStream. In Game Manager go to Player -> PlayStream and it should show a "Sent email" event.

![Game Manager - Players - PlayStream - Sent email event](media/tutorials/game-manager-players-playstream-sent-email-event.png)  

Clicking on the info icon on the event should show JSON similar to:

```json
{
    "EventName": "sent_email",
    "EventNamespace": "com.playfab",
    "Source": "PlayFab",
    "EntityType": "player",
    "TitleId": "YourTitleId",
    "EventId": "a05625e48b1f4194bd08d1ff6a889cf8",
    "EntityId": "64647AA368D6448E",
    "SourceType": "BackEnd",
    "Timestamp": "2017-10-27T09:35:16.2946918Z",
    "History": null,
    "CustomTags": null,
    "Reserved": null,
    "emailTemplateId": "7D6438687903D4DC",
    "emailTemplateName": "MyFirstEmailVerificationTemplate",
    "emailTemplateType": "EmailVerification",
    "success": true,
    "emailName": "Primary"
}
```

And to check if you actually got the email, go to the email of the player you created in Step 3. There should be an email that looks like:

![Verify your email - email](media/tutorials/verify-your-email-email.png)  

If you inspect the URL in that email, you will see that it looks something like this:

```html
https://a5f3.playfabapi.com/EmailConfirmation/Confirm/?token=2346241B7C277796&titleId=A5F3&templateId=38017AAE7F494AB3
```

When the player clicks that URL, three things happen:

1. PlayFab generates a new PlayStream event called "auth_token_validated". This is how you know that the player clicked that URL in the email. You can use that event to trigger actions, like granting coins or items to the player.
2. Because this email template was the special "Email Verification" template, PlayFab will then mark the player's email as Verified.
3. PlayFab will return a redirect URL sending the player to the callback URL website. On this website you can show a static "Thanks for verifying your email" message, or something more elaborate. The redirect URL will look something like "http://www.example.com/?token=2346241B7C277796".

Go ahead and click the URL in the email. You will be taken to the "example.com" website. If you then view your player profile using the Game Manager, you will see that the Verified status has changed.

![Game Manager - Player Profile - Contact email](media/tutorials/game-manager-player-profile-contact-email-verification-confirmed.png)  

## Conclusion

So that's it for this tutorial. You've seen how to setup your SMTP server, create an email template, and create a rule that sends an email to a player verifying their email address. If you have any questions or feedback on this tutorial, please email us at [devrel@playfab.com](mailto:devrel@playfab.com).
