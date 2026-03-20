---
title: Using ToxMod voice moderation
description: Information on how to use PlayFab Party's ToxMod voice moderation feature.
author: yuehanlin
ms.author: yuehanlin
ms.date: 03/04/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, voice, moderation, toxmod, safety
---

# Using ToxMod voice moderation

PlayFab Party offers a voice moderation solution powered by [Modulate's ToxMod feature](https://modulate.ai/toxmod) that proactively detects toxicity, harassment, and other harmful behavior in voice chat. When enabled, PlayFab Party automatically forwards player voice data to ToxMod for analysis. Voice chat continues to function normally for players&mdash;voice data is not interrupted or altered by the moderation process. ToxMod then provides moderation results that you can use to take action in your game.

Unlike [text moderation](concepts-text-moderation.md), which filters offensive text in real-time on the client, voice moderation analyzes voice audio streams and reports results asynchronously through ToxMod's dashboards and webhooks.

## How voice moderation works

When voice moderation is enabled for a title, PlayFab Party automatically handles the following parts of the voice moderation process:

1. **Session tracking:** Player join and leave events in a Party network are reported to ToxMod automatically.
2. **Audio forwarding:** Voice audio from each player is forwarded to ToxMod for analysis.
3. **Player identification:** The following identifiers are sent so your title can correlate ToxMod events back to PlayFab entities:
   - **playeruuid** &ndash; A UUID derived from the player's PlayFab master player account ID and the title ID.
   - **sessionuuid** &ndash; The PlayFab Party network identifier.

ToxMod analyzes the forwarded audio and provides moderation results through its online platform, which includes rich dashboards and optional webhooks. Your game's backend can consume these results to enforce moderation actions -- for example, muting or banning harmful players.

> [!NOTE]
> Voice moderation requires your networks use relayed connections rather than direct peer connections. When using the native C++ SDK, relayed connections are the default. When using the PlayFab Unreal Engine Online Subsystem plugin or PlayFab Party Unity plugin, direct peer connections are the default. For more information, see [Party and direct peer-to-peer connections](../../multiplayer/networking/concepts-direct-peer-connectivity.md). For disabling direct peer connections, see the [PlayFab Online Subsystem quickstart](../../multiplayer/networking/party-unreal-engine-oss-quickstart.md) and [Party Unity plugin quickstart](../../multiplayer/networking/party-unity-plugin-quickstart.md).

## Prerequisites

Before you begin, ensure you have:

- An active PlayFab account with a Title ID and Secret Key.
- A ToxMod Account ID and Account Key.
- PlayFab Party SDK integrated in your client application.

## Enabling voice moderation

Voice moderation does not require any client-side code changes. Once the ToxMod add-on is configured for your title, PlayFab Party automatically forwards voice data to ToxMod for analysis.

### Step 1: Configure the ToxMod add-on

Use the [Create or Update ToxMod](/rest/api/playfab/addons/addon/create-or-update-tox-mod) REST API to configure the ToxMod add-on for your title. This API requires an Entity Session Token, which you can obtain from the [GetEntityToken](/rest/api/playfab/authentication/authentication/get-entity-token) method.

```http
POST https://{titleId}.playfabapi.com/Addon/CreateOrUpdateToxMod

Headers:
  X-EntityToken: {entityToken}
  Content-Type: application/json

Body:
{
  "AccountId": "YOUR_TOXMOD_ACCOUNT_ID",
  "AccountKey": "YOUR_TOXMOD_ACCOUNT_KEY",
  "Enabled": true
}
```

### Step 2: Verify the configuration

Verify that the add-on is active by calling the [Get ToxMod](/rest/api/playfab/addons/addon/get-tox-mod) API:

```http
POST https://{titleId}.playfabapi.com/Addon/GetToxMod

Headers:
  X-EntityToken: {entityToken}
  Content-Type: application/json
```

The response should include your ToxMod account settings with `"Enabled": true`.

## Disabling voice moderation

To temporarily disable ToxMod without deleting the configuration, call the [Create or Update ToxMod](/rest/api/playfab/addons/addon/create-or-update-tox-mod) API with `Enabled` set to `false`:

```http
POST https://{titleId}.playfabapi.com/Addon/CreateOrUpdateToxMod

Headers:
  X-EntityToken: {entityToken}
  Content-Type: application/json

Body:
{
  "AccountId": "YOUR_TOXMOD_ACCOUNT_ID",
  "AccountKey": "YOUR_TOXMOD_ACCOUNT_KEY",
  "Enabled": false
}
```

To re-enable ToxMod, set `Enabled` back to `true`.

> [!NOTE]
> Enabling or disabling the ToxMod add-on controls whether voice data is forwarded to ToxMod for new Party networks. Existing networks that already have ToxMod enabled or disabled are not affected by this change. Your backend integration with ToxMod (webhooks, dashboards, enforcement logic) is configured separately.

## See also

- [Understanding how PlayFab Party chat works](concepts-chat.md)
- [Using text moderation](concepts-text-moderation.md)
- [Party overview](../../multiplayer/networking/index.md)
- [Party features](../../multiplayer/networking/party-features.md)
