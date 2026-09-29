---
author: jasonsandlin
title: "PFCatalogRealMoneyPriceDetails"
description: "PFCatalogRealMoneyPriceDetails data model. The multi-currency unit price, in real money, of the item that was redeemed within an individual marketplace. Each property is a dictionary where the key is the three-letter currency code as defined in ISO 4217, and the value is the currency amount in the smallest unit (e.g. cents, pence, etc.) in accordance with ISO 4217. Example: If the product price in USD is $1.39, the dictionary entry would be: [\"USD\"] = 139. Currently, only United States Dollar (USD) is supported."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogRealMoneyPriceDetails  

PFCatalogRealMoneyPriceDetails data model. The multi-currency unit price, in real money, of the item that was redeemed within an individual marketplace. Each property is a dictionary where the key is the three-letter currency code as defined in ISO 4217, and the value is the currency amount in the smallest unit (e.g. cents, pence, etc.) in accordance with ISO 4217. Example: If the product price in USD is $1.39, the dictionary entry would be: ["USD"] = 139. Currently, only United States Dollar (USD) is supported.  

## Syntax  
  
```cpp
typedef struct PFCatalogRealMoneyPriceDetails {  
    PFInt32DictionaryEntry const* appleAppStorePrices;  
    uint32_t appleAppStorePricesCount;  
    PFInt32DictionaryEntry const* googlePlayPrices;  
    uint32_t googlePlayPricesCount;  
    PFInt32DictionaryEntry const* microsoftStorePrices;  
    uint32_t microsoftStorePricesCount;  
    PFInt32DictionaryEntry const* nintendoEShopPrices;  
    uint32_t nintendoEShopPricesCount;  
    PFInt32DictionaryEntry const* playStationStorePrices;  
    uint32_t playStationStorePricesCount;  
    PFInt32DictionaryEntry const* steamPrices;  
    uint32_t steamPricesCount;  
} PFCatalogRealMoneyPriceDetails;  
```
  
### Members  
  
**`appleAppStorePrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'AppleAppStore' price amount per CurrencyCode. 'USD' supported only.
  
**`appleAppStorePricesCount`** &nbsp; uint32_t  
  
Count of appleAppStorePrices
  
**`googlePlayPrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'GooglePlay' price amount per CurrencyCode. 'USD' supported only.
  
**`googlePlayPricesCount`** &nbsp; uint32_t  
  
Count of googlePlayPrices
  
**`microsoftStorePrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'MicrosoftStore' price amount per CurrencyCode. 'USD' supported only.
  
**`microsoftStorePricesCount`** &nbsp; uint32_t  
  
Count of microsoftStorePrices
  
**`nintendoEShopPrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'NintendoEShop' price amount per CurrencyCode. 'USD' supported only.
  
**`nintendoEShopPricesCount`** &nbsp; uint32_t  
  
Count of nintendoEShopPrices
  
**`playStationStorePrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'PlayStationStore' price amount per CurrencyCode. 'USD' supported only.
  
**`playStationStorePricesCount`** &nbsp; uint32_t  
  
Count of playStationStorePrices
  
**`steamPrices`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The 'Steam' price amount per CurrencyCode. 'USD' supported only.
  
**`steamPricesCount`** &nbsp; uint32_t  
  
Count of steamPrices
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
