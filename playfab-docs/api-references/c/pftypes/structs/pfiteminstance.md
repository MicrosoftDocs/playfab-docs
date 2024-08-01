---
author: jasonsandlin
title: "PFItemInstance"
description: "PFItemInstance data model. A unique instance of an item in a user's inventory. Note, to retrieve additional information for an item such as Tags, Description that are the same across all instances of the item, a call to GetCatalogItems is required. The ItemID of can be matched to a catalog entry, which contains the additional information. Also note that Custom Data is only set when the User's specific instance has updated the CustomData via a call to UpdateUserInventoryItemCustomData. Other fields such as UnitPrice and UnitCurrency are only set when the item was granted via a purchase."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFItemInstance  

PFItemInstance data model. A unique instance of an item in a user's inventory. Note, to retrieve additional information for an item such as Tags, Description that are the same across all instances of the item, a call to GetCatalogItems is required. The ItemID of can be matched to a catalog entry, which contains the additional information. Also note that Custom Data is only set when the User's specific instance has updated the CustomData via a call to UpdateUserInventoryItemCustomData. Other fields such as UnitPrice and UnitCurrency are only set when the item was granted via a purchase.  

## Syntax  
  
```cpp
typedef struct PFItemInstance {  
    const char* annotation;  
    const char* const* bundleContents;  
    uint32_t bundleContentsCount;  
    const char* bundleParent;  
    const char* catalogVersion;  
    PFStringDictionaryEntry const* customData;  
    uint32_t customDataCount;  
    const char* displayName;  
    time_t const* expiration;  
    const char* itemClass;  
    const char* itemId;  
    const char* itemInstanceId;  
    time_t const* purchaseDate;  
    int32_t const* remainingUses;  
    const char* unitCurrency;  
    uint32_t unitPrice;  
    int32_t const* usesIncrementedBy;  
} PFItemInstance;  
```
  
### Members  
  
**`annotation`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Game specific comment associated with this instance when it was added to the user inventory.
  
**`bundleContents`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Array of unique items that were awarded when this catalog item was purchased.
  
**`bundleContentsCount`** &nbsp; uint32_t  
  
Count of bundleContents
  
**`bundleParent`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique identifier for the parent inventory item, as defined in the catalog, for object which were added from a bundle or container.
  
**`catalogVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Catalog version for the inventory item, when this instance was created.
  
**`customData`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) A set of custom key-value pairs on the instance of the inventory item, which is not to be confused with the catalog item's custom data.
  
**`customDataCount`** &nbsp; uint32_t  
  
Count of customData
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) CatalogItem.DisplayName at the time this item was purchased.
  
**`expiration`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Timestamp for when this instance will expire.
  
**`itemClass`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Class name for the inventory item, as defined in the catalog.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique identifier for the inventory item, as defined in the catalog.
  
**`itemInstanceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique item identifier for this specific instance of the item.
  
**`purchaseDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Timestamp for when this instance was purchased.
  
**`remainingUses`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Total number of remaining uses, if this is a consumable item.
  
**`unitCurrency`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Currency type for the cost of the catalog item. Not available when granting items.
  
**`unitPrice`** &nbsp; uint32_t  
  
Cost of the catalog item in the given currency. Not available when granting items.
  
**`usesIncrementedBy`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The number of uses that were added or removed to this item in this call.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
