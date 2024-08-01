---
author: jasonsandlin
title: "PFProfilesEntityProfileBody"
description: "PFProfilesEntityProfileBody data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityProfileBody  

PFProfilesEntityProfileBody data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityProfileBody {  
    const char* avatarUrl;  
    time_t created;  
    const char* displayName;  
    PFEntityKey const* entity;  
    const char* entityChain;  
    const char* const* experimentVariants;  
    uint32_t experimentVariantsCount;  
    PFProfilesEntityProfileFileMetadataDictionaryEntry const* files;  
    uint32_t filesCount;  
    const char* language;  
    PFEntityLineage const* lineage;  
    PFProfilesEntityDataObjectDictionaryEntry const* objects;  
    uint32_t objectsCount;  
    PFProfilesEntityPermissionStatement const* permissions;  
    uint32_t permissionsCount;  
    PFProfilesEntityStatisticValueDictionaryEntry const* statistics;  
    uint32_t statisticsCount;  
    int32_t versionNumber;  
} PFProfilesEntityProfileBody;  
```
  
### Members  
  
**`avatarUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Avatar URL for the entity.
  
**`created`** &nbsp; time_t  
  
The creation time of this profile in UTC.
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The display name of the entity. This field may serve different purposes for different entity types. i.e.: for a title player account it could represent the display name of the player, whereas on a character it could be character's name.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`entityChain`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The chain of responsibility for this entity. Use Lineage.
  
**`experimentVariants`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The experiment variants of this profile.
  
**`experimentVariantsCount`** &nbsp; uint32_t  
  
Count of experimentVariants
  
**`files`** &nbsp; PFProfilesEntityProfileFileMetadataDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The files on this profile.
  
**`filesCount`** &nbsp; uint32_t  
  
Count of files
  
**`language`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The language on this profile.
  
**`lineage`** &nbsp; [PFEntityLineage](../../pftypes/structs/pfentitylineage.md) const*  
*may be nullptr*  
  
(Optional) The lineage of this profile.
  
**`objects`** &nbsp; PFProfilesEntityDataObjectDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The objects on this profile.
  
**`objectsCount`** &nbsp; uint32_t  
  
Count of objects
  
**`permissions`** &nbsp; [PFProfilesEntityPermissionStatement](pfprofilesentitypermissionstatement.md) const*  
*may be nullptr*  
  
(Optional) The permissions that govern access to this entity profile and its properties. Only includes permissions set on this profile, not global statements from titles and namespaces.
  
**`permissionsCount`** &nbsp; uint32_t  
  
Count of permissions
  
**`statistics`** &nbsp; PFProfilesEntityStatisticValueDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The statistics on this profile.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
**`versionNumber`** &nbsp; int32_t  
  
The version number of the profile in persistent storage at the time of the read. Used for optional optimistic concurrency during update.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
