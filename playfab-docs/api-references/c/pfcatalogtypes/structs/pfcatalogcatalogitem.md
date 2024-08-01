---
author: jasonsandlin
title: "PFCatalogCatalogItem"
description: "PFCatalogCatalogItem data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
    PFStringDictionaryEntry const* description;  
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
    PFCatalogKeywordSetDictionaryEntry const* keywords;  
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
    PFStringDictionaryEntry const* title;  
    uint32_t titleCount;  
    const char* type;  
} PFCatalogCatalogItem;  
```
  
### Members  
  
**`alternateIds`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) The alternate IDs associated with this item. An alternate ID can be set to 'FriendlyId' or any of the supported marketplace names.
  
**`alternateIdsCount`** &nbsp; uint32_t  
  
Count of alternateIds
  
**`contents`** &nbsp; [PFCatalogContent](pfcatalogcontent.md) const*  
*may be nullptr*  
  
(Optional) The set of content/files associated with this item. Up to 100 files can be added to an item.
  
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
*may be nullptr*  
  
(Optional) The set of platform specific deep links for this item.
  
**`deepLinksCount`** &nbsp; uint32_t  
  
Count of deepLinks
  
**`defaultStackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Stack Id that will be used as default for this item in Inventory when an explicit one is not provided. This DefaultStackId can be a static stack id or '{guid}', which will generate a unique stack id for the item. If null, Inventory's default stack id will be used.
  
**`description`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) A dictionary of localized descriptions. Key is language code and localized string is the value. The NEUTRAL locale is required. Descriptions have a 10000 character limit per country code.
  
**`descriptionCount`** &nbsp; uint32_t  
  
Count of description
  
**`displayProperties`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Game specific properties for display purposes. This is an arbitrary JSON blob. The Display Properties field has a 10000 byte limit per item.
  
**`displayVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The user provided version of the item for display purposes. Maximum character length of 50.
  
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
*may be nullptr*  
  
(Optional) The images associated with this item. Images can be thumbnails or screenshots. Up to 100 images can be added to an item. Only .png, .jpg, .gif, and .bmp file types can be uploaded.
  
**`imagesCount`** &nbsp; uint32_t  
  
Count of images
  
**`isHidden`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates if the item is hidden.
  
**`itemReferences`** &nbsp; [PFCatalogCatalogItemReference](pfcatalogcatalogitemreference.md) const*  
*may be nullptr*  
  
(Optional) The item references associated with this item. For example, the items in a Bundle/Store/Subscription. Every item can have up to 50 item references.
  
**`itemReferencesCount`** &nbsp; uint32_t  
  
Count of itemReferences
  
**`keywords`** &nbsp; PFCatalogKeywordSetDictionaryEntry const*  
*may be nullptr*  
  
(Optional) A dictionary of localized keywords. Key is language code and localized list of keywords is the value. Keywords have a 50 character limit per keyword and up to 32 keywords can be added per country code.
  
**`keywordsCount`** &nbsp; uint32_t  
  
Count of keywords
  
**`lastModifiedDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date and time this item was last updated.
  
**`moderation`** &nbsp; [PFCatalogModerationState](pfcatalogmoderationstate.md) const*  
*may be nullptr*  
  
(Optional) The moderation state for this item.
  
**`platforms`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The platforms supported by this item.
  
**`platformsCount`** &nbsp; uint32_t  
  
Count of platforms
  
**`priceOptions`** &nbsp; [PFCatalogCatalogPriceOptions](pfcatalogcatalogpriceoptions.md) const*  
*may be nullptr*  
  
(Optional) The prices the item can be purchased for.
  
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
*may be nullptr*  
  
(Optional) The list of tags that are associated with this item. Up to 32 tags can be added to an item.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`title`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) A dictionary of localized titles. Key is language code and localized string is the value. The NEUTRAL locale is required. Titles have a 512 character limit per country code.
  
**`titleCount`** &nbsp; uint32_t  
  
Count of title
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The high-level type of the item. The following item types are supported: bundle, catalogItem, currency, store, ugc, subscription.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
