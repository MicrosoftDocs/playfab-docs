---
author: jasonsandlin
title: "PFCatalogCatalogPrice"
description: "PFCatalogCatalogPrice data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogPrice  

PFCatalogCatalogPrice data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogPrice {  
    PFCatalogCatalogPriceAmount const* amounts;  
    uint32_t amountsCount;  
    int32_t const* unitAmount;  
    double const* unitDurationInSeconds;  
} PFCatalogCatalogPrice;  
```
  
### Members  
  
**`amounts`** &nbsp; [PFCatalogCatalogPriceAmount](pfcatalogcatalogpriceamount.md) const*  
*may be nullptr*  
  
(Optional) The amounts of the catalog item price. Each price can have up to 15 item amounts.
  
**`amountsCount`** &nbsp; uint32_t  
  
Count of amounts
  
**`unitAmount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The per-unit amount this price can be used to purchase.
  
**`unitDurationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The per-unit duration this price can be used to purchase. The maximum duration is 100 years.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
