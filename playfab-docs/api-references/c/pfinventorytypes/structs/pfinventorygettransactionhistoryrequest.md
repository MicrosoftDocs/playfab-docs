---
author: jasonsandlin
title: "PFInventoryGetTransactionHistoryRequest"
description: "PFInventoryGetTransactionHistoryRequest data model. Get transaction history for specified entity and collection."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetTransactionHistoryRequest  

PFInventoryGetTransactionHistoryRequest data model. Get transaction history for specified entity and collection.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetTransactionHistoryRequest {  
    const char* collectionId;  
    const char* continuationToken;  
    int32_t count;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
} PFInventoryGetTransactionHistoryRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available. Should be null on initial request.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. This value is optional. The default value is 10.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData filter used to refine the TransactionHistory. Transaction properties 'timestamp', 'transactionid', 'apiname' and 'operationtype' can be used in the filter. Properties 'transactionid', 'apiname', and 'operationtype' cannot be used together in a single request. The 'timestamp' property can be combined with 'apiname' or 'operationtype' in a single request. For example: "timestamp ge 2023-06-20T23:30Z" or "transactionid eq '10'" or "(timestamp ge 2023-06-20T23:30Z) and (apiname eq 'AddInventoryItems')". By default, a 6 month timespan from the current date is used.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
