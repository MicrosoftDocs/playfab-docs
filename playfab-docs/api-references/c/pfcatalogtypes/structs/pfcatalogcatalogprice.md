---
author: jasonsandlin
title: "PFCatalogCatalogPrice"
description: "PFCatalogCatalogPrice data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFCatalogCatalogPrice  

PFCatalogCatalogPrice data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogPrice {  
    PFCatalogCatalogPriceAmount const* amounts;  
    uint32_t amountsCount;  
    double const* unitDurationInSeconds;  
} PFCatalogCatalogPrice;  
```
  
### Members  
  
**`amounts`** &nbsp; [PFCatalogCatalogPriceAmount](pfcatalogcatalogpriceamount.md) const*  
*may be nullptr*  
  
(Optional) The amounts of the catalog item price. Each price can have up to 15 item amounts.
  
**`amountsCount`** &nbsp; uint32_t  
  
Count of amounts
  
**`unitDurationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The per-unit duration this price can be used to purchase. The maximum duration is 100 years.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
