---
title: Economy v2 deep links
author: cybtachyon
description: Introduction to Economy v2 deep links and best practices.
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, localization, internationalization, i8n
ms.localizationpriority: medium
---

# Deep links

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Deep links allow you to directly link to each supported platform's store when making a purchase.

* Allow players to "click an advertisement" directly to an in-game item
* Make it easy to install UGC items from a browser
* Link to lore or app pages based on item ID

You can configure deep link formats by platform on the **Economy** > **Catalog (v2)** > **Economy Settings** page in game manager.

* A deep link platform must be **a platform already defined in your catalog settings**.
* A deep link format must include **the template string `{id}`**. This string will be replaced by the item GUID when calling the PlayFab API.

## Example

> [!TIP]
> Verify and test your deep link format before deploying - some Platforms have different formats for testing and production environments. For example, the Google Play Store needs your package name for production environments (`com.example.android`).

| Platform             | Format                                          |
| -------------------- | ----------------------------------------------- |
| `mygame-internal`    | `mygame://journal/?ID={id}`                     |
| `mygame-website`     | `https://mygame.com/world/{id}`                 |
| `microsoft`          | `ms-windows-store://pdp/?ProductId={id}`        |
| `microsoft-review`   | `ms-windows-store://review/?ProductId={id}`     |
| `microsoft-xbox-pc`  | `msxbox://game/?productId={id}`                 |
| `android-googleplay` | `market://details?id={{PackageNameHere}}.{id}`  |
| `apple-appstore`     | `itms-apps://itunes.apple.com/app/{id}`         |

> [!NOTE]
> Nintendo and Sony do not provide their store schemas publicly as of this writing. You will need a developer account to access their platform link schema documentation.
