---
author: jasonsandlin
title: "PFCatalogCatalogConfig"
description: "PFCatalogCatalogConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogConfig  

PFCatalogCatalogConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogConfig {  
    PFEntityKey const* adminEntities;  
    uint32_t adminEntitiesCount;  
    PFCatalogCatalogSpecificConfig const* catalog;  
    PFCatalogDeepLinkFormat const* deepLinkFormats;  
    uint32_t deepLinkFormatsCount;  
    PFCatalogDisplayPropertyIndexInfo const* displayPropertyIndexInfos;  
    uint32_t displayPropertyIndexInfosCount;  
    PFCatalogFileConfig const* file;  
    PFCatalogImageConfig const* image;  
    bool isCatalogEnabled;  
    const char* const* platforms;  
    uint32_t platformsCount;  
    PFEntityKey const* reviewerEntities;  
    uint32_t reviewerEntitiesCount;  
    PFCatalogUserGeneratedContentSpecificConfig const* userGeneratedContent;  
} PFCatalogCatalogConfig;  
```
  
### Members  
  
**`adminEntities`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) A list of player entity keys that will have admin permissions. There is a maximum of 64 entities that can be added.
  
**`adminEntitiesCount`** &nbsp; uint32_t  
  
Count of adminEntities
  
**`catalog`** &nbsp; [PFCatalogCatalogSpecificConfig](pfcatalogcatalogspecificconfig.md) const*  
*may be nullptr*  
  
(Optional) The set of configuration that only applies to catalog items.
  
**`deepLinkFormats`** &nbsp; [PFCatalogDeepLinkFormat](pfcatalogdeeplinkformat.md) const*  
*may be nullptr*  
  
(Optional) A list of deep link formats. Up to 10 can be added.
  
**`deepLinkFormatsCount`** &nbsp; uint32_t  
  
Count of deepLinkFormats
  
**`displayPropertyIndexInfos`** &nbsp; [PFCatalogDisplayPropertyIndexInfo](pfcatalogdisplaypropertyindexinfo.md) const*  
*may be nullptr*  
  
(Optional) A list of display properties to index. Up to 5 mappings can be added per Display Property Type. More info on display properties can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/content-types-tags-and-properties#displayproperties.
  
**`displayPropertyIndexInfosCount`** &nbsp; uint32_t  
  
Count of displayPropertyIndexInfos
  
**`file`** &nbsp; [PFCatalogFileConfig](pfcatalogfileconfig.md) const*  
*may be nullptr*  
  
(Optional) The set of configuration that only applies to Files.
  
**`image`** &nbsp; [PFCatalogImageConfig](pfcatalogimageconfig.md) const*  
*may be nullptr*  
  
(Optional) The set of configuration that only applies to Images.
  
**`isCatalogEnabled`** &nbsp; bool  
  
Flag defining whether catalog is enabled.
  
**`platforms`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) A list of Platforms that can be applied to catalog items. Each platform can have a maximum character length of 40 and up to 128 platforms can be listed.
  
**`platformsCount`** &nbsp; uint32_t  
  
Count of platforms
  
**`reviewerEntities`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) A set of player entity keys that are allowed to review content. There is a maximum of 128 entities that can be added.
  
**`reviewerEntitiesCount`** &nbsp; uint32_t  
  
Count of reviewerEntities
  
**`userGeneratedContent`** &nbsp; [PFCatalogUserGeneratedContentSpecificConfig](pfcatalogusergeneratedcontentspecificconfig.md) const*  
*may be nullptr*  
  
(Optional) The set of configuration that only applies to user generated contents.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
