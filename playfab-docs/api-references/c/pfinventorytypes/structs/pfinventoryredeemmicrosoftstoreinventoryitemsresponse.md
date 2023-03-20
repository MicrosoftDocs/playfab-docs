---
author: jasonsandlin
title: "PFInventoryRedeemMicrosoftStoreInventoryItemsResponse"
description: "PFInventoryRedeemMicrosoftStoreInventoryItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryRedeemMicrosoftStoreInventoryItemsResponse  

PFInventoryRedeemMicrosoftStoreInventoryItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemMicrosoftStoreInventoryItemsResponse {  
    PFInventoryRedemptionFailure const* failed;  
    uint32_t failedCount;  
    PFInventoryRedemptionSuccess const* succeeded;  
    uint32_t succeededCount;  
    const char* const* transactionIds;  
    uint32_t transactionIdsCount;  
} PFInventoryRedeemMicrosoftStoreInventoryItemsResponse;  
```
  
### Members  
  
**`failed`** &nbsp; [PFInventoryRedemptionFailure](pfinventoryredemptionfailure.md) const*  
*array of size `failedCount`*  
  
(Optional) The list of failed redemptions from the external marketplace.
  
**`failedCount`** &nbsp; uint32_t  
  
Count of failed
  
**`succeeded`** &nbsp; [PFInventoryRedemptionSuccess](pfinventoryredemptionsuccess.md) const*  
*array of size `succeededCount`*  
  
(Optional) The list of successful redemptions from the external marketplace.
  
**`succeededCount`** &nbsp; uint32_t  
  
Count of succeeded
  
**`transactionIds`** &nbsp; const char* const*  
*array of size `transactionIdsCount`*  
  
(Optional) The Transaction IDs associated with the inventory modifications.
  
**`transactionIdsCount`** &nbsp; uint32_t  
  
Count of transactionIds
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
