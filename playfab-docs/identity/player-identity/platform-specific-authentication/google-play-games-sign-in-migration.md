---
title: Migrating from Google Sign-in to Google Play Games Sign-in in Unity
author: joannaleecy
description: Overview of procedures to migrate players identities from Google Account to Google Play Games
ms.author: joanlee
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, authentication, google, unity
ms.localizationpriority: medium
---

# Migrating from Google Sign-in to Google Play Games Sign-in in Unity

## When Migration Might Be Needed

If you were previously using the PlayFab LoginWithGoogleAccount API in your Unity game on Android, you might have noticed that you can no longer acquire the ServerAuthCode needed by this API with recent versions (>= 0.11.x) of [Play Games Plugin for Unity](https://github.com/playgameservices/play-games-plugin-for-unity).

This is because in order for the PlayFab LoginWithGoogleAccount API to work, the "profile" scope is required. However, recent versions of Play Games Plugin for Unity (>= 0.11.x) don't support the ability to add additional scopes, leaving game developers with no possibility of upgrading their games to the recent version of the plugin since they depend on the LoginWithGoogleAccount API.

We're aware of this issue and have identified a way to make the PlayFab LoginWithGoogleAccount API work with version 0.11.x of Play Games Plugin for Unity. However, the recommended way of proceeding would be to migrate (link) existing players to their Play Games Profile while still in 0.10.x version, this will remove the dependency of using PlayFab LoginWithGoogleAccount API. And after some time, use the fix mentioned before as a fallback method for the remainder of the players that didn't migrate while in 0.10.x

The recommended way of proceeding is as follows:

1. While still in 0.10.x, migrate your players using the migration procedure steps below, make sure to keep track of which users have been already migrated to use LoginWithGooglePlayGamesServices. Since we require players to open the game for migrating them, there's a chance some of the players aren't effectively migrated during this period.

    [LoginWithGooglePlayGamesServices Migration Procedure steps](google-play-games-sign-in-migration-details.md)

2. For the remainder of those existing players who couldn't be migrated during that period, use the fix steps below for keep using LoginWithGoogleAccount in 0.11.x version of the plugin, this should be considered as a fallback alternative since having to log in through the browser could affect player's experience.

    [LoginWithGoogleAccount Fix Steps](google-play-games-sign-in-migration-fallback.md)
