---
title: Setting default languages
author: v-rayro
description: Describes how to set the default language for a title and for players.
ms.author: v-thopra
ms.date: 02/28/2019
ms.topic: article
ms.prod: gaming
keywords: playfab, title, players, language, localization
ms.localizationpriority: medium
---

# Setting default languages

PlayFab is introducing the support for storing localized strings on behalf of game developers. In addition, we are adding the necessary logic to provide your players with the correct strings for the language they prefer.

To accomplish this, we will be leveraging two new language settings: one is associated with your title, and the other is stored on each of your players’ entity profiles:

- **Title default language**: Indicates your title’s primary supported language. Once set, we will require your title to support at least this language for features using localized strings.
- **Player language**: Indicates the player’s preferred language. Can be set per title.

Using these two settings, PlayFab logic will match up localized strings with the players who prefer that language. Players without a language preference will receive strings in your title’s specified default language.

Players with a preference for a language that your title doesn’t support will *also* receive strings, based on your title’s default language.

This tutorial walks you through how to set the default language of your title and the preferred language of your players.

## Requirements

This tutorial assumes you have the following working knowledge about using PlayFab:

- Basic knowledge of how to create a player. This is necessary, because players must *already exist* with a username and password before calling preferred language logic. Refer to [Getting started for developers](../../../personas/developer.md) for information on creating a player for the title.
- Read the [Game Manager quickstart](../../config/gamemanager/quickstart.md) if you are unfamiliar with the Game Manager, as it is the place where language information is viewed.
- Knowledge of how to work with player profiles will be necessary to confirm that a preferred language has been added to a player’s profile.
- Please take a moment to review the information provided on how to get a player’s profile in the [Getting player profiles](../../data/playerdata/getting-player-profiles.md) tutorial.

## Section 1 – Player’s preferred language

Before setting your player’s preferred language, figure out how you want to collect it. You have a couple of options:

- Ask them: Add an option on your game’s menu.
- Intuit their language: Use the language of the player’s device by calling the provided platform **API** (for example, **Locale.getDefault.getLanguage()** for **Android**).

> [!NOTE]
> There are a lot of languages out there, and your title *may not* support them all. While not required, we recommend future-proofing your title, and storing the player’s actual preference. If you come back and add support for that language later, PlayFab’s logic will automatically start serving up the new strings (rather than the default).

### Step 1 – Set the language

￼PlayFab allows you to choose from a specific list of languages to support. You can make a call to the **GetLanguageList()** method to see the language codes.

First, we will update a player’s profile to include the language in which they would prefer to get content from your title.

### C# Code Example

```csharp
void SetProfileLanguage(string language, int? profileExpectedVersion, EntityKey entity)
{
    var request = new SetProfileLanguageRequest
    {
        Language = language,
        ExpectedVersion = profileExpectedVersion,
        Entity = entity
    };
    PlayFabProfilesAPI.SetProfileLanguage(request, res =>
    {
        Debug.Log("The language on the entity's profile has been updated.");
    }, FailureCallback);
}

void FailureCallback(PlayFabError error)
{
    Debug.LogWarning("Something went wrong with your API call. Here's some debug information:");
    Debug.LogError(error.GenerateErrorReport());
}
```

### Step 2 – See that the language was updated

Go to the player’s overview. In Game Manager, go to **Player** -> **Overview**, and see that their contact info section is updated with their preferred language.

![Game Manager - Player - Overview - Contact email - Language](../media/tutorials/game-manager-player-overview-contact-email-language.png)

The language can also be updated with the **Language** dropdown displayed in the previous image.

Next, you can navigate to the player’s **PlayStream**, and it will show an **Entity language updated** event.

![Game Manager - Players - PlayStream - Entity Language Updated event](../media/tutorials/game-manager-players-playstream-entity-language-updated-event.png)

Selecting the info icon on the event should show JSON similar the example shown below.

```json
{
    "EventName": "entity_language_updated",
    "Source": "PlayFab",
    "Language": "en",
    "EntityChain": "title_player_account!4CDA57A14A596E70/<YourTitleId>/C9458B4D3A115F4B/36163DA3783B0C8A/",
    "EntityLineage": {
        "NamespaceId": "4CDA57A14A596E70",
        "TitleId": "YourTitleId",
        "MasterPlayerAccountId": "C9458B4D3A115F4B",
        "TitlePlayerAccountId": "36163DA3783B0C8A",
        "CharacterId": null,
        "GroupId": null
    },
    "EventNamespace": "com.playfab",
    "EventId": "f643e22a2a76462aaeaa3469afa31434",
    "EntityType": "title_player_account",
    "EntityId": "36163DA3783B0C8A",
    "SourceType": "BackEnd",
    "Timestamp": "2018-08-24T18:49:47.8755292Z",
    "History": null,
    "CustomTags": null,
    "Reserved": null
}
```

## Section 2 – Set a title default language

The next thing we will do is set a default language for your title. All localization features will now associate a language with every translated version of the content.

The title requires a default language, so that if any player doesn’t have a preferred language set, or their preferred language isn’t supported, they can still receive the default version of the content.

To begin, select **Settings** in the menu to the left, as shown below.

![Game Manager - Settings - General - Default language](../media/tutorials/game-manager-settings-general-default-language.png)

Under the new **TITLE DEFAULTS** header, you will see the **Default language** dropdown. You must set a default language before you can use any of the add localization features.

Select the **SAVE** button, and message will appear stating that your update was successful.

If you return to the dashboard, you will see a **Title API settings changed** event in your **PlayStream** event list, as shown below.

![PlayStream - Title API Setting Changed](../media/tutorials/playstream-title-api-settings-changed.png)

Selecting the **info icon** on the event should display JSON similar to the example provided below.

```json
{
    "EventName": "title_api_settings_changed",
    "PreviousSettingsValues": {
        "DefaultLanguage": null
    },
    "SettingsValues": {
        "DefaultLanguage": "en"
    },
    "UserId": "EAF83D52E282C291",
    "DeveloperId": null,
    "EventNamespace": "com.playfab",
    "EntityType": "title",
    "Source": "PlayFab",
    "EventId": "108849a5e1424051b42256bc75b2e34b",
    "EntityId": "YourTitleId",
    "SourceType": "BackEnd",
    "Timestamp": "2018-08-24T21:51:02.2215614Z",
    "History": null,
    "CustomTags": null,
    "Reserved": null
}
```

## Section 3 – Updating a title default language

It is important to remember that setting a default for your title tells PlayFab to use that language when you issue communications to players who *don’t* have a preferred language set (or have chosen a language which doesn’t match one you support).

Because the title’s default is used as a *fallback* language, PlayFab will expect that all your communications support your default language.

> [!NOTE]
> You can *always* change your title default, but PlayFab will require that your current communications templates support the language you’re changing to.
  
If you update your title’s default language, you’ll see that the interface now shows an **Edit** link.

![Title Defaults - Default Language](../media/tutorials/title-defaults-default-language.png)

Following this link, you will see the same dropdown as before. However, if you try to save a default language that isn’t fully supported by your email templates, you will see one or more error messages like the one shown below.

![Game manager - General - Edit Default Language](../media/tutorials/game-manager-general-edit-default-language.png)

If there are errors, you can follow the links provided to update your content to support the language which is missing. When all errors have been addressed, the default language change will be accepted.

## Conclusion

In this tutorial, you’ve seen how to set and update your title’s default language and your players’ preferred language.

If you have any questions or feedback on this tutorial, please contact us through our [forums](https://community.playfab.com/questions/ask.html) or slack channel.