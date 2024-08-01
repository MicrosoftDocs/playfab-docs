---
author: jasonsandlin
title: "PFInventoryGooglePlayProductPurchase"
description: "PFInventoryGooglePlayProductPurchase data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGooglePlayProductPurchase  

PFInventoryGooglePlayProductPurchase data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryGooglePlayProductPurchase {  
    const char* productId;  
    const char* token;  
} PFInventoryGooglePlayProductPurchase;  
```
  
### Members  
  
**`productId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Product ID (SKU) of the InApp product purchased from the Google Play store.
  
**`token`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The token provided to the player's device when the product was purchased.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
