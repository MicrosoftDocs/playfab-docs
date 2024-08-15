---
author: jasonsandlin
title: "PFInventoryTransactionRedeemDetails"
description: "PFInventoryTransactionRedeemDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransactionRedeemDetails  

PFInventoryTransactionRedeemDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionRedeemDetails {  
    const char* marketplace;  
    const char* marketplaceTransactionId;  
    const char* offerId;  
} PFInventoryTransactionRedeemDetails;  
```
  
### Members  
  
**`marketplace`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The marketplace that the offer is being redeemed from.
  
**`marketplaceTransactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transaction Id returned from the marketplace.
  
**`offerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The offer Id of the item being redeemed.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
