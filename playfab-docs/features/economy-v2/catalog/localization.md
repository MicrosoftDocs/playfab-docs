---
title: Economy v2 Localization
author: cybtachyon
description: Economy v2 Localization Documentation
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, localization, internationalization, i8n
ms.localizationpriority: medium
---

# Economy v2 Localization

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Simple localization is supported by using locale keys in your _Title_, _Description_, and _Keywords_ fields for Catalog Items. Both Game Manager and all Catalog Item API calls expose these fields.

You can see suggested ISO-639-1 [language codes on the Microsoft Support site](https://support.microsoft.com/topic/country-region-and-language-codes-add36afe-804a-44f1-ae68-cfb9c9b72f8b).

> [!TIP]
> Setting up player accounts for a third party translation services to use with the API can save time during development. Set the Economy v2 Settings policies to allow item updates for that player ID.

## Localization Example

```json
{
    "Title": {
        "NEUTRAL": "My Amazing Fire Weapon",
        "en-US": "My Lit Lit Weapon",
        "en-GB": "My Brilliant Flaming Weapon",
        "fr-FR": "Mon Arme Enflammé Extraordinaire",
        "zh-CHS": "我的神奇火之武器",
        "ja-JP": "私の驚くべき炎の武器",
        "pg-BR": "Minha Arma de Fogo Incrível",
        "ru-RU": "Мое потрясающий огненное оружие",
        "ko-KR": "내 놀라운 화재 무기",
        "de-DE": "Meine Uberfeuerklingenwaffen",
        "it-IT": "Mie Armi di Fuoco Incredibile"
    },
    "Keywords": {
        "NEUTRAL": { "Values": [ "fire","weapon" ] },
        "en-US": { "Values": [ "fire","weapon" ] },
        "fr-FR": { "Values": [ "enflammé", "arme" ] },
        "de-DE": { "Values":[ "feuer","klingenwaffen" ] }
    }
}
```
