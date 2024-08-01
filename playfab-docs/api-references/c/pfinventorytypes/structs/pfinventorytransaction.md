---
author: jasonsandlin
title: "PFInventoryTransaction"
description: "PFInventoryTransaction data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransaction  

PFInventoryTransaction data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransaction {  
    const char* apiName;  
    const char* itemType;  
    PFInventoryTransactionOperation const* operations;  
    uint32_t operationsCount;  
    const char* operationType;  
    PFInventoryTransactionPurchaseDetails const* purchaseDetails;  
    PFInventoryTransactionRedeemDetails const* redeemDetails;  
    time_t timestamp;  
    const char* transactionId;  
    PFInventoryTransactionTransferDetails const* transferDetails;  
} PFInventoryTransaction;  
```
  
### Members  
  
**`apiName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The API call that caused this transaction.
  
**`itemType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type of item that the the operation occurred on.
  
**`operations`** &nbsp; [PFInventoryTransactionOperation](pfinventorytransactionoperation.md) const*  
*may be nullptr*  
  
(Optional) The operations that occurred.
  
**`operationsCount`** &nbsp; uint32_t  
  
Count of operations
  
**`operationType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type of operation that was run.
  
**`purchaseDetails`** &nbsp; [PFInventoryTransactionPurchaseDetails](pfinventorytransactionpurchasedetails.md) const*  
*may be nullptr*  
  
(Optional) Additional details about the transaction. Null if it was not a purchase operation.
  
**`redeemDetails`** &nbsp; [PFInventoryTransactionRedeemDetails](pfinventorytransactionredeemdetails.md) const*  
*may be nullptr*  
  
(Optional) Additional details about the transaction. Null if it was not a redeem operation.
  
**`timestamp`** &nbsp; time_t  
  
The time this transaction occurred in UTC.
  
**`transactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the transaction. This should be treated like an opaque token.
  
**`transferDetails`** &nbsp; [PFInventoryTransactionTransferDetails](pfinventorytransactiontransferdetails.md) const*  
*may be nullptr*  
  
(Optional) Additional details about the transaction. Null if it was not a transfer operation.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
