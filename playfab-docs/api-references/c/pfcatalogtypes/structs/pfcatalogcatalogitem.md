---
author: jasonsandlin
title: "PFCatalogCatalogItem"
description: "PFCatalogCatalogItem data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCatalogItem  

PFCatalogCatalogItem data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogItem {  
    PFCatalogCatalogAlternateId const* alternateIds;  
    uint32_t alternateIdsCount;  
    PFCatalogContent const* contents;  
    uint32_t contentsCount;  
    const char* contentType;  
    time_t const* creationDate;  
    PFEntityKey const* creatorEntity;  
    PFCatalogDeepLink const* deepLinks;  
    uint32_t deepLinksCount;  
    const char* defaultStackId;  
    uint32_t descriptionCount;  
    PFJsonObject displayProperties;  
    const char* displayVersion;  
    time_t const* endDate;  
    const char* eTag;  
    const char* id;  
    PFCatalogImage const* images;  
    uint32_t imagesCount;  
    bool const* isHidden;  
    PFCatalogCatalogItemReference const* itemReferences;  
    uint32_t itemReferencesCount;  
    uint32_t keywordsCount;  
    time_t const* lastModifiedDate;  
    PFCatalogModerationState const* moderation;  
    const char* const* platforms;  
    uint32_t platformsCount;  
    PFCatalogCatalogPriceOptions const* priceOptions;  
    PFCatalogRating const* rating;  
    time_t const* startDate;  
    PFCatalogStoreDetails const* storeDetails;  
    const char* const* tags;  
    uint32_t tagsCount;  
    uint32_t titleCount;  
    const char* type;  
} PFCatalogCatalogItem;  
```
  
### Members  
  
**`alternateIds`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*array of size `alternateIdsCount`*  
  
(Optional) The alternate IDs associated with this item.
  
**`alternateIdsCount`** &nbsp; uint32_t  
  
Count of alternateIds
  
**`contents`** &nbsp; [PFCatalogContent](pfcatalogcontent.md) const*  
*array of size `contentsCount`*  
  
(Optional) The set of contents associated with this item.
  
**`contentsCount`** &nbsp; uint32_t  
  
Count of contents
  
**`contentType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The client-defined type of the item.
  
**`creationDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date and time when this item was created.
  
**`creatorEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The ID of the creator of this catalog item.
  
**`deepLinks`** &nbsp; [PFCatalogDeepLink](pfcatalogdeeplink.md) const*  
*array of size `deepLinksCount`*  
  
(Optional) The set of platform specific deep links for this item.
  
**`deepLinksCount`** &nbsp; uint32_t  
  
Count of deepLinks
  
**`defaultStackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Stack Id that will be used as default for this item in Inventory when an explicit one is not provided. This DefaultStackId can be a static stack id or '{guid}', which will generate a unique stack id for the item. If null, Inventory's default stack id will be used.
  
**`descriptionCount`** &nbsp; uint32_t  
*array of size `descriptionCount`*  
  
(Optional) A dictionary of localized descriptions. Key is language code and localized string is the value. The neutral locale is required.
  
**`displayProperties`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Game specific properties for display purposes. This is an arbitrary JSON blob.
  
**`displayVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The user provided version of the item for display purposes.
  
**`endDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date of when the item will cease to be available. If not provided then the product will be available indefinitely.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The current ETag value that can be used for optimistic concurrency in the If-None-Match header.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
**`images`** &nbsp; [PFCatalogImage](pfcatalogimage.md) const*  
*array of size `imagesCount`*  
  
(Optional) The images associated with this item. Images can be thumbnails or screenshots.
  
**`imagesCount`** &nbsp; uint32_t  
  
Count of images
  
**`isHidden`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates if the item is hidden.
  
**`itemReferences`** &nbsp; [PFCatalogCatalogItemReference](pfcatalogcatalogitemreference.md) const*  
*array of size `itemReferencesCount`*  
  
(Optional) The item references associated with this item.
  
**`itemReferencesCount`** &nbsp; uint32_t  
  
Count of itemReferences
  
**`keywordsCount`** &nbsp; uint32_t  
*array of size `keywordsCount`*  
  
(Optional) A dictionary of localized keywords. Key is language code and localized list of keywords is the value.
  
**`lastModifiedDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date and time this item was last updated.
  
**`moderation`** &nbsp; [PFCatalogModerationState](pfcatalogmoderationstate.md) const*  
*may be nullptr*  
  
(Optional) The moderation state for this item.
  
**`platforms`** &nbsp; const char* const*  
*array of size `platformsCount`*  
  
(Optional) The platforms supported by this item.
  
**`platformsCount`** &nbsp; uint32_t  
  
Count of platforms
  
**`priceOptions`** &nbsp; [PFCatalogCatalogPriceOptions](pfcatalogcatalogpriceoptions.md) const*  
*may be nullptr*  
  
(Optional) The base price of this item.
  
**`rating`** &nbsp; [PFCatalogRating](pfcatalograting.md) const*  
*may be nullptr*  
  
(Optional) Rating summary for this item.
  
**`startDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date of when the item will be available. If not provided then the product will appear immediately.
  
**`storeDetails`** &nbsp; [PFCatalogStoreDetails](pfcatalogstoredetails.md) const*  
*may be nullptr*  
  
(Optional) Optional details for stores items.
  
**`tags`** &nbsp; const char* const*  
*array of size `tagsCount`*  
  
(Optional) The list of tags that are associated with this item.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`titleCount`** &nbsp; uint32_t  
*array of size `titleCount`*  
  
(Optional) A dictionary of localized titles. Key is language code and localized string is the value. The neutral locale is required.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The high-level type of the item. The following item types are supported: bundle, catalogItem, currency, store, ugc.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
