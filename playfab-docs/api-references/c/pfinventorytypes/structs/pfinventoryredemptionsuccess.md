---
author: jasonsandlin
title: "PFInventoryRedemptionSuccess"
description: "PFInventoryRedemptionSuccess data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryRedemptionSuccess  

PFInventoryRedemptionSuccess data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedemptionSuccess {  
    const char* marketplaceTransactionId;  
    const char* offerId;  
    time_t successTimestamp;  
} PFInventoryRedemptionSuccess;  
```
  
### Members  
  
**`marketplaceTransactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transaction id in the external marketplace.
  
**`offerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the offer being redeemed.
  
**`successTimestamp`** &nbsp; time_t  
  
The timestamp for when the redeem was completed.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
