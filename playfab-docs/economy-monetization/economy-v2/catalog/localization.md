---
title: Economy v2 Localization
author: fprotti96
description: Economy v2 Localization Documentation
ms.author: fprotti
ms.date: 11/21/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, localization, internationalization, i8n
ms.localizationpriority: medium
---

# Economy v2 Localization

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Simple localization is supported by using locale keys in your _Title_, _Description_, and _Keywords_ fields for Catalog Items. Both Game Manager and all Catalog Item API calls expose these fields.

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
        "zh-CN": "我的神奇火之武器",
        "ja-JP": "私の驚くべき炎の武器",
        "pt-PT": "Minha Arma de Fogo Incrível",
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

## Localization in Search

Our [SearchItems API](/rest/api/playfab/economy/catalog/search-items) now accepts a new **Language** parameter. Setting a language filter changes the language analyzer(s) being used to the languages provided.

An example `SearchItems` request:

```json
{
  "Search": "Pirates",
  "Filter": "Tags/any(t:t eq 'desert') and ContentType eq 'map'",
  "OrderBy": "lastModifiedDate asc",
  "ContinuationToken": "abc=",
  "Language": "en-GB"
} 
```

> [!NOTE]
> For more information about searching, see [Search](../catalog/search.md).

## Supported Locale Codes

The following list contains all the locale codes that are supported based on ISO-631-1.

|  A-I  |  J-Z  |
| ----- | ----- |
| ar-SA | ja-JP |
| bg-BG | ko-KR |
| cs-CZ | nb-NO |
| da-DK | nl-NL |
| de-DE | pl-PL |
| el-GR | pt-BR |
| en-GB | pt-PT |
| en-US | ro-RO |
| es-ES | ru-RU |
| es-MX | sk-SK |
| fi-FI | sv-SE |
| fr-CA | th-TH |
| fr-FR | tr-TR |
| he-IL | uk-UA |
| hi-IN | zh-CN |
| hu-HU | zh-TW |
| id-ID |       |     
| it-IT |       |