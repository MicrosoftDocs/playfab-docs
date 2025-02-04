---
author: jasonsandlin
title: "PFInventoryRedemptionSuccess"
description: "PFInventoryRedemptionSuccess data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFInventoryRedemptionSuccess  

PFInventoryRedemptionSuccess data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedemptionSuccess {  
    const char* marketplaceAlternateId;  
    const char* marketplaceTransactionId;  
    time_t successTimestamp;  
} PFInventoryRedemptionSuccess;  
```
  
### Members  
  
**`marketplaceAlternateId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Marketplace Alternate ID being redeemed.
  
**`marketplaceTransactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transaction id in the external marketplace.
  
**`successTimestamp`** &nbsp; time_t  
  
The timestamp for when the redeem was completed.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
