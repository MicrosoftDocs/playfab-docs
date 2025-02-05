---
author: jasonsandlin
title: "PFInventoryRedemptionFailure"
description: "PFInventoryRedemptionFailure data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFInventoryRedemptionFailure  

PFInventoryRedemptionFailure data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedemptionFailure {  
    const char* failureCode;  
    const char* failureDetails;  
    const char* marketplaceAlternateId;  
    const char* marketplaceTransactionId;  
} PFInventoryRedemptionFailure;  
```
  
### Members  
  
**`failureCode`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The marketplace failure code.
  
**`failureDetails`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The marketplace error details explaining why the offer failed to redeem.
  
**`marketplaceAlternateId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Marketplace Alternate ID being redeemed.
  
**`marketplaceTransactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transaction id in the external marketplace.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
